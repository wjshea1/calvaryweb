<%@ page import="calvary.Event" %>



<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="event.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" maxlength="200" required="" value="${eventInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="event.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1024" required="" value="${eventInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'eventDate', 'error')} required">
	<label for="eventDate">
		<g:message code="event.eventDate.label" default="Event Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="eventDate" precision="day"  value="${eventInstance?.eventDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'eventTime', 'error')} required">
	<label for="eventTime">
		<g:message code="event.eventTime.label" default="Event Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="eventTime" required="" value="${eventInstance?.eventTime}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'eventDuration', 'error')} required">
	<label for="eventDuration">
		<g:message code="event.eventDuration.label" default="Event Duration" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="eventDuration" required="" value="${eventInstance?.eventDuration}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="event.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="location" required="" value="${eventInstance?.location}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'imageURL', 'error')} ">
	<label for="imageURL">
		<g:message code="event.imageURL.label" default="Image URL" />
		
	</label>
	<g:textField name="imageURL" value="${eventInstance?.imageURL}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'internetLink', 'error')} ">
	<label for="internetLink">
		<g:message code="event.internetLink.label" default="Internet Link" />
		
	</label>
	<g:textField name="internetLink" value="${eventInstance?.internetLink}"/>
</div>

