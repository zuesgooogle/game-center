<%@ page contentType="text/html; charset=UTF-8"%>

<div class="modal fade mask" id="loginQuickModal" tabindex="-1" role="dialog" aria-labelledby="loginquickModal" aria-hidden="true">
	<div class="modal-dialog modal-default">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">快速登录</h4>
			</div>
			<div class="modal-body">
	
				<br />
				<form id="loginQuickForm" data-toggle="validator" role="form">
					<div class="form-group">
						<input id="username" type="text" class="form-control" placeholder="请输入账号" required autofocus>
						<div class="help-block with-errors"></div>
					</div>
					<br />
					<div class="form-group">
						<input id="password" type="password" class="form-control" placeholder="请输入密码" required>
						<div class="help-block with-errors"></div>
					</div>

					<br />
					
					<div class="col-sm-4"></div>
					<div class="col-sm-4">
						<button class="btn btn-primary btn-block" id="loginQuickBtn" type="button">登录</button>						
					</div>
					<div class="col-sm-4"></div>
					
					<br />
					<br />
				</form>

			</div>
			<!-- 
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          </div>
           -->
		</div>
	</div>
</div>
