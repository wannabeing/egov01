<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("enterKEY", "\n"); %>
<% pageContext.setAttribute("APP_PATH", "m01"); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>MVC01 | BoardContent</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body> 
 
<div class="container">
  <h2>${board.title}</h2>
  <div class="panel panel-default">
    <div class="panel-heading">A Basic 1</div>
    <div class="panel-body">
    	<table class="table">
          <tr>
            <td>제목</td>
            <td>${board.title}</td>
          </tr>
          <tr>
            <td>내용</td>
            <td>${fn:replace(board.content,enterKEY,"<br/>")}</td>
          </tr>
          <tr>
            <td>작성자</td>
            <td>${board.writer}</td>
          </tr>
          <tr>
            <td>작성일</td>
            <td>${fn:split(board.indate," ")[0]}</td>
          </tr>
          <tr>
           <td colspan="2" align="center">
           	<a href="/${APP_PATH}/boardList.do" class="btn btn-primary btn-sm">목록</a>
           	<a href="/${APP_PATH}/boardEditForm.do/${board.idx}" class="btn btn-warning btn-sm">수정</a>
           	<a href="/${APP_PATH}/boardDel.do/${board.idx}" class="btn btn-danger btn-sm">삭제</a>
           </td>
          </tr>
       </table> 
       </div>
    <div class="panel-footer">A Basic 3</div>
  </div>
</div>

</body>
</html>
