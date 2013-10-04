<%@ page import="calvary.Menu" %>



<div class="fieldcontain ${hasErrors(bean: menuInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="menu.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${menuInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: menuInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="menu.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${menuInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: menuInstance, field: 'items', 'error')} ">
	<label for="items">
		<g:message code="menu.items.label" default="Items" />
		
	</label>
	<g:select name="items" from="${calvary.MenuItem.list()}" multiple="multiple" optionKey="id" size="5" value="${menuInstance?.items*.id}" class="many-to-many"/>
</div>

