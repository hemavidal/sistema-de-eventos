<%@ page import="com.igreja.se.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'login', 'error')} required">
	<label for="login">
		<g:message code="usuario.login.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="login" required="" value="${usuarioInstance?.login}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'senha', 'error')} required">
	<label for="senha">
		<g:message code="usuario.senha.label" default="Senha" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="senha" required="" value="${usuarioInstance?.senha}"/>

</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'email', 'error')} required">
	<label for="email" class="col-sm-2 control-label">
		<g:message code="inscricao.nome.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" type="email" name="pessoa.email" required="" value="${inscricaoInstance?.pessoa?.email}" disabled="${'show'.equals(actionName)}"/>
	</div>

</div>


<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'nome', 'error')} required">
	<label for="nome" class="col-sm-2 control-label">
		<g:message code="inscricao.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="pessoa.nome" required="" value="${inscricaoInstance?.pessoa?.nome}" disabled="${'show'.equals(actionName)}"/>
	</div>

</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'idade', 'error')} required">
	<label for="idade" class="col-sm-2 control-label">
		<g:message code="inscricao.idade.label" default="Idade" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:field class="form-control" name="pessoa.idade" type="number" value="${inscricaoInstance?.pessoa?.idade}" required="" disabled="${'show'.equals(actionName)}"/>
	</div>

</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'sexo', 'error')} required">
	<label for="sexo" class="col-sm-2 control-label">
		<g:message code="inscricao.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:select class="form-control" name="pessoa.sexo" from="${['M', 'F']}" required="" value="${inscricaoInstance?.pessoa?.sexo}" disabled="${'show'.equals(actionName)}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'cidade', 'error')} required">
	<label for="cidade" class="col-sm-2 control-label">
		<g:message code="inscricao.cidade.label" default="Cidade" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="pessoa.cidade" required="" value="${inscricaoInstance?.pessoa?.cidade}" disabled="${'show'.equals(actionName)}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'estado', 'error')} required">
	<label for="estado" class="col-sm-2 control-label">
		<g:message code="inscricao.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="pessoa.estado" required="" value="${inscricaoInstance?.pessoa?.estado}" disabled="${'show'.equals(actionName)}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'pais', 'error')} required">
	<label for="pais" class="col-sm-2 control-label">
		<g:message code="inscricao.pais.label" default="Pais" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="pessoa.pais" required="" value="${inscricaoInstance?.pessoa?.pais}" disabled="${'show'.equals(actionName)}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: inscricaoInstance, field: 'pastorResponsavel', 'error')} required">
	<label for="pais" class="col-sm-2 control-label">
		<g:message code="inscricao.pastorResponsavel.label" default="Pastor Responsavel" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="pastorResponsavel" required="" value="${inscricaoInstance?.pastorResponsavel}" disabled="${'show'.equals(actionName)}"/>
	</div>
</div>