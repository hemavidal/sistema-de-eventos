<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Sistema de Enventos"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'logo.png')}">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		
  		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

		<!-- Optional theme -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
		
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  		
		<g:layoutHead/>
		<r:layoutResources/>
	</head>
	<body>
		
		<div class="navbar navbar-default">
	        <div class="container">
	          <div class="navbar-header">
	            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
	              <span class="sr-only">Toggle navigation</span>
	              <span class="icon-bar"></span>
	              <span class="icon-bar"></span>
	              <span class="icon-bar"></span>
	            </button>
	            <a class="navbar-brand" href="/sistema-de-eventos"><img height="25" width="25" src="${assetPath(src: 'logo.png')}" alt="">Sistema de Eventos</a>
	          </div>
	          <div class="navbar-collapse collapse">
	            <ul class="nav navbar-nav">
	              <li class="active"><a href="./">Início</a></li>
	              <g:if test="${session.usuario}">
	              	<li><a href="/sistema-de-eventos/evento/index">Eventos</a></li>
	              	<li><a href="/sistema-de-eventos/pessoa/index">Pessoas</a></li>
	              	<li><a href="/sistema-de-eventos/usuario/index">Usuários</a></li>
	              	<li><a href="/sistema-de-eventos/inscricao/index">Inscrições</a></li>
	              </g:if>
	            </ul>
	          <g:if test="${!session.usuario}">  
	          	<p class="navbar-text navbar-right"><a href="/sistema-de-eventos/usuario/login" class="navbar-link">Login</a></p>
	          </g:if>
	          <g:else>
	          	<p class="navbar-text navbar-right">Logado como: "${session.usuario.login}" <a href="/sistema-de-eventos/usuario/logout" class="navbar-link">Logout</a></p>
	          </g:else>
	          </div><!--/.nav-collapse -->
	        </div>
      	</div>

		<div class="container">
			<g:layoutBody/>

			<hr>

			<footer>
				<p>&copy; SofITenG 2014</p>
			</footer>
		</div>

		<r:layoutResources/>
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	</body>
</html>
