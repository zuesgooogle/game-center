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
			
				<button type="button" class="btn btn-success" data-toggle="modal" data-target="#addModal">新增</button>

				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>服名称</th>
							<th>服IP</th>
							<th>服端口</th>
							<th>数据库IP</th>
							<th>数据库名</th>
							<th>状态</th>
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
								<td>${server.status}</td>
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


    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">Large Modal</h4>
          </div>
          <div class="modal-body">
            <h3>Modal Body</h3>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Save changes</button>
          </div>
        </div>
      </div>
    </div>

	
	<%@ include file="../footer.jsp"%>
	<script src="/js/require.js" data-main="js/s4game/console"></script>
</body>
</html>