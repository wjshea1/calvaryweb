
<%@ page import="calvary.MenuItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'menuItem.label', default: 'MenuItem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-menuItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-menuItem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list menuItem">
			
				<g:if test="${menuItemInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="menuItem.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${menuItemInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${menuItemInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="menuItem.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${menuItemInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${menuItemInstance?.itemOrder}">
				<li class="fieldcontain">
					<span id="itemOrder-label" class="property-label"><g:message code="menuItem.itemOrder.label" default="Item Order" /></span>
					
						<span class="property-value" aria-labelledby="itemOrder-label"><g:fieldValue bean="${menuItemInstance}" field="itemOrder"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${menuItemInstance?.itemType}">
				<li class="fieldcontain">
					<span id="itemType-label" class="property-label"><g:message code="menuItem.itemType.label" default="Item Type" /></span>
					
						<span class="property-value" aria-labelledby="itemType-label"><g:fieldValue bean="${menuItemInstance}" field="itemType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${menuItemInstance?.imageURL}">
				<li class="fieldcontain">
					<span id="imageURL-label" class="property-label"><g:message code="menuItem.imageURL.label" default="Image URL" /></span>
					
						<span class="property-value" aria-labelledby="imageURL-label"><g:fieldValue bean="${menuItemInstance}" field="imageURL"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${menuItemInstance?.itemURL}">
				<li class="fieldcontain">
					<span id="itemURL-label" class="property-label"><g:message code="menuItem.itemURL.label" default="Item URL" /></span>
					
						<span class="property-value" aria-labelledby="itemURL-label"><g:fieldValue bean="${menuItemInstance}" field="itemURL"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${menuItemInstance?.metaData}">
				<li class="fieldcontain">
					<span id="metaData-label" class="property-label"><g:message code="menuItem.metaData.label" default="Meta Data" /></span>
					
						<span class="property-value" aria-labelledby="metaData-label"><g:fieldValue bean="${menuItemInstance}" field="metaData"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${menuItemInstance?.changeDate}">
				<li class="fieldcontain">
					<span id="changeDate-label" class="property-label"><g:message code="menuItem.changeDate.label" default="Change Date" /></span>
					
						<span class="property-value" aria-labelledby="changeDate-label"><g:formatDate date="${menuItemInstance?.changeDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${menuItemInstance?.id}" />
					<g:link class="edit" action="edit" id="${menuItemInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
