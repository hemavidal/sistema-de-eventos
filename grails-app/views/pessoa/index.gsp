
<%@ page import="com.igreja.se.Pessoa" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pessoa.label', default: 'Pessoa')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-pessoa" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table">
			<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'pessoa.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="idade" title="${message(code: 'pessoa.idade.label', default: 'Idade')}" />
					
						<g:sortableColumn property="sexo" title="${message(code: 'pessoa.sexo.label', default: 'Sexo')}" />
					
						<g:sortableColumn property="cidade" title="${message(code: 'pessoa.cidade.label', default: 'Cidade')}" />
					
						<g:sortableColumn property="estado" title="${message(code: 'pessoa.estado.label', default: 'Estado')}" />
					
						<g:sortableColumn property="pais" title="${message(code: 'pessoa.pais.label', default: 'Pais')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pessoaInstanceList}" status="i" var="pessoaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pessoaInstance.id}">${fieldValue(bean: pessoaInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: pessoaInstance, field: "idade")}</td>
					
						<td>${fieldValue(bean: pessoaInstance, field: "sexo")}</td>
					
						<td>${fieldValue(bean: pessoaInstance, field: "cidade")}</td>
					
						<td>${fieldValue(bean: pessoaInstance, field: "estado")}</td>
					
						<td>${fieldValue(bean: pessoaInstance, field: "pais")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pessoaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
