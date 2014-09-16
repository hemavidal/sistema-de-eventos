
<%@ page import="com.igreja.se.Evento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'evento.label', default: 'Evento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-evento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
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
			
				<g:if test="${eventoInstance?.inscricao}">
				<li class="fieldcontain">
					<span id="inscricao-label" class="property-label"><g:message code="evento.inscricao.label" default="Inscricao" /></span>
					
						<span class="property-value" aria-labelledby="inscricao-label"><g:fieldValue bean="${eventoInstance}" field="inscricao"/></span>
					
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
			
				<g:if test="${eventoInstance?.inscricoes}">
				<li class="fieldcontain">
					<span id="inscricoes-label" class="property-label"><g:message code="evento.inscricoes.label" default="Inscricoes" /></span>
					
						<g:each in="${eventoInstance.inscricoes}" var="i">
						<span class="property-value" aria-labelledby="inscricoes-label"><g:link controller="inscricao" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
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
					<g:link class="edit" action="edit" resource="${eventoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
