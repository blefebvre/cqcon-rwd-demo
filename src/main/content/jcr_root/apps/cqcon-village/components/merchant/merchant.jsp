<%@page session="false"%>
<%@include file="/libs/foundation/global.jsp"%><cq:includeClientLib categories="apps.cqcon-village.merchant"/><%
	String name = properties.get("name", "Merchant Name");
	String description = properties.get("description", "Brief description...");
	String href = properties.get("href", "#");
%>
<div class="merchant-item pure-g">
	<a class="pure-u-1-3" href="<%= xssAPI.getValidHref(href) %>"><img class="thumbnail" src="/etc/designs/cqcon-village/clientlibs/img/generic.png" /></a>
	<div class="pure-u-2-3 details">
		<div class="title">
			<a href="<%= xssAPI.getValidHref(href) %>"><%= xssAPI.encodeForHTML(name) %></a>
		</div>
		<div class="description">
			<%= xssAPI.encodeForHTML(description) %>
		</div>
	</div>
	<div class="clear"></div>
</div>