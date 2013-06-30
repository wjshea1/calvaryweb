
<%@ page import="calvary.MenuItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'menuItem.label', default: 'MenuItem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-menuItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-menuItem" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'menuItem.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'menuItem.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="itemOrder" title="${message(code: 'menuItem.itemOrder.label', default: 'Item Order')}" />
					
						<g:sortableColumn property="itemType" title="${message(code: 'menuItem.itemType.label', default: 'Item Type')}" />
					
						<g:sortableColumn property="imageURL" title="${message(code: 'menuItem.imageURL.label', default: 'Image URL')}" />
					
						<g:sortableColumn property="itemURL" title="${message(code: 'menuItem.itemURL.label', default: 'Item URL')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${menuItemInstanceList}" status="i" var="menuItemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${menuItemInstance.id}">${fieldValue(bean: menuItemInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: menuItemInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: menuItemInstance, field: "itemOrder")}</td>
					
						<td>${fieldValue(bean: menuItemInstance, field: "itemType")}</td>
					
						<td>${fieldValue(bean: menuItemInstance, field: "imageURL")}</td>
					
						<td>${fieldValue(bean: menuItemInstance, field: "itemURL")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${menuItemInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
