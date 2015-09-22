<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
	<meta charset="utf-8">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrap-theme.min.css" rel="stylesheet">
	<link href="css/s4game-main.css" rel="stylesheet">
	<link href="css/s4game-footer.css" rel="stylesheet">
	
</head>

<body>
	
	<nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">简单游戏</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse" aria-expanded="false" style="height: 1px;">
          <ul class="nav navbar-nav">
            <li><a href="/">首页</a></li>
            <li><a href="/game">游戏</a></li>
            <li><a href="/recharge">充值</a></li>
            <li class="active"><a href="/about">关于</a></li>
          </ul>
          <form id="form" action="" class="navbar-form navbar-right" role="form">
	          <div class="form-group">
	            
	          </div>
	          
	          <a type="button" class="btn btn-primary" href="/view/login">登录</a>
	          <a type="button" class="btn btn-success" href="/view/register">快速注册</a>
	      </form>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
	
    <div class="container">
		<div class="jumbotron">

        <p>简单游戏，为玩家打造清新、一体化体验的服务平台。</p>
		
		<p class="btn btn-link">zeusgooogle@gmail.com</p>   
      </div>
	
    </div> <!-- /container -->
		
	<%@ include file="footer.jsp"%>
	<script src="/js/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>

</body>

</html>
