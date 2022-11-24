<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="${contextPath}/">SP1</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${contextPath}/">Home</a></li>
        <li><a href="board">Board</a></li>
        <li><a href="#">Page 2</a></li>
      </ul>
      <!-- 로그인여부 -->
      <c:choose>
      	<c:when test="${empty userInfo}">
      		<ul class="nav navbar-nav navbar-right">
		        <li><a href="${contextPath}/signup.do"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
		        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	      </ul>
      	</c:when>
      	<c:when test="${!empty userInfo}">
      		<ul class="nav navbar-nav navbar-right">
      			<li class="dropdown">
		          <a class="dropdown-toggle" data-toggle="dropdown" href="#">MyPAGE <span class="caret"></span></a>
		          <ul class="dropdown-menu" id="myPage">
		            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Edit Profile</a></li>
		            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Upload Profile</a></li>
		            <li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
		          </ul>
	        	</li>
	      </ul>
      	</c:when>
      
      </c:choose>
    </div>
  </div>
</nav>