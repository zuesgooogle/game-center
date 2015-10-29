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

	<title>应用管理</title>

</head>
<body>
	<%@ include file="../nav.jsp"%>
	
	<div class="container-fluid">
	<%@ include file="menu.jsp"%>

	<div class="col-sm-10 mask">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">应用管理</h3>
			</div>
			<div class="panel-body">
				<button type="button" class="btn btn-success" data-toggle="modal" id="addAppBtn"><span class="glyphicon glyphicon-plus">&nbsp;添加APP</span></button>

				<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>APP ID</th>
							<th>APP KEY</th>
							<th>名称</th>
							<th>创建者</th>
							<th>创建时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="serverBody">
						<c:forEach var="app"  items="${apps}" varStatus="s" >
							<tr id="tr-${app.id}" <c:if test="${s.count % 2 == 0}">class="info"</c:if> >
								<td>${app.id}</td>
								<td>${app.key}</td>
								<td>${app.name}</td>
								<td>${app.username}</td>
								<td>${app.createTime}</td>
								<td>
									<input type="hidden" id="${app.id}" value='${app}'>
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


    <div class="modal fade mask" id="appModal" tabindex="-1" role="dialog" aria-labelledby="largeModal" aria-hidden="true">
      <div class="modal-dialog modal-default">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">应用信息</h4>
          </div>
          <div class="modal-body">
          	<form id="serverForm" role="form" class="form-horizontal" data-toggle="validator">
				<fieldset>
					<legend></legend>
					<div class="form-group">
						<label class="col-sm-4 control-label">ID</label> 
						<div class="col-sm-8">
							<input id="id" type="text" class="form-control" placeholder="服务器自动生成" disabled>
						</div>
					</div>
					<div class="form-group">	
						<label class="col-sm-4 control-label">名称</label> 
						<div class="col-sm-8">
							<input id="name" type="text" class="form-control" required>
						</div>
					</div>
				</fieldset>
			</form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            <button type="button" class="btn btn-primary" id="updateAppBtn">保存</button>
          </div>
        </div>
      </div>
    </div>

	
	<%@ include file="../footer.jsp"%>
	<script src="/js/require.js" data-main="js/s4game/server"></script>
</body>
</html>