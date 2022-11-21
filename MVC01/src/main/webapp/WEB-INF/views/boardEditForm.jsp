<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("APP_PATH", "m01"); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>MVC01 | boardEdit</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body> 
 
<div class="container">
  <h2>Board Edit Form</h2>
  <div class="panel panel-default">
    <div class="panel-heading">Header</div>
    <div class="panel-body">
     <form action="../boardUpdate.do" method="post">
      <table class="table">
         <tr>
           <td>제목</td>
           <td><input type="text" name="title" class="form-control" value="${board.title}"/></td>
         </tr>
         <tr>
           <td>내용</td>
           <td><textarea rows="7" class="form-control" name="content">${board.content}</textarea> </td>
         </tr>
         <tr>
           <td>작성자</td>
           <td><input type="text" name="writer" class="form-control" value="${board.writer}" readonly="readonly"/></td>
         </tr>
         <tr>
           <td colspan="2" align="right">
           	<a href="/${APP_PATH}/boardDetail.do/${board.idx}" type="submit" class="btn btn-primary btn-sm">원본으로</a>
           	<button type="submit" class="btn btn-info btn-sm">수정</button>
           	<button type="reset" class="btn btn-warning btn-sm">취소</button>
           </td>
         </tr>
      </table>
     </form>
    </div>
    <div class="panel-footer">Footer</div>
  </div>
</div>

</body>
</html>
