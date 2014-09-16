
<%@ page import="com.igreja.se.Inscricao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inscricao.label', default: 'Inscricao')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-inscricao" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-inscricao" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list inscricao">
			
				<g:if test="${inscricaoInstance?.isConfirmada}">
				<li class="fieldcontain">
					<span id="isConfirmada-label" class="property-label"><g:message code="inscricao.isConfirmada.label" default="Is Confirmada" /></span>
					
						<span class="property-value" aria-labelledby="isConfirmada-label"><g:formatBoolean boolean="${inscricaoInstance?.isConfirmada}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${inscricaoInstance?.pessoa}">
				<li class="fieldcontain">
					<span id="pessoa-label" class="property-label"><g:message code="inscricao.pessoa.label" default="Pessoa" /></span>
					
						<span class="property-value" aria-labelledby="pessoa-label"><g:link controller="pessoa" action="show" id="${inscricaoInstance?.pessoa?.id}">${inscricaoInstance?.pessoa?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:inscricaoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${inscricaoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
