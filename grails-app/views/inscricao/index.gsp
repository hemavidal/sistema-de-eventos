
<%@ page import="com.igreja.se.Inscricao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inscricao.label', default: 'Inscricao')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-inscricao" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table">
			<thead>
					<tr>
					
						<g:sortableColumn property="isConfirmada" title="${message(code: 'inscricao.isConfirmada.label', default: 'Is Confirmada')}" />
					
						<th><g:message code="inscricao.pessoa.label" default="Pessoa" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${inscricaoInstanceList}" status="i" var="inscricaoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${inscricaoInstance.id}">${fieldValue(bean: inscricaoInstance, field: "isConfirmada")}</g:link></td>
					
						<td>${fieldValue(bean: inscricaoInstance, field: "pessoa")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="nav" role="navigation">
				<ul>
					<a class="btn btn-lg btn-default" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
					<g:link class="btn btn-lg btn-success" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
				</ul>
			</div>
			<div class="pagination">
				<g:paginate total="${inscricaoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
