
<%@ page import="calvary.NewsItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'newsItem.label', default: 'NewsItem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-newsItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-newsItem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list newsItem">
			
				<g:if test="${newsItemInstance?.headline}">
				<li class="fieldcontain">
					<span id="headline-label" class="property-label"><g:message code="newsItem.headline.label" default="Headline" /></span>
					
						<span class="property-value" aria-labelledby="headline-label"><g:fieldValue bean="${newsItemInstance}" field="headline"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsItemInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="newsItem.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${newsItemInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsItemInstance?.internetLink}">
				<li class="fieldcontain">
					<span id="internetLink-label" class="property-label"><g:message code="newsItem.internetLink.label" default="Internet Link" /></span>
					
						<span class="property-value" aria-labelledby="internetLink-label"><g:fieldValue bean="${newsItemInstance}" field="internetLink"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsItemInstance?.imageLink}">
				<li class="fieldcontain">
					<span id="imageLink-label" class="property-label"><g:message code="newsItem.imageLink.label" default="Image Link" /></span>
					
						<span class="property-value" aria-labelledby="imageLink-label"><g:fieldValue bean="${newsItemInstance}" field="imageLink"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${newsItemInstance?.publishDate}">
				<li class="fieldcontain">
					<span id="publishDate-label" class="property-label"><g:message code="newsItem.publishDate.label" default="Publish Date" /></span>
					
						<span class="property-value" aria-labelledby="publishDate-label"><g:formatDate date="${newsItemInstance?.publishDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${newsItemInstance?.id}" />
					<g:link class="edit" action="edit" id="${newsItemInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
