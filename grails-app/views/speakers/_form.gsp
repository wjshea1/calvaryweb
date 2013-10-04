<%@ page import="calvary.Speakers" %>



<div class="fieldcontain ${hasErrors(bean: speakersInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="speakers.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${speakersInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: speakersInstance, field: 'guest', 'error')} ">
	<label for="guest">
		<g:message code="speakers.guest.label" default="Guest" />
		
	</label>
	<g:checkBox name="guest" value="${speakersInstance?.guest}" />
</div>

