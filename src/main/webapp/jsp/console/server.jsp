<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
	<meta charset="utf-8">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrap-theme.min.css" rel="stylesheet">
	<link href="css/caroursel.css" rel="stylesheet">

	<link href="/css/s4game-main.css" rel="stylesheet">
	<link href="/css/s4game-footer.css" rel="stylesheet">

	<title>选区配置</title>

</head>
<body>
	<%@ include file="../nav.jsp"%>
	
	<div class="container-fluid">
	<%@ include file="menu.jsp"%>
	

	<div class="col-sm-10 mask">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">选区配置</h3>
			</div>
			<div class="panel-body">
				<form role="form" class="form-horizontal">
			        <button class="btn btn-info" id="addServerBtn" onclick="gm.updateServer();" type="button">新增</button>
				</form>
			
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>服名称</th>
							<th>服IP</th>
							<th>服端口</th>
							<th>数据库IP</th>
							<th>数据库名</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="serverBody">
						<c:forEach var="server"  items="${servers}" varStatus="s" >
							<tr id="tr-${server.id}" <c:if test="${s.count % 2 == 0}">class="info"</c:if> >
								<td>${server.id}</td>
								<td>${server.name}</td>
								<td>${server.serverIp}</td>
								<td>${server.serverPort}</td>
								<td>${server.mysqlIp}</td>
								<td>${server.mysqlUser}</td>
								<td>
									<input type="hidden" id="${server.id}" value='${server}'>
									<button type="button" value="${server.id}" onclick="gm.viewServer(this);"  class="btn btn-sm btn-info">编辑</button>
									<button type="button" value="${server.id}" onclick="gm.deleteServer(this);" class="btn btn-sm btn-danger">删除</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
			</div>	
		</div>
	</div>

	</div>
	
	<%@ include file="../footer.jsp"%>
</body>
</html>