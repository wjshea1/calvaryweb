
<%@ page import="calvary.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-event" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-event" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list event">
			
				<g:if test="${eventInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="event.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${eventInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="event.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${eventInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.eventDate}">
				<li class="fieldcontain">
					<span id="eventDate-label" class="property-label"><g:message code="event.eventDate.label" default="Event Date" /></span>
					
						<span class="property-value" aria-labelledby="eventDate-label"><g:formatDate date="${eventInstance?.eventDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.eventTime}">
				<li class="fieldcontain">
					<span id="eventTime-label" class="property-label"><g:message code="event.eventTime.label" default="Event Time" /></span>
					
						<span class="property-value" aria-labelledby="eventTime-label"><g:fieldValue bean="${eventInstance}" field="eventTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.eventDuration}">
				<li class="fieldcontain">
					<span id="eventDuration-label" class="property-label"><g:message code="event.eventDuration.label" default="Event Duration" /></span>
					
						<span class="property-value" aria-labelledby="eventDuration-label"><g:fieldValue bean="${eventInstance}" field="eventDuration"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="event.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${eventInstance}" field="location"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.imageURL}">
				<li class="fieldcontain">
					<span id="imageURL-label" class="property-label"><g:message code="event.imageURL.label" default="Image URL" /></span>
					
						<span class="property-value" aria-labelledby="imageURL-label"><g:fieldValue bean="${eventInstance}" field="imageURL"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventInstance?.internetLink}">
				<li class="fieldcontain">
					<span id="internetLink-label" class="property-label"><g:message code="event.internetLink.label" default="Internet Link" /></span>
					
						<span class="property-value" aria-labelledby="internetLink-label"><g:fieldValue bean="${eventInstance}" field="internetLink"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${eventInstance?.id}" />
					<g:link class="edit" action="edit" id="${eventInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
