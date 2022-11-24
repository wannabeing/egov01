<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>SIGNUP</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script type="text/javascript">
    /* ID 중복체크 함수  */
    function checkId(){
    	const userId = $("#userId");
    	const submitBtn = $("#submitBtn");
    	const pw1 = $("#pw1");
    	if(!userId.val()){
    		swal({
    			icon: "warning",
    			title: "제대로 입력해주세요.",
    		})
    	}
    	else {
    		$.ajax({
        		url: "${contextPath}/userCheck.do",
        		type: "GET",
        		data: {"userId": userId.val() },
        		success: function(result){
        			// true: 사용 가능   
        			if(result){
        				swal({
        					icon: "success",
        					title: "사용 가능한 아이디입니다!",
        				})
        				submitBtn.disabled = false;
        			}
        			// false: 존재하는 유저  
        			else{
        				swal({
        					icon: "error",
        					title: "중복된 아이디입니다!",
        				})
        				submitBtn.disabled = true;
        			}
        		},
        		error: function(e){ console.log(e); },
        	});
    	}
    	
    }
    // 비밀번호 확인 함수 
    function checkPw(){
    	const pw1 = $("#pw1").val();
    	const pw2 = $("#pw2").val();
    	if(pw1 !== pw2){
    		submitBtn.disabled = true;
    		$("#passMsg").html("비밀번호가 일치하지 않습니다.");
    	} else {
    		$("#passMsg").html("");
    		$("#pw").val(pw1);
    		submitBtn.disabled = false;
    	}
    }
    // 회원가입 정보 전송 
    function submitForm(){
    	const formData = $("#signupForm").serialize();
    	$.ajax({
    		url : "${contextPath}/userRegister.do",
    		type : "POST",
    		data : formData,
    		success : function(userId){
    			swal({
    				icon: "success",
    				title: "환영합니다. "+userId+"님 😎",
    			}).then(()=> {
    				window.location.replace("${contextPath}/");
    			})
    		},
    		error : function(e){ console.log(e); }    		
    	});
    }
    </script>
</head>
<body>
<jsp:include page="../common/header.jsp"/> 
<div class="container">
  <h2>Spring MVC03</h2>
  <div class="panel panel-default">
    <div class="panel-heading">회원가입</div>
    <div class="panel-body">
      <form id="signupForm" name="signupForm" action="${contextPath}/userRegister.do" method="POST">
         <input type="hidden" id="pw" name="pw" value=""/>
         <table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd;">
           <tr>
             <td style="width: 110px; vertical-align: middle;">아이디</td>
             <td><input id="userId" name="userId" class="form-control" type="text" maxlength="20" placeholder="아이디를 입력하세요." required=true/></td>
             <td style="width: 110px;"><button type="button" class="btn btn-primary btn-sm" onclick="checkId()">중복확인</button></td>
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">비밀번호</td>
             <td colspan="2"><input required=true id="pw1" onkeyup="checkPw()" class="form-control" type="password" maxlength="20" placeholder="비밀번호를 입력하세요."/></td>            
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">비밀번호확인</td>
             <td colspan="2"><input required=true id="pw2" onkeyup="checkPw()" class="form-control" type="password" maxlength="20" placeholder="비밀번호를 확인하세요."/></td>            
           </tr>
            <tr>
             <td style="width: 110px; vertical-align: middle;">사용자 이름</td>
             <td colspan="2"><input required=true id="name" name="name" class="form-control" type="text" maxlength="20" placeholder="이름을 입력하세요."/></td>            
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">나이</td>
             <td colspan="2"><input required=true id="age" name="age" class="form-control" type="number" maxlength="20" placeholder="나이를 입력하세요."/></td>            
           </tr>
           <tr>
             <td style="width: 110px; vertical-align: middle;">성별</td>
             <td colspan="2">
                <div class="form-group" style="text-align: left; margin: 0 auto;">
                    <div class="btn-group" data-toggle="buttons">
                       <label class="btn btn-primary active">
                         <input type="radio"  name="gender" autocomplete="off" value="m" checked/>남자
                       </label>
                        <label class="btn btn-primary">
                         <input type="radio"  name="gender" autocomplete="off" value="w"/>여자
                       </label>
                    </div>                    
                </div>
             </td>            
           </tr> 
           <tr>
             <td style="width: 110px; vertical-align: middle;">이메일</td>
             <td colspan="2"><input required=true id="email" name="email" class="form-control" type="text" maxlength="20" placeholder="이메일을 입력하세요."/></td>            
           </tr>
           <tr>
             <td colspan="3" style="text-align: center;">
                <span id="passMsg" style="color: red"></span>
                <input id="submitBtn" type="button" class="btn btn-primary btn-sm pull-right" disabled value="회원가입" onclick="submitForm()"/>
             </td>             
           </tr>
         </table>
      </form>    
    </div>
    <!--  다이얼로그창(모달) -->
    <!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog" >
	  <div class="modal-dialog">	
	    <!-- Modal content-->
	    <div id="checkType" class="modal-content panel-info">
	      <div class="modal-header panel-heading">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">메세지 확인</h4>
	      </div>
	      <div class="modal-body">
	        <p id="checkMessage"></p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>	
	  </div>
	</div> 
	<!-- 실패 메세지를 출력(modal) -->
	<div id="myMessage" class="modal fade" role="dialog" >
	  <div class="modal-dialog">	
	    <!-- Modal content-->
	    <div id="messageType" class="modal-content panel-info">
	      <div class="modal-header panel-heading">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">${msgType}</h4>
	      </div>
	      <div class="modal-body">
	        <p>${msg}</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>	
	  </div>
	</div>    
    <div class="panel-footer">FOOTER</div>
  </div>
</div>

</body>
</html>