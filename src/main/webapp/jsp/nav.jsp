<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">简单游戏</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse" aria-expanded="false" style="height: 1px;">
          <ul class="nav navbar-nav">
            <li><a href="/">首页</a></li>
            <li><a href="/game">游戏</a></li>
            <li><a href="/recharge">充值</a></li>
            <li><a href="/about">关于</a></li>
          </ul>

		  
		  <c:if test="${pageContext.request.userPrincipal.name != null}">
			  <ul class="nav navbar-nav navbar-right">
			  	<li class="dropdown">
	                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${pageContext.request.userPrincipal.name} <span class="caret"></span></a>
	                <ul class="dropdown-menu">
	                  <li><a href="/logout">退出</a></li>
	                </ul>
	              </li>
			  </ul>	
		  </c:if>
		  
		  <c:if test="${pageContext.request.userPrincipal.name == null}">
	          <form id="form" action="" class="navbar-form navbar-right" role="form">
		          <div class="form-group">
		            
		          </div>
		          <a type="button" class="btn btn-primary" href="/login">登录</a>
		          <a type="button" class="btn btn-success" href="/register">快速注册</a>
		      </form>
	      </c:if>
        </div><!--/.nav-collapse -->
      </div>
    </nav>