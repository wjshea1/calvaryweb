<%@ page import="calvary.Book" %>



<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'testament', 'error')} ">
	<label for="testament">
		<g:message code="book.testament.label" default="Testament" />
		
	</label>
	<g:select name="testament" from="${bookInstance.constraints.testament.inList}" value="${bookInstance?.testament}" valueMessagePrefix="book.testament" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="book.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${bookInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'chapterCount', 'error')} required">
	<label for="chapterCount">
		<g:message code="book.chapterCount.label" default="Chapter Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="chapterCount" type="number" value="${bookInstance.chapterCount}" required=""/>
</div>

