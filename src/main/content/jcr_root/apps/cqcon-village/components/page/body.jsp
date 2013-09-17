<%@page session="false"%>
<%@include file="/libs/foundation/global.jsp"%><body>
	<script src="//use.edgefonts.net/bree-serif.js"></script>
	<script src="//use.edgefonts.net/nixie-one.js"></script>
	<cq:includeClientLib categories="apps.cqcon-village.all"/>

	<div class="wrap">
		<div id="content">
			<cq:include script="header.jsp" />

			<div id="main">
				<cq:include path="par" resourceType="foundation/components/parsys" />
			</div>

			<cq:include script="footer.jsp" />
		</div>
	</div>
</body>