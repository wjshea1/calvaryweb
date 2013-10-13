<%@ page import="calvary.Sermon" %>



<div class="fieldcontain ${hasErrors(bean: sermonInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="sermon.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" maxlength="200" required="" value="${sermonInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sermonInstance, field: 'pubDate', 'error')} required">
	<label for="pubDate">
		<g:message code="sermon.pubDate.label" default="Pub Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="pubDate" precision="day"  value="${sermonInstance?.pubDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: sermonInstance, field: 'summary', 'error')} required">
	<label for="summary">
		<g:message code="sermon.summary.label" default="Summary" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="summary" cols="40" rows="5" maxlength="300" required="" value="${sermonInstance?.summary}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sermonInstance, field: 'keywords', 'error')} required">
	<label for="keywords">
		<g:message code="sermon.keywords.label" default="Keywords" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="keywords" maxlength="250" required="" value="${sermonInstance?.keywords}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sermonInstance, field: 'audioFileLocation', 'error')} required">
	<label for="audioFileLocation">
		<g:message code="sermon.audioFileLocation.label" default="Audio File Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="audioFileLocation" required="" value="${sermonInstance?.audioFileLocation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sermonInstance, field: 'imageFileLocation', 'error')} required">
	<label for="imageFileLocation">
		<g:message code="sermon.imageFileLocation.label" default="Image File Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="url" name="imageFileLocation" required="" value="${sermonInstance?.imageFileLocation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sermonInstance, field: 'book', 'error')} ">
	<label for="book">
		<g:message code="sermon.book.label" default="Book" />
		
	</label>
	<g:select id="book" name="book.id" from="${calvary.Book.list()}" optionKey="id" value="${sermonInstance?.book?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sermonInstance, field: 'startChapter', 'error')} required">
	<label for="startChapter">
		<g:message code="sermon.startChapter.label" default="Start Chapter" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="startChapter" type="number" value="${sermonInstance.startChapter}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: sermonInstance, field: 'startVerse', 'error')} required">
	<label for="startVerse">
		<g:message code="sermon.startVerse.label" default="Start Verse" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="startVerse" type="number" value="${sermonInstance.startVerse}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: sermonInstance, field: 'endChapter', 'error')} required">
	<label for="endChapter">
		<g:message code="sermon.endChapter.label" default="End Chapter" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="endChapter" type="number" value="${sermonInstance.endChapter}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: sermonInstance, field: 'endVerse', 'error')} required">
	<label for="endVerse">
		<g:message code="sermon.endVerse.label" default="End Verse" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="endVerse" type="number" value="${sermonInstance.endVerse}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: sermonInstance, field: 'service', 'error')} ">
	<label for="service">
		<g:message code="sermon.service.label" default="Service" />
		
	</label>
	<g:select name="service" from="${sermonInstance.constraints.service.inList}" value="${sermonInstance?.service}" valueMessagePrefix="sermon.service" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sermonInstance, field: 'duration', 'error')} ">
	<label for="duration">
		<g:message code="sermon.duration.label" default="Duration" />
		
	</label>
	<g:textField name="duration" value="${sermonInstance?.duration}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sermonInstance, field: 'featured', 'error')} ">
	<label for="featured">
		<g:message code="sermon.featured.label" default="Featured" />
		
	</label>
	<g:checkBox name="featured" value="${sermonInstance?.featured}" />
</div>

<div class="fieldcontain ${hasErrors(bean: sermonInstance, field: 'speaker', 'error')} required">
	<label for="speaker">
		<g:message code="sermon.speaker.label" default="Speaker" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="speaker" name="speaker.id" from="${calvary.Speakers.list()}" optionKey="id" required="" value="${sermonInstance?.speaker?.id}" class="many-to-one"/>
</div>

