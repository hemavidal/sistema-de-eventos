<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="layout" content="main">
<title><g:message code="Login" /></title>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="container">
		<div class="row">
			<g:if test="${flash.message}">
				<div class="alert alert-warning text-center" role="status"
					id="alerta">
					<a class="close" data-dismiss="alert"
						onclick="$('#alerta').hide(500);">×</a>
					${flash.message}
				</div>
			</g:if>

			<div class="container">

				<g:form class="form-signin" role="form"
					url="[controller:'usuario', action:'authenticate']">
					<h2 class="form-signin-heading">Please sign in</h2>
					<input type="email" class="form-control" name="login"
						placeholder="Email address" required autofocus>
					<input type="password" class="form-control" name="senha" placeholder="Senha" 
						required>
					<button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
				</g:form>

			</div>

		</div>
	</div>
</body>
</html>
