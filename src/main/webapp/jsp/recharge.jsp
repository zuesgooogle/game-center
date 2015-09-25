<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="UTF-8">

<head>
	<meta charset="utf-8">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/bootstrap-select.min.css" rel="stylesheet">
	<link href="/css/bootstrap-theme.min.css" rel="stylesheet">
	
	<link href="/css/s4game-main.css" rel="stylesheet">
	<link href="/css/s4game-footer.css" rel="stylesheet">
	
	<title>充值 </title>
</head>

<body>
	
	<%@ include file="nav.jsp"%>
	
    <div class="container">
		<div class="col-12">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title"><strong>游戏名: 变身主公</strong></h3>
				</div>
				<div class="panel-body">
					<form id="serverForm" role="form" class="form-horizontal selectzone">
						<fieldset>
							<legend>选服列表</legend>
							<div class="form-group">
								<label class="col-sm-3 control-label">请选择充值服</label> 
								<div class="col-sm-8">
									<select class="selectpicker" data-width="100%">
									    <option>Mustard</option>
									    <option>Ketchup</option>
									    <option>Relish</option>
									</select>
								</div>
							</div>
							
							<div class="form-group"></div>
							<div class="form-group"></div>
							
						</fieldset>
						<fieldset>
							<legend>最近登录服务器</legend>
							<div class="form-group">
								<div class="col-sm-3">
									<a class="btn btn-default btn-group-justified btn-sm">1服</a>
								</div>
								<div class="col-sm-3">
									<a class="btn btn-default btn-group-justified btn-sm">2服</a>
								</div>
								<div class="col-sm-3">
									<a class="btn btn-default btn-group-justified btn-sm">3服</a>
								</div>
								<div class="col-sm-3">
									<a class="btn btn-default btn-group-justified btn-sm">4服</a>
								</div>
							</div>
							
							<div class="form-group"></div>
							<div class="form-group"></div>
							
						</fieldset>
						<fieldset>
							<legend>所有服务器</legend>
							<div class="form-group">
								<div class="col-sm-3">
									<a class="btn btn-default btn-group-justified btn-sm">1服</a>
								</div>
								
							</div>
							
						</fieldset>
					</form>
			</div>	
		</div>
	</div>

    </div> <!-- /container -->
			
	<%@ include file="footer.jsp"%>
		
	<script src="/js/require.js" data-main="js/s4game/recharge"></script>
</body>

</html>
