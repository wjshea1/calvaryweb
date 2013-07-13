
<%@ page import="calvary.Sermon" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'sermon.label', default: 'Sermon')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-sermon" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-sermon" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list sermon">
			
				<g:if test="${sermonInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="sermon.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${sermonInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sermonInstance?.pubDate}">
				<li class="fieldcontain">
					<span id="pubDate-label" class="property-label"><g:message code="sermon.pubDate.label" default="Pub Date" /></span>
					
						<span class="property-value" aria-labelledby="pubDate-label"><g:formatDate date="${sermonInstance?.pubDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${sermonInstance?.summary}">
				<li class="fieldcontain">
					<span id="summary-label" class="property-label"><g:message code="sermon.summary.label" default="Summary" /></span>
					
						<span class="property-value" aria-labelledby="summary-label"><g:fieldValue bean="${sermonInstance}" field="summary"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sermonInstance?.keywords}">
				<li class="fieldcontain">
					<span id="keywords-label" class="property-label"><g:message code="sermon.keywords.label" default="Keywords" /></span>
					
						<span class="property-value" aria-labelledby="keywords-label"><g:fieldValue bean="${sermonInstance}" field="keywords"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sermonInstance?.audioFileLocation}">
				<li class="fieldcontain">
					<span id="audioFileLocation-label" class="property-label"><g:message code="sermon.audioFileLocation.label" default="Audio File Location" /></span>
					
						<span class="property-value" aria-labelledby="audioFileLocation-label"><g:fieldValue bean="${sermonInstance}" field="audioFileLocation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sermonInstance?.imageFileLocation}">
				<li class="fieldcontain">
					<span id="imageFileLocation-label" class="property-label"><g:message code="sermon.imageFileLocation.label" default="Image File Location" /></span>
					
						<span class="property-value" aria-labelledby="imageFileLocation-label"><g:fieldValue bean="${sermonInstance}" field="imageFileLocation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sermonInstance?.book}">
				<li class="fieldcontain">
					<span id="book-label" class="property-label"><g:message code="sermon.book.label" default="Book" /></span>
					
						<span class="property-value" aria-labelledby="book-label"><g:link controller="book" action="show" id="${sermonInstance?.book?.id}">${sermonInstance?.book?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${sermonInstance?.startChapter}">
				<li class="fieldcontain">
					<span id="startChapter-label" class="property-label"><g:message code="sermon.startChapter.label" default="Start Chapter" /></span>
					
						<span class="property-value" aria-labelledby="startChapter-label"><g:fieldValue bean="${sermonInstance}" field="startChapter"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sermonInstance?.startVerse}">
				<li class="fieldcontain">
					<span id="startVerse-label" class="property-label"><g:message code="sermon.startVerse.label" default="Start Verse" /></span>
					
						<span class="property-value" aria-labelledby="startVerse-label"><g:fieldValue bean="${sermonInstance}" field="startVerse"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sermonInstance?.endChapter}">
				<li class="fieldcontain">
					<span id="endChapter-label" class="property-label"><g:message code="sermon.endChapter.label" default="End Chapter" /></span>
					
						<span class="property-value" aria-labelledby="endChapter-label"><g:fieldValue bean="${sermonInstance}" field="endChapter"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sermonInstance?.endVerse}">
				<li class="fieldcontain">
					<span id="endVerse-label" class="property-label"><g:message code="sermon.endVerse.label" default="End Verse" /></span>
					
						<span class="property-value" aria-labelledby="endVerse-label"><g:fieldValue bean="${sermonInstance}" field="endVerse"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sermonInstance?.service}">
				<li class="fieldcontain">
					<span id="service-label" class="property-label"><g:message code="sermon.service.label" default="Service" /></span>
					
						<span class="property-value" aria-labelledby="service-label"><g:fieldValue bean="${sermonInstance}" field="service"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sermonInstance?.duration}">
				<li class="fieldcontain">
					<span id="duration-label" class="property-label"><g:message code="sermon.duration.label" default="Duration" /></span>
					
						<span class="property-value" aria-labelledby="duration-label"><g:fieldValue bean="${sermonInstance}" field="duration"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sermonInstance?.featured}">
				<li class="fieldcontain">
					<span id="featured-label" class="property-label"><g:message code="sermon.featured.label" default="Featured" /></span>
					
						<span class="property-value" aria-labelledby="featured-label"><g:formatBoolean boolean="${sermonInstance?.featured}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${sermonInstance?.speaker}">
				<li class="fieldcontain">
					<span id="speaker-label" class="property-label"><g:message code="sermon.speaker.label" default="Speaker" /></span>
					
						<span class="property-value" aria-labelledby="speaker-label"><g:link controller="speakers" action="show" id="${sermonInstance?.speaker?.id}">${sermonInstance?.speaker?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${sermonInstance?.id}" />
					<g:link class="edit" action="edit" id="${sermonInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
