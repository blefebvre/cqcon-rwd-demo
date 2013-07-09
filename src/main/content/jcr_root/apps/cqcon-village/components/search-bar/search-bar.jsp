<%@page session="false"%>
<%@include file="/libs/foundation/global.jsp"%><cq:includeClientLib categories="apps.cqcon-village.search-bar"/><%
	String prompt = properties.get("searchPrompt", "search the site");
%>
<div class="search-bar-background">
	<div class="search-bar">
		<label><%= xssAPI.encodeForHTML(prompt) %></label>
		<input type="text" class="search-field" />
		<button class="pure-button">search</button>
	</div>
</div>