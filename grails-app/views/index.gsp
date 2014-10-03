<%@ page import="com.igreja.se.Evento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Sistema de Eventos - Igreja em Campina Grande</title>
		
	</head>
	<body>
		<!-- START THE FEATURETTES -->

      <h1>Eventos</h1>
      <hr class="featurette-divider">

	  <g:each in="${Evento.list()}" status="i" var="eventoInstance">
		<div class="row featurette">
			<div class="col-md-7">
				<g:link controller="evento" action="show" id="${eventoInstance.id}">
					<h1 class="featurette-heading">
						${eventoInstance.nome}<span class="text-muted"></span>
					</h1>
				</g:link>
				<h2 class="featurette-heading">Descrição</h2>
				<p class="lead">${eventoInstance.descricao}</p>
				
				<h2 class="featurette-heading">Valor do Retiro</h2>
				<p class="lead">${eventoInstance.valorInscricao}</p>
				
				<h2 class="featurette-heading">Vagas</h2>
				<p class="lead">${eventoInstance.vagas}</p>
				<p class="lead">${eventoInstance.infoDeVagas}</p>
				
				<h2 class="featurette-heading">Data do Retiro</h2>
				<p class="lead">Início: ${eventoInstance.inicioDoEvento.format('dd/MM/yyyy - HH:mm')}</p>
				<p class="lead">Fim: ${eventoInstance.fimDoEvento.format('dd/MM/yyyy - HH:mm')}</p>
				
				<h2 class="featurette-heading">Data Limite para Inscrição do Retiro</h2>
				<p class="lead">${eventoInstance.fimDasInscricoes.format('dd/MM/yyyy - HH:mm')}</p>
				
				<h2 class="featurette-heading">Local</h2>
				<p class="lead">${eventoInstance.endereco + ', ' + eventoInstance.cidade + ', ' + eventoInstance.estado}</p>
				
				<h2 class="featurette-heading">Informações Complementares</h2>
				<p class="lead">${eventoInstance.informacoes}</p>
				
				<p class="lead"><a href="https://www.google.com.br/maps/@-7.2711115,-36.2310166,253m/data=!3m1!1e3?hl=pt-BR">Veja no mapa</a></p>
				
				<g:link url="/sistema-de-eventos/inscricao/create?evento=${eventoInstance.id}" >
					<p class="lead glyphicon glyphicon-pencil btn btn-success">Inscrição</p>
				</g:link>
				
			</div>
			<div class="col-md-5 holder">
				<g:link controller="evento" action="show" id="${eventoInstance.id}">
					<img class="featurette-image img-responsive" width="20%"
						src="${assetPath(src: 'logo_retiro_jovens.jpg')}"
						alt="Generic placeholder image">
				</g:link>
			</div>
			
		</div>
	</g:each>
      <hr class="featurette-divider">

      <!-- /END THE FEATURETTES -->
	</body>
</html>
