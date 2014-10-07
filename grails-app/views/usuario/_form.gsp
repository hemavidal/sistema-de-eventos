<%@ page import="com.igreja.se.Usuario" %>



<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'login', 'error')} required">
	<label for="login" class="col-sm-2 control-label">
		<g:message code="usuario.login.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="login" required="" value="${usuarioInstance?.login}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: usuarioInstance, field: 'senha', 'error')} required">
	<label for="senha" class="col-sm-2 control-label">
		<g:message code="usuario.senha.label" default="Senha" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" type='password' name="senha" required="" value="${actionName.equals('create')? usuarioInstance?.senha : ''}" disabled="${!'create'.equals(actionName)}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'email', 'error')} required">
	<label for="email" class="col-sm-2 control-label">
		<g:message code="inscricao.nome.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" type="email" name="pessoa.email" required="" value="${usuarioInstance?.pessoa?.email}" disabled="${'show'.equals(actionName)}"/>
	</div>

</div>


<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'nome', 'error')} required">
	<label for="nome" class="col-sm-2 control-label">
		<g:message code="inscricao.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="pessoa.nome" required="" value="${usuarioInstance?.pessoa?.nome}" disabled="${'show'.equals(actionName)}"/>
	</div>

</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'dataNascimento', 'error')} required">
	<label for="dataNascimento" class="col-sm-2 control-label">
		<g:message code="inscricao.dataNascimento.label" default="Data de Nascimento" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:datePicker class="form-control" name="pessoa.dataNascimento" value="${usuario?.pessoa?.dataNascimento}"
              noSelection="['':'-Selecione-']" precision="day" disabled="${!'create'.equals(actionName)}"/>
	</div>

</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'sexo', 'error')} required">
	<label for="sexo" class="col-sm-2 control-label">
		<g:message code="inscricao.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:select class="form-control" name="pessoa.sexo" from="${['M', 'F']}" required="" value="${usuarioInstance?.pessoa?.sexo}" disabled="${'show'.equals(actionName)}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'cidade', 'error')} required">
	<label for="cidade" class="col-sm-2 control-label">
		<g:message code="inscricao.cidade.label" default="Cidade" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="pessoa.cidade" required="" value="${usuarioInstance?.pessoa?.cidade}" disabled="${'show'.equals(actionName)}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'estado', 'error')} required">
	<label for="estado" class="col-sm-2 control-label">
		<g:message code="inscricao.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="pessoa.estado" required="" value="${usuarioInstance?.pessoa?.estado}" disabled="${'show'.equals(actionName)}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'pais', 'error')} required">
	<label for="pais" class="col-sm-2 control-label">
		<g:message code="inscricao.pais.label" default="Pais" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="pessoa.pais" required="" value="${usuarioInstance?.pessoa?.pais}" disabled="${'show'.equals(actionName)}"/>
	</div>
</div>