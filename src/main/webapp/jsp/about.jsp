<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrap-theme.min.css" rel="stylesheet">
	<link href="css/s4game-main.css" rel="stylesheet">
	<link href="css/s4game-footer.css" rel="stylesheet">
	
</head>

<body>
	
	<%@ include file="nav.jsp"%>
	
    <div class="container">
		<div class="jumbotron">

        <p>简单游戏，为玩家打造清新、一体化体验的服务平台。</p>
		
		<p class="btn btn-link">zeusgooogle@gmail.com</p>   
      </div>
	
    </div> <!-- /container -->
		
	<%@ include file="footer.jsp"%>
	
	<input type="hidden" id="navTag" value="3"></input>	
    <script src="/js/require.js" data-main="js/main"></script>

</body>

</html>
