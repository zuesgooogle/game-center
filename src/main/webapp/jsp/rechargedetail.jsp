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
	
	<title>充值信息</title>
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
					<div class="col-sm-6">
						<div class="panel panel-info">
							<div class="panel-heading">
								<h3 class="panel-title">充值明细</h3>
							</div>
							<div class="panel-body">
								<form id="rechargeForm" action="recharge/pay" method="post" role="form" class="form-horizontal selectzone">
									<div class="form-group">
										<label class="col-sm-3 control-label">充值区服</label> 
										<div class="col-sm-8">
											${serverId} 服
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label">充值金额</label>
										<div class="col-sm-8">
											<a class="btn btn-primary btn-group-justified">
													100RMB = 1.1万 元宝 <span class="badge">10%</span>
											</a>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label">支付方式</label>
										<div class="col-sm-8">
											<img alt="" src="/images/pay/zhifubao.png">
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
											
					<div class="col-sm-6">
						<div class="panel panel-info">
							<div class="panel-heading">
								<h3 class="panel-title">支付二维码</h3>
							</div>
							<div class="panel-body">
									<div class="form-group">
										<label class="col-sm-3 control-label">充值金额</label>
										<div class="col-sm-8">
											<a class="btn btn-primary btn-group-justified">
													100RMB = 1.1万 元宝 <span class="badge">10%</span>
											</a>
										</div>
									</div>
							</div>
						</div>
					</div>
			</div>	
		</div>
	</div>

    </div> <!-- /container -->
			
	<%@ include file="footer.jsp"%>
		
	<input type="hidden" id="navTag" value="2"></input>
	<script src="/js/require.js" data-main="/js/s4game/recharge"></script>
</body>

</html>
