<%--
  Created by IntelliJ IDEA.
  User: wjshea
  Date: 10/5/13
  Time: 8:05 PM
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-responsive.css')}" type="text/css">
    <r:external uri="/js/jquery.js"/>
    <r:external uri="/js/bootstrap.min.js"/>
    <g:layoutHead/>
    <r:layoutResources />
</head>
<body>
<g:layoutBody/>
<g:javascript library="application"/>
<r:layoutResources />
</body>
</html>