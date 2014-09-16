<%@ page import="com.igreja.se.Evento" %>



<div class="fieldcontain ${hasErrors(bean: eventoInstance, field: 'pessoas', 'error')} ">
	<label for="pessoas">
		<g:message code="evento.pessoas.label" default="Pessoas" />
		
	</label>
	<g:select name="pessoas" from="${com.igreja.se.Pessoa.list()}" multiple="multiple" optionKey="id" size="5" value="${eventoInstance?.pessoas*.id}" class="many-to-many"/>

</div>

