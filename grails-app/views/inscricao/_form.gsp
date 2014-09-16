<%@ page import="com.igreja.se.Inscricao" %>



<div class="fieldcontain ${hasErrors(bean: inscricaoInstance, field: 'isConfirmada', 'error')} ">
	<label for="isConfirmada">
		<g:message code="inscricao.isConfirmada.label" default="Is Confirmada" />
		
	</label>
	<g:checkBox name="isConfirmada" value="${inscricaoInstance?.isConfirmada}" />

</div>

<div class="fieldcontain ${hasErrors(bean: inscricaoInstance, field: 'pessoa', 'error')} required">
	<label for="pessoa">
		<g:message code="inscricao.pessoa.label" default="Pessoa" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="pessoa" name="pessoa.id" from="${com.igreja.se.Pessoa.list()}" optionKey="id" required="" value="${inscricaoInstance?.pessoa?.id}" class="many-to-one"/>

</div>

