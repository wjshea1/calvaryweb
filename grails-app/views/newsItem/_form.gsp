<%@ page import="calvary.NewsItem" %>



<div class="fieldcontain ${hasErrors(bean: newsItemInstance, field: 'headline', 'error')} required">
	<label for="headline">
		<g:message code="newsItem.headline.label" default="Headline" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="headline" maxlength="200" required="" value="${newsItemInstance?.headline}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: newsItemInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="newsItem.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1024" required="" value="${newsItemInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: newsItemInstance, field: 'internetLink', 'error')} ">
	<label for="internetLink">
		<g:message code="newsItem.internetLink.label" default="Internet Link" />
		
	</label>
	<g:field type="url" name="internetLink" value="${newsItemInstance?.internetLink}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: newsItemInstance, field: 'imageLink', 'error')} ">
	<label for="imageLink">
		<g:message code="newsItem.imageLink.label" default="Image Link" />
		
	</label>
	<g:field type="url" name="imageLink" value="${newsItemInstance?.imageLink}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: newsItemInstance, field: 'publishDate', 'error')} required">
	<label for="publishDate">
		<g:message code="newsItem.publishDate.label" default="Publish Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="publishDate" precision="day"  value="${newsItemInstance?.publishDate}"  />
</div>

