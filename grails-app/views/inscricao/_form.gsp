<%@ page import="com.igreja.se.Inscricao" %>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'nome', 'error')} required">
	<label for="nome" class="col-sm-2 control-label">
		<g:message code="inscricao.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="nome" required="" value="${pessoaInstance?.nome}"/>
	</div>

</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'idade', 'error')} required">
	<label for="idade" class="col-sm-2 control-label">
		<g:message code="inscricao.idade.label" default="Idade" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:field class="form-control" name="idade" type="number" value="${pessoaInstance?.idade}" required=""/>
	</div>

</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'sexo', 'error')} required">
	<label for="sexo" class="col-sm-2 control-label">
		<g:message code="inscricao.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:select class="form-control" name="sexo" from="${['M', 'F']}" required="" value="${pessoaInstance?.sexo}" />
	</div>
</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'cidade', 'error')} required">
	<label for="cidade" class="col-sm-2 control-label">
		<g:message code="inscricao.cidade.label" default="Cidade" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="cidade" required="" value="${pessoaInstance?.cidade}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'estado', 'error')} required">
	<label for="estado" class="col-sm-2 control-label">
		<g:message code="inscricao.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="estado" required="" value="${pessoaInstance?.estado}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'pais', 'error')} required">
	<label for="pais" class="col-sm-2 control-label">
		<g:message code="inscricao.pais.label" default="Pais" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="pais" required="" value="${pessoaInstance?.pais}"/>
	</div>
</div>

<g:if test="${actionName != 'create'}">
	<div class="form-group  ${hasErrors(bean: inscricaoInstance, field: 'isConfirmada', 'error')} ">
		<label for="isConfirmada" class="col-sm-2 control-label" >
			<g:message code="inscricao.isConfirmada.label" default="Is Confirmada" />
			
		</label>
		<div class="col-sm-10">
			<g:checkBox class="form-control" name="isConfirmada" value="${inscricaoInstance?.isConfirmada}" />
		</div>
	</div>
</g:if>

