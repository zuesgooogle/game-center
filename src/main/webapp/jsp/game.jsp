<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
	<meta charset="utf-8">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/bootstrap-theme.min.css" rel="stylesheet">
	<link href="/css/s4game-main.css" rel="stylesheet">
	<link href="/css/s4game-footer.css" rel="stylesheet">
	
	<title>游戏</title>
</head>

<body>
	
	<%@ include file="nav.jsp"%>
	
    <div class="container">
    	
		<div class="row">
			<div class="col-md-1"></div>
  			<div class="col-md-8">
  				<div class="gameview">
  					<div class="btn-start"></div>
  					<div class="select-zone">
  						您最近登录是[1服] <a class="btn btn-link" href="/game/selectzone">重新选区</a>
  					</div>
  				</div>
  			</div>
  			<div class="col-md-1"></div>
		</div>
		

    </div> <!-- /container -->
		
	<%@ include file="footer.jsp"%>
		
	<input type="hidden" id="navTag" value="1"></input>	
    <script src="js/require.js" data-main="js/main"></script>
</body>

</html>
