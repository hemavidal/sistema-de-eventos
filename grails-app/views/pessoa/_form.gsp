<%@ page import="com.igreja.se.Pessoa" %>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'email', 'error')} required">
	<label for="email" class="col-sm-2 control-label">
		<g:message code="pessoa.nome.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" type="email" name="email" required="" value="${pessoaInstance?.email}" disabled="${'show'.equals(actionName)}"/>
	</div>

</div>


<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'nome', 'error')} required">
	<label for="nome" class="col-sm-2 control-label">
		<g:message code="pessoa.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="nome" required="" value="${pessoaInstance?.nome}" disabled="${'show'.equals(actionName)}"/>
	</div>

</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'idade', 'error')} required">
	<label for="idade" class="col-sm-2 control-label">
		<g:message code="pessoa.idade.label" default="Idade" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:field class="form-control" name="idade" type="number" value="${pessoaInstance?.idade}" required="" disabled="${'show'.equals(actionName)}"/>
	</div>

</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'sexo', 'error')} required">
	<label for="sexo" class="col-sm-2 control-label">
		<g:message code="pessoa.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:select class="form-control" name="sexo" from="${['M', 'F']}" required="" value="${pessoaInstance?.sexo}" disabled="${'show'.equals(actionName)}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'cidade', 'error')} required">
	<label for="cidade" class="col-sm-2 control-label">
		<g:message code="pessoa.cidade.label" default="Cidade" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="cidade" required="" value="${pessoaInstance?.cidade}" disabled="${'show'.equals(actionName)}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'estado', 'error')} required">
	<label for="estado" class="col-sm-2 control-label">
		<g:message code="pessoa.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="estado" required="" value="${pessoaInstance?.estado}" disabled="${'show'.equals(actionName)}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'pais', 'error')} required">
	<label for="pais" class="col-sm-2 control-label">
		<g:message code="inscricao.pais.label" default="Pais" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="pais" required="" value="${pessoaInstance?.pais}" disabled="${'show'.equals(actionName)}"/>
	</div>
</div>