
<%@ page import="calvary.Sermon" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sermon.label', default: 'Sermon')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-sermon" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-sermon" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'sermon.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="pubDate" title="${message(code: 'sermon.pubDate.label', default: 'Pub Date')}" />
					
						<g:sortableColumn property="summary" title="${message(code: 'sermon.summary.label', default: 'Summary')}" />
					
						<g:sortableColumn property="keywords" title="${message(code: 'sermon.keywords.label', default: 'Keywords')}" />
					

					</tr>
				</thead>
				<tbody>
				<g:each in="${sermonInstanceList}" status="i" var="sermonInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${sermonInstance.id}">${fieldValue(bean: sermonInstance, field: "title")}</g:link></td>
					
						<td><g:formatDate date="${sermonInstance.pubDate}" /></td>

					
						<td>${fieldValue(bean: sermonInstance, field: "summary")}</td>
					
						<td>${fieldValue(bean: sermonInstance, field: "keywords")}</td>
					

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${sermonInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
