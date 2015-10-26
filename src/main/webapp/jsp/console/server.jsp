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

	<link href="css/s4game-main.css" rel="stylesheet">
	<link href="css/s4game-footer.css" rel="stylesheet">

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
				<button type="button" class="btn btn-success" data-toggle="modal" id="addServerBtn"><span class="glyphicon glyphicon-plus">&nbsp;添加新服</span></button>

				<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>服名称</th>
							<th>服IP</th>
							<th>服端口</th>
							<th>数据库IP</th>
							<th>数据库实例</th>
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
								<td>${server.mysqlName}</td>
								<td>${server.status}</td>
								<td>
									<input type="hidden" id="${server.id}" value='${server}'>
									<a class="server-edit" href="javascript:void(0)" data-id="${server.id}" title="编辑"><span class="glyphicon glyphicon-edit"></span></a>
									&nbsp;
									<a class="server-remove" href="javascript:void(0)" data-id="${server.id}"  title="删除"><span class="glyphicon glyphicon-remove"></span></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
			</div>	
		</div>
	</div>

	</div>


    <div class="modal fade mask" id="addModal" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
      <div class="modal-dialog modal-default">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">服务信息</h4>
          </div>
          <div class="modal-body">
          	<form id="serverForm" role="form" class="form-horizontal" data-toggle="validator">
				<fieldset>
					<legend>服务器</legend>
					<div class="form-group">
						<label class="col-sm-2 control-label">ID</label> 
						<div class="col-sm-4">
							<input id="id" type="text" class="form-control" placeholder="服务器自动生成" disabled>
						</div>
					</div>
					<div class="form-group">	
						<label class="col-sm-2 control-label">Name</label> 
						<div class="col-sm-4">
							<input id="name" type="text" class="form-control" required>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">IP</label> 
						<div class="col-sm-4">
							<input id="serverIp" type="text" class="form-control" required>
						</div>
						
						<label class="col-sm-2 control-label">Port</label> 
						<div class="col-sm-4">
							<input id="serverPort" type="text" class="form-control" required>
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend>数据库</legend>
					<div class="form-group">
						<label class="col-sm-2 control-label">IP</label> 
						<div class="col-sm-4">
							<input id="mysqlIp" type="text" class="form-control" required>
						</div>
						<label class="col-sm-2 control-label">实例名</label> 
						<div class="col-sm-4">
							<input id="mysqlName" type="text" class="form-control" required>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"> 账户</label> 
						<div class="col-sm-4">
							<input id="mysqlUser" type="text" class="form-control" required>
						</div>
						<label class="col-sm-2 control-label">密码</label>
						<div class="col-sm-4"> 
							<input id="mysqlPass" type="text" class="form-control" required>
						</div>
					</div>
				</fieldset>
								
				<fieldset>
					<legend>状态</legend>
					<div class="form-group">
						<label class="col-sm-1 control-label"></label> 
						<div class="btn-group col-sm-8 radio" data-toggle="buttons">
						   <label class="btn btn-default active">
						      <input type="radio" name="status" value="1" checked> 停服
						   </label>
						   <label class="btn btn-success">
						      <input type="radio" name="status" value="2"> 运行中
						   </label>
						   <label class="btn btn-primary">
						      <input type="radio" name="status" value="4"> 流畅
						   </label>
						   <label class="btn btn-danger">
						      <input type="radio" name="status" value="8"> 爆满
						   </label>
						</div>	
					</div>
				</fieldset>
			</form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            <button type="button" class="btn btn-primary" id="updateServerBtn">保存</button>
          </div>
        </div>
      </div>
    </div>

	
	<%@ include file="../footer.jsp"%>
	<script src="/js/require.js" data-main="js/s4game/server"></script>
</body>
</html>