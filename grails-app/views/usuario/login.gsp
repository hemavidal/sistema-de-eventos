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
    <style type="text/css">

.form-signin {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: normal;
}
.form-signin .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
    
    </style>
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
					<h2 class="form-signin-heading">Acesso ao Sistema de Eventos</h2>
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
