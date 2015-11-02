<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrap-theme.min.css" rel="stylesheet">
	<link href="css/caroursel.css" rel="stylesheet">
	<link href="css/jquery.loadmask.css" rel="stylesheet">

	<link href="css/s4game-main.css" rel="stylesheet">
	<link href="css/s4game-footer.css" rel="stylesheet">
	

	<title>控制中心</title>

</head>
<body>
	<%@ include file="../nav.jsp"%>
	
	<div class="container-fluid">
		<%@ include file="menu.jsp"%>
		
		<div id="main" class="col-sm-10">

			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4 class="panel-title">控制中心</h4>
				</div>
				<div class="panel-body">
				
					<div class="col-sm-4">
						<div class="panel panel-success">
							<div class="panel-heading">
								<h3 class="panel-title">APP 管理</h3>
							</div>
							<div class="panel-body">
								<p>APP 管理</p>
							</div>
						</div>
						
						<div class="panel panel-danger">
							<div class="panel-heading">
								<h3 class="panel-title">服务管理</h3>
							</div>
							<div class="panel-body">
								<p>选区管理</p>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../footer.jsp"%>
	
	<script src="/js/require.js" data-main="js/s4game/console"></script>
</body>
</html>