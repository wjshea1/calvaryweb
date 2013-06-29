<%@ page import="calvary.NewsItem" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'newsItem.label', default: 'NewsItem')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-newsItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-newsItem" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="headline"
                              title="${message(code: 'newsItem.headline.label', default: 'Headline')}"/>

            <g:sortableColumn property="description"
                              title="${message(code: 'newsItem.description.label', default: 'Description')}"/>

            <g:sortableColumn property="internetLink"
                              title="${message(code: 'newsItem.internetLink.label', default: 'Internet Link')}"/>

            <g:sortableColumn property="publishDate"
                              title="${message(code: 'newsItem.publishDate.label', default: 'Publish Date')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${newsItemInstanceList}" status="i" var="newsItemInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${newsItemInstance.id}">${fieldValue(bean: newsItemInstance, field: "headline")}</g:link></td>

                <td>${fieldValue(bean: newsItemInstance, field: "description")}</td>

                <td>${fieldValue(bean: newsItemInstance, field: "internetLink")}</td>

                <td><g:formatDate date="${newsItemInstance.publishDate}"/></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${newsItemInstanceTotal}"/>
    </div>
</div>
</body>
</html>
