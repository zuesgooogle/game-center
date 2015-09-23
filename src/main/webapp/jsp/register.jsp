<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
	<meta charset="utf-8">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/bootstrap-theme.min.css" rel="stylesheet">
	
	<link href="/css/jquery.loadmask.css" rel="stylesheet">
	
	<link href="/css/s4game-login.css" rel="stylesheet">
	<link href="/css/s4game-footer.css" rel="stylesheet">
	
	<title>用户注册</title>
</head>
<body>
	<%@ include file="nav.jsp"%>

	<div class="container mask">
	
		<form id="registerForm" class="form-login" data-toggle="validator" role="form">
			<h2 class="form-login-heading">用户注册</h2>
			
			<div class="form-group">
				<input id="account" type="text" class="form-control" placeholder="请输入常用邮箱/电话" required autofocus>
				<div class="help-block with-errors"></div>
			</div>
			<br />
			
			<div class="form-group">
				<input id="password" type="password" class="form-control" placeholder="请输入密码" required>
				<div class="help-block with-errors"></div>
			</div>
			<br />
			
			<div class="form-group">
				<input id="passwordConfirm" type="password" class="form-control" data-match="#password" data-match-error="两次密码输入不一致" placeholder="请确认密码" required>
				<div class="help-block with-errors"></div>
			</div>
			<br />
			
			<button class="btn btn-lg btn-success btn-block" id="registerBtn" type=button>快速注册</button>
		</form>
	</div>
	
	<%@ include file="footer.jsp"%>
	
	<script src="/js/require.js" data-main="js/s4game/user"></script>
	
</body>
</html>