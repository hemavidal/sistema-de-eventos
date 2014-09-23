
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
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list evento">
			
				<g:if test="${eventoInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="evento.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${eventoInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventoInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="evento.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${eventoInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventoInstance?.valorInscricao}">
				<li class="fieldcontain">
					<span id="valorInscricao-label" class="property-label"><g:message code="evento.valorInscricao.label" default="Valor da Inscricao" /></span>
					
						<span class="property-value" aria-labelledby="valorInscricao-label"><g:fieldValue bean="${eventoInstance}" field="valorInscricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventoInstance?.cidade}">
				<li class="fieldcontain">
					<span id="cidade-label" class="property-label"><g:message code="evento.cidade.label" default="Cidade" /></span>
					
						<span class="property-value" aria-labelledby="cidade-label"><g:fieldValue bean="${eventoInstance}" field="cidade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventoInstance?.endereco}">
				<li class="fieldcontain">
					<span id="endereco-label" class="property-label"><g:message code="evento.endereco.label" default="Endereco" /></span>
					
						<span class="property-value" aria-labelledby="endereco-label"><g:fieldValue bean="${eventoInstance}" field="endereco"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventoInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="evento.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:fieldValue bean="${eventoInstance}" field="estado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventoInstance?.informacoes}">
				<li class="fieldcontain">
					<span id="informacoes-label" class="property-label"><g:message code="evento.informacoes.label" default="Informacoes" /></span>
					
						<span class="property-value" aria-labelledby="informacoes-label"><g:fieldValue bean="${eventoInstance}" field="informacoes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventoInstance?.pais}">
				<li class="fieldcontain">
					<span id="pais-label" class="property-label"><g:message code="evento.pais.label" default="Pais" /></span>
					
						<span class="property-value" aria-labelledby="pais-label"><g:fieldValue bean="${eventoInstance}" field="pais"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:eventoInstance, action:'delete']" method="DELETE">
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
