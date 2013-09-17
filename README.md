CQCON Village RWD Overhaul
=============================

## Before

#### You will need

- CQ 5.6.1 author instance running on :4502
- [Maven](http://dev.day.com/docs/en/cq/current/core/how_to/how_to_use_the_vlttool/vlt-mavenplugin.html)

#### Install

	mvn -PautoInstallPackage clean install

## Begin

#### remove fixed width

/etc/designs/cqcon-village/clientlibs/css/style.css (line 11)
	
	div#content {
		width: 100%;


#### fix zoomed out look on mobile
- sets your layout viewport equal to the screen of the device

/apps/cqcon-village/components/page/headlibs.jsp (line 2)

	<meta name="viewport" content="width=device-width" />


#### create large screen stylesheet
- maintainability++
- breakpoint based on CONTENT

/etc/designs/cqcon-village/clientlibs/css/large-screen.css (new)

	@media only screen and (min-width: 68.75em) { /* 1100 / 16 */
		div#content {
			width: 80%;
		}
	}

- update css.txt

	large-screen.css


#### switch to responsive pure css grids
- Note two different approaches: 
	- one a grid component
	- the other a component that contains a grid

/apps/cqcon-village/components/columns/2col-60x40/2col-60x40.jsp
+
/apps/cqcon-village/components/merchant-list/merchant-list.jsp

	pure-g-r


#### merchants to 1 column when < certain width
- Notes:
	- create breakpoint relative to content
	- remove # from both merchant-col's

- Set small screen styles in merchant-list 

/apps/cqcon-village/components/merchant-list/clientlibs/style.css (line 22)

	.merchant-col {
		width: 100%;
	}


- Add large-screen.css to merchant-list clientlibs:

/apps/cqcon-village/components/merchant-list/clientlibs/large-screen.css (new)

	@media only screen and (min-width: 65.6875em) { /* 1051 / 16 */
		.merchant-col {
			width: 50%;
		}
	}


#### remove border-image from search field
- margins in iOS are broken when border-image is left around
- Move current defaults to large-screen.css
- show for 768+

