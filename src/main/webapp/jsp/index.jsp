<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
	<meta charset="utf-8">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrap-theme.min.css" rel="stylesheet">
	<link href="css/caroursel.css" rel="stylesheet">
	<link href="css/s4game-footer.css" rel="stylesheet">
	
</head>

<body>
	
	<%@ include file="nav.jsp"%>
	
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1" ></li>
        <li data-target="#myCarousel" data-slide-to="2" class=""></li>
      </ol>
      <div class="carousel-inner" role="listbox">
      	<div class="item active">
          <img src="data:image/gif;base64,R0lGODlhAQABAIAAAGZmZgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>充值服务</h1>
              <p>提供快速，方便的充值方式，轻松便捷。</p>
              <p><a class="btn btn-lg btn-success" href="/recharge" role="button">快速充值</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img src="data:image/gif;base64,R0lGODlhAQABAIAAAGZmZgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>变身主公</h1>
              <p>以三国题材为背景,各路神仙乱入,大乱斗.</p>
              <p><a class="btn btn-lg btn-primary" href="/game" role="button">开始游戏</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
		
	<%@ include file="footer.jsp"%>

	<input type="hidden" id="navTag" value="0"></input>	
    <script src="/js/require.js" data-main="js/main"></script>
	
</body>

</html>
