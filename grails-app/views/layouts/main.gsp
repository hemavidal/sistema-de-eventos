<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Sistema de Enventos" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="${assetPath(src: 'logo.png')}">
<link rel="apple-touch-icon"
	href="${assetPath(src: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${assetPath(src: 'apple-touch-icon-retina.png')}">

    <asset:stylesheet src="application.css"/>
    
<g:layoutHead />
<r:layoutResources />
</head>
<body>

	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid" id="navfluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navigationbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/sistema-de-eventos"><img
					height="25" width="25" src="${assetPath(src: 'logo.png')}" alt="">Sistema
					de Eventos</a>
			</div>
			<div class="collapse navbar-collapse" id="navigationbar">
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
					<p class="navbar-text navbar-right">
						<a href="/sistema-de-eventos/usuario/login" class="navbar-link">Login</a>
					</p>
				</g:if>
				<g:else>
					<p class="navbar-text navbar-right">
						Logado como: "${session.usuario.login}" <a
							href="/sistema-de-eventos/usuario/logout" class="navbar-link">Logout</a>
					</p>
				</g:else>
				
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<div class="container">
		<g:layoutBody />

		<hr>

		<footer>
			<p>&copy; SofITenG 2014</p>
		</footer>
	</div>

	<r:layoutResources />
	<asset:javascript src="application.js"/>
</body>
</html>
