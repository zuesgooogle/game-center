<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrap-theme.min.css" rel="stylesheet">
	<link href="css/caroursel.css" rel="stylesheet">

	<link href="css/s4game-main.css" rel="stylesheet">
	<link href="css/s4game-footer.css" rel="stylesheet">
	

	<title>控制中心</title>

</head>
<body>
	<%@ include file="../nav.jsp"%>
	
	<div class="container-fluid">
	<%@ include file="menu.jsp"%>
	
	<div class="col-sm-10">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">后台管理</h3>
			</div>
			<div class="panel-body">
				<div class="col-sm-4">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">用户管理</h3>
						</div>
						<div class="panel-body">
							<p>直接操作数据库，修改元宝、铜币、VIP、背包等信息。</p>
							<p>对于用户邮件，主要用来携带发放的物品、元宝、铜币。</p>
						</div>
					</div>
					
					<div class="panel panel-danger">
						<div class="panel-heading">
							<h3 class="panel-title">Server 管理</h3>
						</div>
						<div class="panel-body">
							<p>管理服务器信息，serverId需要与腾讯平台生成的Id匹配</p>
							<p>合并数据库数据</p>
						</div>
					</div>
				</div>
				
				<div class="col-sm-4">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h3 class="panel-title">GM 命令</h3>
						</div>
						<div class="panel-body">
							<p>给在线用户发放元宝、铜币、经验等数据。</p>
							<p>&nbsp</p>
						</div>
					</div>
					
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">报表管理</h3>
						</div>
						<div class="panel-body">
							<p>查询DAU，DNU，充值等信息。</p>
							<p>&nbsp</p>
						</div>
					</div>
				</div>
				
				<div class="col-sm-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">工具箱</h3>
						</div>
						<div class="panel-body">
							<p>查看物品信息。</p>
							<p>&nbsp</p>
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