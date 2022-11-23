<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>MVC03</title>
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
    		url : "board/list",
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
	       	listHtml+="<td id='title"+obj.idx+"'><a href='javascript:detailBoard("+obj.idx+")'>"+obj.title+"</a></td>";
	       	listHtml+="<td>"+obj.writer+"</td>";
	       	listHtml+="<td>"+obj.indate.split(' ')[0]+"</td>";
	       	listHtml+="<td id='cnt"+obj.idx+"'>"+obj.count+"</td>";
	       	listHtml+="</tr>";
	       	 
	       	listHtml+="<tr id='board"+obj.idx+"' style='display:none'>";
	       	listHtml+="<td>내용</td>";
	       	listHtml+="<td colspan='4'>";
	       	listHtml+="<textarea id='content"+obj.idx+"' readonly rows='7' class='form-control'></textarea>";
	       	listHtml+="<br/>";
	       	listHtml+="<span id='editBtn"+obj.idx+"'><button class='btn btn-primary btn-sm' onclick='editForm("+obj.idx+")'>수정</button></span>&nbsp;";
	       	listHtml+="<button class='btn btn-danger btn-sm' onclick='delBoard("+obj.idx+")'>삭제</button>";        	 
	       	listHtml+="</td>";
	       	listHtml+="</tr>";
   	 	});
	   	listHtml+="<tr>";
	   	listHtml+="<td colspan='5'>";
	   	listHtml+="<button class='btn btn-primary btn-sm' onclick='viewForm()'>글쓰기</button>";
	   	listHtml+="</td>";
	   	listHtml+="</tr>";
	   	listHtml+="</table>";
	   	$("#view").html(listHtml);
	   	$("#view").css("display","block");
     	$("#form").css("display","none"); 
  	}
  	function viewForm(){
  		$("#view").css("display","none");
  		$("#form").css("display", "block");
  	}
  	function backList(){
  		$("#view").css("display","block");
     	$("#form").css("display","none");
  	}
  	function submitForm(){
  		const formData = $("#form").serialize();
 
  		// 서버와 통신 : 게시판 리스트 가져오기
    	$.ajax({
    		url : "board/create",
    		type : "POST",
    		data : formData,
    		success : loadList,
    		error : function(e){ console.log(e);  }    		
    	});
  		// 폼 초기화 
  		$("#resetBtn").trigger("click");
  	}
  	function detailBoard(idx){
  		if($("#board"+idx).css("display") == "none"){
  			// 서버와 통신 : 상세보기 클릭시 게시판정보 가져오기
  	    	$.ajax({
  	    		url : "board/"+idx,
  	    		type : "GET",
  	    		dataType: "JSON",
  	    		success : function(board){
  	    			$("#cnt"+idx).val(board.count);
  	    			$("#content"+idx).val(board.content);
  	    			
  	    		},
  	    		error : function(e){ console.log(e);  }    		
  	    	});
  		
  			$("#board"+idx).css("display", "table-row");
  		}else{
  			$("#board"+idx).css("display", "none");
  		}
  	}
  	function delBoard(idx){
  		// 서버와 통신 : 삭제 성공시 게시판 리스트 가져오기
    	$.ajax({
    		url : "board/"+idx,
    		type : "DELETE",
    		success : loadList,
    		error : function(e){ console.log(e);  }    		
    	});
  	}
  	function editForm(idx){
  		$("#content"+idx).attr("readonly", false); // content 수정 가능 
  		
  		const titleVal = $("#title"+idx).text();
  		const newInput = "<input type='text' id='editTitle"+idx+"' class='form-control' value='"+titleVal+"'/>";
  		$("#title"+idx).html(newInput);
  		
  		const newEditBtn="<button class='btn btn-primary btn-sm' onclick='editBoard("+idx+")'>수정</button>";
  		$("#editBtn"+idx).html(newEditBtn);
  	}
  	function editBoard(idx){
		const title = $("#editTitle"+idx).val();
  		const content = $("#content"+idx).val();
  		const editData = {
  				idx,
  				title,
  				content,
  		};
  		// 서버와 통신 : 삭제 성공시 게시판 리스트 가져오기
  		$.ajax({
    		url : "board/edit",
    		type : "PUT",
    		contentType:'application/json;charset=utf-8',
    		data : JSON.stringify(editData),
    		success : loadList,
    		error : function(e){ console.log(e); }
    	});
  	}
  </script>
</head>
<body> 
 
<div class="container">
  <h2>MVC03</h2>
  <div class="panel panel-default">
    <div class="panel-heading">A Basic 1</div>
    <div id="view" class="panel-body"></div>
    <div  class="panel-body">
    <form id="form" action="board/create" method="post">
      <table class="table">
         <tr>
           <td>제목</td>
           <td><input type="text" id="title" name="title" class="form-control"/></td>
         </tr>
         <tr>
           <td>내용</td>
           <td><textarea rows="7" class="form-control" id="content" name="content"></textarea> </td>
         </tr>
         <tr>
           <td>작성자</td>
           <td><input type="text" name="writer" id="writer" class="form-control"/></td>
         </tr>
         <tr>
           
         <tr>
         <td colspan="2" align="left">
               <button type="button" class="btn btn-info btn-sm" onclick="backList()">뒤로가기</button>
           </td>
           <td colspan="2" align="right">
               <button type="button" class="btn btn-primary btn-sm" onClick="submitForm()">등록</button>
               <button type="reset" class="btn btn-warning btn-sm" id="resetBtn">취소</button>
           </td>
         </tr>
      </table>
     </form>
    </div>
    <div class="panel-footer">Ad Basic 3</div>
  </div>
</div>

</body>
</html>
