<%@ page import="calvary.MenuItem" %>



<div class="fieldcontain ${hasErrors(bean: menuItemInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="menuItem.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="100" required="" value="${menuItemInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: menuItemInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="menuItem.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1024" required="" value="${menuItemInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: menuItemInstance, field: 'itemOrder', 'error')} required">
	<label for="itemOrder">
		<g:message code="menuItem.itemOrder.label" default="Item Order" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="itemOrder" type="number" value="${menuItemInstance.itemOrder}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: menuItemInstance, field: 'itemType', 'error')} required">
	<label for="itemType">
		<g:message code="menuItem.itemType.label" default="Item Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="itemType" from="${menuItemInstance.constraints.itemType.inList}" required="" value="${menuItemInstance?.itemType}" valueMessagePrefix="menuItem.itemType"/>
</div>

<div class="fieldcontain ${hasErrors(bean: menuItemInstance, field: 'imageURL', 'error')} ">
	<label for="imageURL">
		<g:message code="menuItem.imageURL.label" default="Image URL" />
		
	</label>
	<g:field type="url" name="imageURL" value="${menuItemInstance?.imageURL}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: menuItemInstance, field: 'itemURL', 'error')} ">
	<label for="itemURL">
		<g:message code="menuItem.itemURL.label" default="Item URL" />
		
	</label>
	<g:field type="url" name="itemURL" value="${menuItemInstance?.itemURL}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: menuItemInstance, field: 'metaData', 'error')} ">
	<label for="metaData">
		<g:message code="menuItem.metaData.label" default="Meta Data" />
		
	</label>
	<g:textArea name="metaData" cols="40" rows="5" maxlength="1024" value="${menuItemInstance?.metaData}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: menuItemInstance, field: 'changeDate', 'error')} required">
	<label for="changeDate">
		<g:message code="menuItem.changeDate.label" default="Change Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="changeDate" precision="day"  value="${menuItemInstance?.changeDate}"  />
</div>

