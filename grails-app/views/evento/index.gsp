
<%@ page import="com.igreja.se.Evento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'evento.label', default: 'Evento')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-evento" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table">
			<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'evento.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="descricao" title="${message(code: 'evento.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="valorInscricao" title="${message(code: 'evento.valorInscricao.label', default: 'Valor da Inscricao')}" />
					
						<g:sortableColumn property="cidade" title="${message(code: 'evento.cidade.label', default: 'Cidade')}" />
					
						<g:sortableColumn property="estado" title="${message(code: 'evento.estado.label', default: 'Estado')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${eventoInstanceList}" status="i" var="eventoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${eventoInstance.id}">${fieldValue(bean: eventoInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: eventoInstance, field: "descricao")}</td>
					
						<td>${fieldValue(bean: eventoInstance, field: "valorInscricao")}</td>
					
						<td>${fieldValue(bean: eventoInstance, field: "cidade")}</td>
					
						<td>${fieldValue(bean: eventoInstance, field: "estado")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="nav" role="navigation">
				<p>
					<g:link class="btn btn-lg btn-success" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
				</p>
			</div>
			<div class="pagination">
				<g:paginate total="${eventoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
