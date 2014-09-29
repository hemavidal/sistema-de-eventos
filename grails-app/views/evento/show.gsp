
<%@ page import="com.igreja.se.Evento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'evento.label', default: 'Evento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-evento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="alert ${flash.type} text-center" role="status"
					id="alerta">
					<a class="close" data-dismiss="alert"
						onclick="$('#alerta').hide(500);">×</a>
					${flash.message}
				</div>
			</g:if>
			<g:form url="[resource:eventoInstance, action:'delete']" method="DELETE">
				<fieldset class="form-horizontal">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:link class="edit btn btn-warning" action="edit" resource="${eventoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					<g:link class="btn btn-success" controller='inscricao' action='create' params="[evento:eventoInstance.id]"><g:message code="default.button.inscricao.label" default="Fazer Inscrição" /></g:link>
				</fieldset>
			</g:form>
			
			<div id="list-inscricao" class="content scaffold-list" role="main">
				<h1><g:message code="Inscrições" /></h1>
				<table class="table">
				<thead>
						<tr>
						
							<g:sortableColumn property="pessoa" title="${message(code: 'default.pessoa.label', default: 'Pessoa')}" />

							<g:sortableColumn property="isConfirmada" title="${message(code: 'inscricao.isConfirmada.label', default: 'Situação')}" />

						</tr>
					</thead>
					<tbody>
					<g:each in="${eventoInstance.inscricoes}" status="i" var="inscricaoInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link controller="inscricao" action="show" id="${inscricaoInstance?.id}">${fieldValue(bean: inscricaoInstance, field: "pessoa")}</g:link></td>

							<td>${fieldValue(bean: inscricaoInstance, field: "isConfirmada")}</td>

						
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${inscricaoInstanceCount ?: 0}" />
				</div>
			</div>
		</div>
	</body>
</html>