/apps/cqcon-village/components/search-bar/clientlibs/style.css (REPLACE .search-bar-background section)

	.search-bar-background {
		background-image: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#424243), to(#292526));
		background-image: -webkit-linear-gradient(top, #424243, #292526); 
		background-image:    -moz-linear-gradient(top, #424243, #292526);
		background-image:     -ms-linear-gradient(top, #424243, #292526);
		background-image:      -o-linear-gradient(top, #424243, #292526);
	}

/apps/cqcon-village/components/search-bar/clientlibs/large-screen.css (new)

	@media only screen and (min-width: 48em) { /* 768 / 16 */
		.search-bar-background {
			background-image: none;
			margin-left: -20px;
			margin-right: -20px;
			border-width: 10px 10px 0 10px;
			-webkit-border-image: url(/etc/designs/cqcon-village/clientlibs/img/search-borders.png) 10 10 0 10 repeat stretch;
			-moz-border-image: url(/etc/designs/cqcon-village/clientlibs/img/search-borders.png) 10 10 0 10 repeat stretch;
			border-image: url(/etc/designs/cqcon-village/clientlibs/img/search-borders.png) 10 10 0 10 fill repeat stretch;
			border-style: solid;
		}
	}


#### Hide search label and button
- IMO, OK to hide DOM elements as long as they're not images
	- and functionality is still available
	- 'cosmetic'

/apps/cqcon-village/components/search-bar/clientlibs/style.css (line 28)

	.search-bar label, .search-bar button {
		display: none;
	}


/apps/cqcon-village/components/search-bar/clientlibs/large-screen.css (line 12)

	.search-bar label {
		display: inline;
	}
	.search-bar button {
		display: inline-block;
	}

- Add placeholder in input field
	- this design implies that submit on enter would be supported

/apps/cqcon-village/components/search-bar/search-bar.jsp (line 8)

	placeholder="Search..."


#### STOP 1st DEMO

----------


#### replace image with an adaptive one

- delete the current image
- add adaptiveimage
- add photo in DAM
- add photo to page
- SHOW network tab of different images coming down


#### STOP 2nd DEMO

----------


#### don't show logo to smaller screens
- by writing the styles 'mobile first' we can prevent it from downloading, too

/apps/cqcon-village/components/page/header.jsp

replace:
	<img ... />
with
	CQCON Village

#### remove header styles

/etc/designs/cqcon-village/clientlibs/css/style.css (line 36)

	header { ... }
	header a#logo-link { ...}

#### use background image instead
- we're letting content decide the breakpoint

/etc/designs/cqcon-village/clientlibs/css/large-screen.css (line 7)

	@media only screen and (min-width: 34.5625em) { /* 553 / 16 */
		header a#logo-link {
			display: block;
			width: 130px;
			height: 138px;
			margin: 0 auto;
			background-image: url(../img/logo.png);
			/* hide text */
			text-indent: -9999px;
			white-space: nowrap;
		}

		header {
			background-position: 0px 90px;
			background-repeat: no-repeat;
			background-position-x: center;
		}
	}
	

#### responsive nav with a 'hamburger button'

header.jsp (line 7)

	<a href="#menu" id="menu">
		&#9776;
	</a>

- Hide it on large screens, show it on small

/etc/designs/cqcon-village/clientlibs/css/large-screen.css (line 26)

	#menu {
		display: none;
	}
	

#### enable menu flyout
- based on an example from Brad Frost: http://codepen.io/bradfrost/full/IEBrz

/etc/designs/cqcon-village/clientlibs/js/script.js 

	jQuery(document).ready(function($) {
		$('body').addClass('js');

		var $menu = $('nav'),
			$menulink = $('#menu'),
			$wrap = $('.wrap');

		$menulink.click(function() {
			$menulink.toggleClass('active');
			$wrap.toggleClass('active');
			return false;
		});
	});

#### (flyout) add style

/etc/designs/cqcon-village/clientlibs/small-screen.css

	/* Header text style */
	@media only screen and (max-width: 34.5625em) { /* 553 / 16 */
		div.header-right {
			display: none;
		}

		header {
			box-shadow: none;
			background-image: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#424243), to(#292526));
			background-image: -webkit-linear-gradient(top, #424243, #292526); 
			background-image:    -moz-linear-gradient(top, #424243, #292526);
			background-image:     -ms-linear-gradient(top, #424243, #292526);
			background-image:      -o-linear-gradient(top, #424243, #292526);
			height: 2.6em;
			clear: both;
			margin-bottom: .5em;
		}

		header a#logo-link {
			display: block;
			text-decoration: none;
			text-align: center;
			font-size: 2em;
			float: right;
			margin-right: .2em;
		}

		h1 {
			font-size: 1.6em;
		}

		#menu {
			text-decoration: none;
			display: block;
			float: left;
			font-size: 1.75em;
			margin-left: .2em;
		}

		header a:link,
		header a:visited,
		header a:hover,
		header a:active {
			color: #fff;
		}
	}

#### (flyout) wrap body in 'wrap' div

body.jsp

	<div class="wrap"> ... </div>


#### (flyout) styles for main design

/etc/designs/cqcon-village/clientlibs/css/style.css (bottom)

	/* flyout styles */
	.wrap {
		position: relative;
		-webkit-transition: all 0.3s ease-out;  
		-moz-transition: all 0.3s ease-out;
		-ms-transition: all 0.3s ease-out;
		-o-transition: all 0.3s ease-out;
		transition: all 0.3s ease-out;
	}
	.wrap.active {
		left: 16em;
	}

	nav li a {
		text-decoration: none;
	}


#### move 'default' header styles to large-screen.css

/etc/designs/cqcon-village/clientlibs/css/style.css (line 55)
	
from:
	nav { ... }
to:
	nav li a:hover { ... }


#### add flyout styles for small screens

/etc/designs/cqcon-village/clientlibs/small-screen.css (line 67)

	nav {
		background: #808080;
		clear: both;
		overflow: hidden;
	}
	.js nav {
		width: 16em;
		height: 100%;
		position: absolute;
		top: 0;
		left: -16em;
	}
	nav ul {
		margin: 0;
		padding: 0;
		border-top: 1px solid #808080;
	}
	nav li a {
		display: block;
		padding: 0.8em;
		color: #fff;
		border-bottom: 1px solid #fff;
	}


#### add log in/register link to menu items
- leaving no functionality behind

/apps/cqcon-village/components/page/header.jsp (line 23)

	<li class="login"><a href="#">log in/register</a></li>

- hide in large screen

/etc/designs/cqcon-village/clientlibs/css/large-screen.css (line 74)

	nav li.login {
		display: none;
	}