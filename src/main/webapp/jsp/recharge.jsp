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
					<div class="form-group navbar-form navbar-right has-success">
            			<input class="form-control selectzone" type="text" value="1RMB = 100元宝" readonly >					
					</div>

					<form id="rechargeForm" action="recharge/detail" method="post" role="form" data-toggle="validator" class="form-horizontal selectzone">
						<fieldset>
							<legend>区服列表</legend>
							<div class="form-group">
								<label class="col-sm-3 control-label">请选择充值服</label> 
								<div class="col-sm-8">
									<select name="serverId" class="selectpicker" data-width="100%">
									    <option value="1">1服</option>
									    <option value="2">2服</option>
									    <option value="3">3服</option>
									    <option value="4">4服</option>
									</select>
								</div>
							</div>
							
							<div class="form-group"></div>
							<div class="form-group"></div>
							
						</fieldset>
						<fieldset>
							<legend>充值金额</legend>
							<div class="form-group">
								<div class="col-sm-3">
									<label class="radio-inline">
							        	<input type="radio" name="priceRadio" value="1" required>
										<a class="btn btn-default btn-group-justified">
											10RMB = 1000 元宝
										</a>								      		
							      	</label>
								</div>
								<div class="col-sm-3">
									<label class="radio-inline">
							        	<input type="radio" name="priceRadio" value="2" required>
										<a class="btn btn-default btn-group-justified">
											50RMB = 5000 元宝
										</a>								      		
							      	</label>
								</div>
								<div class="col-sm-3">
									<label class="radio-inline">
							        	<input type="radio" name="priceRadio" value="3" required>
										<a class="btn btn-primary btn-group-justified">
											100RMB = 1.1万 元宝 <span class="badge">10%</span>
										</a>								      		
							      	</label>
								</div>
								<div class="col-sm-3">
									<label class="radio-inline">
							        	<input type="radio" name="priceRadio" value="4" required>
										<a class="btn btn-primary btn-group-justified">
											500RMB = 5.75万 元宝 <span class="badge">15%</span>
										</a>								      		
							      	</label>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-3">
									<label class="radio-inline">
							        	<input type="radio" name="priceRadio" value="5" required>
										<a class="btn btn-primary btn-group-justified">
											1000RMB = 12万 元宝 <span class="badge">20%</span>
										</a>								      		
							      	</label>
								</div>
								<div class="col-sm-3">
									<label class="radio-inline">
							        	<input type="radio" name="priceRadio" value="6" required>
										<a class="btn btn-primary btn-group-justified">
											2000RMB = 25万 元宝 <span class="badge">25%</span>
										</a>								      		
							      	</label>
								</div>
								<div class="col-sm-3">
									<label class="radio-inline">
							        	<input type="radio" name="priceRadio" value="7" required>
										<a class="btn btn-primary btn-group-justified">
											3000RMB = 39万 元宝 <span class="badge">30%</span>
										</a>								      		
							      	</label>
								</div>
								<div class="col-sm-3">
									<label class="radio-inline">
							        	<input type="radio" name="priceRadio" value="8" required>
										<a class="btn btn-danger btn-group-justified">
											5000RMB = 75万 元宝 <span class="badge">50%</span>
										</a>								      		
							      	</label>
								</div>
							</div>
							<div class="form-group"></div>
							
						</fieldset>
						<fieldset>
							<legend>支付方式</legend>
					    	<label class="radio-inline">
					        	<input type="radio" name="typeRadio" value="weixin" required> 微信
					        	<img alt="" src="images/pay/weixin.jpg">
					      	</label>
					      	<label class="radio-inline">
					        	<input type="radio" name="typeRadio" value="zhifubao" required> 支付宝
					        	<img alt="" src="images/pay/zhifubao.png">
					      	</label>
						</fieldset>
						
						<br/>
						<button class="btn btn-success btn-lg btn-block" id="payBtn" type="button">支付</button>
					</form>
			</div>	
		</div>
	</div>

    </div> <!-- /container -->
			
	<%@ include file="footer.jsp"%>
		
	<input type="hidden" id="navTag" value="2"></input>
	<script src="/js/require.js" data-main="js/s4game/recharge"></script>
</body>

</html>
