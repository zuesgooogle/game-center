<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="UTF-8">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrap-select.min.css" rel="stylesheet">
	<link href="css/bootstrap-theme.min.css" rel="stylesheet">
	<link href="css/s4game-main.css" rel="stylesheet">
	<link href="css/s4game-footer.css" rel="stylesheet">
	
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
								<h3 class="panel-title">商品明细</h3>
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
											<img alt="" src="/images/pay/${type}.png">
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label">商品描述</label>
										<div class="col-sm-8">
											<p>元宝，游戏虚拟货币，通过元宝来购买道具。</p>
											<p>元宝，元宝兑换比例，1RMB = 100元宝。</p>
											<p>元宝，只能从官方充值，其他来源切勿相信。</p>
										</div>
									</div>
									
									<div class="form-group"></div>
									<br/><br/><br/>
									
								</form>
							</div>
						</div>
					</div>
											
					<div class="col-sm-6">
						<div class="panel panel-info">
							<div class="panel-heading">
								<h3 class="panel-title">扫码支付</h3>
							</div>
							<div class="panel-body">
									<div class="form-group">
										<img src="data:image/jpg;base64,${qrcode}" alt="二维码" />
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
	<script src="/js/require.js" data-main="js/s4game/recharge"></script>
</body>

</html>
