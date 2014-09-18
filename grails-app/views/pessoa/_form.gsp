<%@ page import="com.igreja.se.Pessoa" %>



<div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="pessoa.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${pessoaInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'idade', 'error')} required">
	<label for="idade">
		<g:message code="pessoa.idade.label" default="Idade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="idade" type="number" value="${pessoaInstance.idade}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="pessoa.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sexo" from="${pessoaInstance.constraints.sexo.inList}" required="" value="${pessoaInstance?.sexo}" valueMessagePrefix="pessoa.sexo"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'cidade', 'error')} required">
	<label for="cidade">
		<g:message code="pessoa.cidade.label" default="Cidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cidade" required="" value="${pessoaInstance?.cidade}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="pessoa.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="estado" required="" value="${pessoaInstance?.estado}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'pais', 'error')} required">
	<label for="pais">
		<g:message code="pessoa.pais.label" default="Pais" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="pais" required="" value="${pessoaInstance?.pais}"/>

</div>

