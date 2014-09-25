<%@ page import="com.igreja.se.Inscricao" %>
<%@ page import="com.igreja.se.Evento" %>

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

<g:if test="${actionName != 'create'}">
	<div class="form-group  ${hasErrors(bean: inscricaoInstance, field: 'isConfirmada', 'error')} ">
		<label for="isConfirmada" class="col-sm-2 control-label" >
			<g:message code="inscricao.isConfirmada.label" default="Is Confirmada" />
		</label>
		<div class="col-sm-10">
			<g:checkBox class="form-control" name="isConfirmada" value="${inscricaoInstance?.isConfirmada}" disabled="${'show'.equals(actionName)}"/>
		</div>
	</div>
</g:if>

<div class="form-group  ${hasErrors(bean: inscricaoInstance, field: 'comprovante', 'error')} ">
	<label for="comprovante" class="col-sm-2 control-label" >
		<g:message code="inscricao.comprovante.label" default="Comprovante de Transferência"/>
	</label>
	<div class="col-sm-10">
		<g:if test="${actionName == 'create'}">
	    	<g:field type='file' name='comprovante.file' value="${inscricaoInstance?.comprovante?.file}"/>
	    </g:if>
	    <g:else>
	    	<img width="100" height="100" src="${request.contextPath}/inscricao/displayGraph?id=${inscricaoInstance.id}"/>
	    </g:else>
	</div>
</div>

<div class="form-group" hidden="true">
	<div class="col-sm-10">
		<g:textField class="form-control" name="evento" value="${inscricaoInstance?.evento?.id}" disabled="${'show'.equals(actionName)}"/>
	</div>
</div>