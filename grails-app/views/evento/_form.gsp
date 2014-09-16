<%@ page import="com.igreja.se.Evento" %>



<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="evento.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${eventoInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="evento.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${eventoInstance?.descricao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'inscricao', 'error')} required">
	<label for="inscricao">
		<g:message code="evento.inscricao.label" default="Inscricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="inscricao" value="${fieldValue(bean: eventoInstance, field: 'inscricao')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'cidade', 'error')} required">
	<label for="cidade">
		<g:message code="evento.cidade.label" default="Cidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cidade" required="" value="${eventoInstance?.cidade}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'endereco', 'error')} required">
	<label for="endereco">
		<g:message code="evento.endereco.label" default="Endereco" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="endereco" required="" value="${eventoInstance?.endereco}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="evento.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="estado" required="" value="${eventoInstance?.estado}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'informacoes', 'error')} required">
	<label for="informacoes">
		<g:message code="evento.informacoes.label" default="Informacoes" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="informacoes" required="" value="${eventoInstance?.informacoes}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'inscricoes', 'error')} ">
	<label for="inscricoes">
		<g:message code="evento.inscricoes.label" default="Inscricoes" />
		
	</label>
	<g:select name="inscricoes" from="${com.igreja.se.Inscricao.list()}" multiple="multiple" optionKey="id" size="5" value="${eventoInstance?.inscricoes*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'pais', 'error')} required">
	<label for="pais">
		<g:message code="evento.pais.label" default="Pais" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="pais" required="" value="${eventoInstance?.pais}"/>

</div>

