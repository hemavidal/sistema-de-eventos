<%@ page import="com.igreja.se.Inscricao" %>
<%@ page import="com.igreja.se.Evento" %>

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

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'dataNascimento', 'error')} required">
	<label for="dataNascimento" class="col-sm-2 control-label">
		<g:message code="inscricao.dataNascimento.label" default="Data de Nascimento" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:datePicker class="form-control" name="pessoa.dataNascimento" value="${inscricaoInstance?.pessoa?.dataNascimento}"
              noSelection="['':'-Selecione-']" precision="day" disabled="${'show'.equals(actionName)}"/>
	</div>

</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'sexo', 'error')} required">
	<label for="sexo" class="col-sm-2 control-label">
		<g:message code="inscricao.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:select class="form-control" name="pessoa.sexo" from="${['Masculino', 'Feminino']}" required="" value="${inscricaoInstance?.pessoa?.sexo}" disabled="${'show'.equals(actionName)}"/>
	</div>
</div>

<div class="form-group ${hasErrors(bean: pessoaInstance, field: 'sangue', 'error')} required">
	<label for="sangue" class="col-sm-2 control-label">
		<g:message code="inscricao.sangue.label" default="Sangue" />
	</label>
	<div class="col-sm-10">
		<g:select class="form-control" name="pessoa.sangue" from="${['A+','A-','B+','B-','AB+','AB-','O+','O-']}"  value="${inscricaoInstance?.pessoa?.sangue}" disabled="${'show'.equals(actionName)}"/>
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

<div class="form-group ${hasErrors(bean: inscricaoInstance, field: 'localidadeIgreja', 'error')} required">
	<label for="localidadeIgreja" class="col-sm-2 control-label">
		<g:message code="inscricao.localidadeIgreja.label" default="Igreja" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-sm-10">
		<g:select class="form-control" name="localidadeIgreja" from="${['Igreja Local', 'Extra Local']}" required="" value="${inscricaoInstance?.localidadeIgreja}" disabled="${'show'.equals(actionName)}"/>
	</div>
</div>

<g:if test="${session?.usuario?.tipo.equals('admin') && actionName != 'create'}">
	<div class="form-group  ${hasErrors(bean: inscricaoInstance, field: 'isConfirmada', 'error')} ">
		<label for="isConfirmada" class="col-sm-2 control-label" >
			<g:message code="inscricao.isConfirmada.label" default="Situação" />
		</label>
		<div class="col-sm-10">
			<g:checkBox class="form-control" name="isConfirmada" value="${inscricaoInstance?.isConfirmada}" disabled="${actionName in ['show','save']}"/>
		</div>
	</div>
</g:if>

<div class="form-group  ${hasErrors(bean: inscricaoInstance, field: 'comprovante', 'error')} ">
	<label for="comprovante" class="col-sm-2 control-label" >
		<g:message code="inscricao.comprovante.label" default="Comprovante de Transferência"/>
	</label>
	<div class="col-sm-10">
		<g:if test="${actionName in ['create','save', 'edit', 'update']}">
	    	<img id="comprovanteImg" class="" width="auto" height="100px"  src="${createLinkTo(dir:'comprovantes', file:inscricaoInstance.comprovante).isEmpty() ? createLinkTo(dir:'comprovantes', file:fieldValue(bean:inscricaoInstance, field:'comprovante')) : createLinkTo(dir:'assets/images', file:'comprovante-default.png')}"/>
	    	<g:field id="comprovanteInput" type='file' name='comprovante.file'/>
	    </g:if>
	    <g:else>
	    	<img id="comprovanteImg" class="" width="auto" height="100px" src="${createLinkTo(dir:'comprovantes', file:inscricaoInstance?.comprovante)}"/>
	    </g:else>
		<p class="" style="color:red">Seu comprovante será analizado pelos responsáveis e a confirmação da inscrição será via EMAIL</p>
	</div>
</div>

<div class="form-group" hidden="true">
	<div class="col-sm-10">
		<g:textField class="form-control" name="evento" value="${inscricaoInstance?.evento?.id}" disabled="${'show'.equals(actionName)}"/>
	</div>
</div>