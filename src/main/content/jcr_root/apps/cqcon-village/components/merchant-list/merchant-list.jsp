<%@page session="false"%>
<%@include file="/libs/foundation/global.jsp"%><cq:includeClientLib categories="apps.cqcon-village.merchant-list"/>
<div class="pure-g-r merchant-list">
	<div class="pure-u-1-3">
		<div class="filter-col">
			<h2>filter list</h2>
			<div><input type="text" /></div>
			<p>
				<strong>Narrow your search for the perfect place!</strong>
				<br>start typing some keywords above to filter the list.
			</p>
			<p>
				<strong>Want the full listing again?</strong>
				<br>Just delete the keywords and see the full list.
			</p>
		</div>
	</div>
	<div class="pure-u-2-3">
	    <div class="pure-g">
			<div class="pure-u-1-2 merchant-col">
				<cq:include path="merchant-col-1" resourceType="foundation/components/parsys" />
			</div>
			<div class="pure-u-1-2 merchant-col">
				<cq:include path="merchant-col-2" resourceType="foundation/components/parsys" />
			</div>
		</div>
	</div>
</div>