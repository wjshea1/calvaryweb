
<%@ page import="calvary.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-event" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-event" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'event.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'event.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="eventDate" title="${message(code: 'event.eventDate.label', default: 'Event Date')}" />
					
						<g:sortableColumn property="eventTime" title="${message(code: 'event.eventTime.label', default: 'Event Time')}" />
					
						<g:sortableColumn property="eventDuration" title="${message(code: 'event.eventDuration.label', default: 'Event Duration')}" />
					
						<g:sortableColumn property="location" title="${message(code: 'event.location.label', default: 'Location')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${eventInstanceList}" status="i" var="eventInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${eventInstance.id}">${fieldValue(bean: eventInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: eventInstance, field: "description")}</td>
					
						<td><g:formatDate date="${eventInstance.eventDate}" /></td>
					
						<td>${fieldValue(bean: eventInstance, field: "eventTime")}</td>
					
						<td>${fieldValue(bean: eventInstance, field: "eventDuration")}</td>
					
						<td>${fieldValue(bean: eventInstance, field: "location")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${eventInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
