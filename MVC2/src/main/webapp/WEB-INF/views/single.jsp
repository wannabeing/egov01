<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>MVC02</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	$(document).ready(function(){
  		loadList();    	 
 	});
  	function loadList(){
  		// 서버와 통신 : 게시판 리스트 가져오기
    	$.ajax({
    		url : "boardList.do",
    		type : "GET",
    		dataType : "json",
    		success : makeView,
    		error : function(){ alert("error");  }    		
    	});
  	}
  	function makeView(data){
  		let listHtml = "<table class='table table-bordered'>";
  		listHtml+="<tr>";
  		listHtml+="<td>번호</td>";
  		listHtml+="<td>제목</td>";
  		listHtml+="<td>작성자</td>";
	   	listHtml+="<td>작성일</td>";
	   	listHtml+="<td>조회수</td>";
	   	listHtml+="</tr>";
	   	$.each(data, function(index, obj){ // obj={"idx":5,"title":"게시판"~~ }
	   		listHtml+="<tr>";
	       	listHtml+="<td>"+obj.idx+"</td>";
	       	listHtml+="<td id='t"+obj.idx+"'><a href='javascript:goContent("+obj.idx+")'>"+obj.title+"</a></td>";
	       	listHtml+="<td>"+obj.writer+"</td>";
	       	listHtml+="<td>"+obj.indate.split(' ')[0]+"</td>";
	       	listHtml+="<td id='cnt"+obj.idx+"'>"+obj.count+"</td>";
	       	listHtml+="</tr>";
	       	 
	       	listHtml+="<tr id='c"+obj.idx+"' style='display:none'>";
	       	listHtml+="<td>내용</td>";
	       	listHtml+="<td colspan='4'>";
	       	listHtml+="<textarea id='ta"+obj.idx+"' readonly rows='7' class='form-control'></textarea>";
	       	listHtml+="<br/>";
	       	listHtml+="<span id='ub"+obj.idx+"'><button class='btn btn-success btn-sm' onclick='goUpdateForm("+obj.idx+")'>수정화면</button></span>&nbsp;";
	       	listHtml+="<button class='btn btn-warning btn-sm' onclick='goDelete("+obj.idx+")'>삭제</button>";        	 
	       	listHtml+="</td>";
	       	listHtml+="</tr>";
   	 	});
	   	listHtml+="<tr>";
	   	listHtml+="<td colspan='5'>";
	   	listHtml+="<button class='btn btn-primary btn-sm' onclick='goForm()'>글쓰기</button>";
	   	listHtml+="</td>";
	   	listHtml+="</tr>";
	   	listHtml+="</table>";
	   	$("#view").html(listHtml);
  	}
  </script>
</head>
<body> 
 
<div class="container">
  <h2>MVC02</h2>
  <div class="panel panel-default">
    <div class="panel-heading">A Basic 1</div>
    <div id="view" class="panel-body">
       </div>
    <div class="panel-footer">A Basic 3</div>
  </div>
</div>

</body>
</html>
