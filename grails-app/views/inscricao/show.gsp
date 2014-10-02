
<%@ page import="com.igreja.se.Inscricao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inscricao.label', default: 'Inscricao')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-inscricao" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="alert ${flash.type} text-center" role="status"
					id="alerta">
					<a class="close" data-dismiss="alert"
						onclick="$('#alerta').hide(500);">×</a>
					${flash.message}
				</div>
			</g:if>
			<g:form url="[resource:inscricaoInstance, action:'delete']" method="DELETE">
				<fieldset class="form-horizontal">
					<g:render template="form"/>
				</fieldset>
				<g:if test="${session?.usuario?.tipo?.equals('admin')}">
					<fieldset class="buttons">
						<g:link class="edit btn btn-warning" action="edit" resource="${inscricaoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:if>
			</g:form>
		</div>
	</body>
</html>
