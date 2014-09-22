<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><g:message code="Login"/></title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'signin.css')}" type="text/css">
    <script src="${resource(dir: 'js', file: 'jquery.js')}"></script>

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
         <div class="alert alert-warning text-center" role="status" id="alerta"><a class="close" data-dismiss="alert" onclick="$('#alerta').hide(500);">×</a>${flash.message}</div>
        </g:if>
        <div class="col-sm-6 col-md-4 col-md-offset-4">
          <h1 class="text-center login-title">Acesso ao Sistema de Eventos</h1>
          <div class="account-wall">
            <img class="profile-img" src="${assetPath(src: 'logo.png')}" alt="">
            <g:form class="form-signin" url="[controller:'usuario', action:'login']">
              <input type="text" class="form-control" name="usuario" placeholder="Usuário" required autofocus>
              <input type="password" class="form-control" name="senha" placeholder="Senha" required>
              <button class="btn btn-lg btn-primary btn-block" type="submit">
                <g:message code="Entrar"/>
              </button>
              <a href="#" class="pull-right need-help">Precisa de Ajuda? </a><span class="clearfix"></span>
            </g:form>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
