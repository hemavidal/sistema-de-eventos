<%@ page import="com.igreja.se.Evento" %>



<div class="form-group ${hasErrors(bean: eventoInstance, field: 'nome', 'error')} required" >
	<label for="nome" class="col-sm-2 control-label">
		<g:message code="evento.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="nome" required="" value="${eventoInstance?.nome}" disabled="${'show'.equals(actionName)}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: eventoInstance, field: 'descricao', 'error')} required">
	<label for="descricao" class="col-sm-2 control-label">
		<g:message code="evento.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="descricao" required="" value="${eventoInstance?.descricao}" disabled="${'show'.equals(actionName)}"/>
	</div>

</div>

<div class="form-group ${hasErrors(bean: eventoInstance, field: 'valorInscricao', 'error')} required">
	<label for="valorInscricao" class="col-sm-2 control-label">
		<g:message code="evento.valorInscricao.label" default="Valor da Inscricao" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="valorInscricao" value="${fieldValue(bean: eventoInstance, field: 'valorInscricao')}" type="number" required="" disabled="${'show'.equals(actionName)}"/>
	</div>

</div>

<div class="form-group ${hasErrors(bean: eventoInstance, field: 'cidade', 'error')} required">
	<label for="cidade" class="col-sm-2 control-label">
		<g:message code="evento.cidade.label" default="Cidade" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="cidade" required="" value="${eventoInstance?.cidade}" disabled="${'show'.equals(actionName)}"/>
	</div>

</div>

<div class="form-group ${hasErrors(bean: eventoInstance, field: 'endereco', 'error')} required">
	<label for="endereco" class="col-sm-2 control-label">
		<g:message code="evento.endereco.label" default="Endereco" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="endereco" required="" value="${eventoInstance?.endereco}" disabled="${'show'.equals(actionName)}"/>
	</div>

</div>

<div class="form-group ${hasErrors(bean: eventoInstance, field: 'estado', 'error')} required">
	<label for="estado" class="col-sm-2 control-label">
		<g:message code="evento.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="estado" required="" value="${eventoInstance?.estado}" disabled="${'show'.equals(actionName)}"/>
	</div>

</div>

<div class="form-group ${hasErrors(bean: eventoInstance, field: 'informacoes', 'error')} required">
	<label for="informacoes" class="col-sm-2 control-label">
		<g:message code="evento.informacoes.label" default="Informacoes" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="informacoes" required="" value="${eventoInstance?.informacoes}" disabled="${'show'.equals(actionName)}"/>
	</div>

</div>

<div class="form-group ${hasErrors(bean: eventoInstance, field: 'pais', 'error')} required">
	<label for="pais" class="col-sm-2 control-label">
		<g:message code="evento.pais.label" default="Pais" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:textField class="form-control" name="pais" required="" value="${eventoInstance?.pais}" disabled="${'show'.equals(actionName)}"/>
	</div>

</div>

<div class="form-group ${hasErrors(bean: eventoInstance, field: 'inicioDoEvento', 'error')} required">
	<label for="inicioDoEvento" class="col-sm-2 control-label">
		<g:message code="evento.inicioDoEvento.label" default="Data de Início" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:datePicker class="form-control" name="inicioDoEvento" value="${new Date()}"
              noSelection="['':'-Selecione-']" disabled="${'show'.equals(actionName)}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: eventoInstance, field: 'fimDoEvento', 'error')} required">
	<label for="fimDoEvento" class="col-sm-2 control-label">
		<g:message code="evento.fimDoEvento.label" default="Data de Término" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:datePicker class="form-control" name="fimDoEvento" value="${new Date()}"
              noSelection="['':'-Selecione-']" disabled="${'show'.equals(actionName)}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: eventoInstance, field: 'fimDasInscricoes', 'error')} required">
	<label for="fimDasInscricoes" class="col-sm-2 control-label">
		<g:message code="evento.fimDasInscricoes.label" default="Data limite para Inscrição" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:datePicker class="form-control" name="fimDasInscricoes" value="${new Date()}"
              noSelection="['':'-Selecione-']" disabled="${'show'.equals(actionName)}"/>
	</div>
</div>
