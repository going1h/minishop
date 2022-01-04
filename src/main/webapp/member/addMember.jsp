<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<!-- <script type="text/javascript">
	function checkForm() {
		
		var checkId = /^[a-z0-9]{6,20}$/;
		var checkPw = /^(?=.*[a-zA-Z])(?=.*[!@#$%&^*=*+=-])(?=.*[0-9]).{6,20}$/;
		var checkNum = /^01(?:0|1|[6-9])[.-]?(\\d{3}|\\d{4})[.-]?(\\d{4})$/;
		 var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		 
		 
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}

	}
</script> -->

<script type="text/javascript">
   function checkForm() {
      //아이디 적합한지 검사할 정규식 
      var checkId = /^[a-z0-9]{6,20}$/;
      //패스워드가 적합한지 검사할 정규식
      var checkPw = /^(?=.*[a-zA-Z])(?=.*[!@#$%&^*=*+=-])(?=.*[0-9]).{6,20}$/;
      //숫자만 입력하는 정규식
       var checkNum = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
       //이메일이 적합한지 검사할 정규식x
       var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
      
       
       
      if (!document.newMember.id.value) {
         alert("아이디를 입력하세요.");
         newMember.id.focus();
         return false;
      }
      
      if (!check(checkId,newMember.id,"아이디는 6~20자의 영문 대소문자와 숫자로만 입력")) {
         return false;
      }

      if (!document.newMember.password.value) {
         alert("비밀번호를 입력하세요.");
         newMember.password.focus();
         return false;
      }

      if (document.newMember.password.value != document.newMember.password_confirm.value) {
         alert("비밀번호를 동일하게 입력하세요.");
         newMember.password_confirm.focus();
         return false;
      }
      
      if (!check(checkPw,newMember.password,"패스워드는 6~20자의 영문 대소문자와 숫자로만 입력")) {
         return false;
      }
      
      if(!document.newMember.name.value){
    	  alert("이름을 입력해주세요.");
    	  newMember.name.focus();
    	  return false;
      }
      
      if(!document.newMember.mail1.value){
    	  alert("이메일을 입력해주세요.");
    	  newMember.mail1.focus();
    	  return false;
    	  
      }
      
      if (!check(checkNum,newMember.phone,"숫자만 입력해 주세요")) {
         return false;
      }
      
      if (!document.newMember.address.value) {
         alert("주소를 입력하세요");
         newMember.address.focus();
         return false;
      }
   }
   
   function check(check, what, message) {
       if(check.test(what.value)) {
          return true;
       }
       alert(message);
       what.value="";
       what.focus();
       //return false;
    } 
</script>



<title>회원 가입</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 가입</h1>
		</div>
	</div>

	<div class="container">
		<form name="newMember" class="form-horizontal"  action="processAddMember.jsp" method="post" onsubmit="return checkForm()">
			<div class="form-group  row">
				<label class="col-sm-2 ">아이디</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" placeholder="id" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input name="password" type="text" class="form-control" placeholder="password" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호확인</label>
				<div class="col-sm-3">
					<input name="password_confirm" type="text" class="form-control" placeholder="password confirm" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" placeholder="name" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-10">
					<input name="gender" type="radio" value="남" /> 남 
					<input name="gender" type="radio" value="여" /> 여
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">생일</label>
				<div class="col-sm-4  ">
					<input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6"> 
					<select name="birthmm">
						<option value="">월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select> <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4">
				</div>
			</div>
			<div class="form-group  row ">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-10">
					<input type="text" name="mail1" maxlength="50">@ 
					<select name="mail2">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
					</select>
				</div>				
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input name="phone" type="text" class="form-control" placeholder="phone" >

				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2 ">주소</label>
				<div class="col-sm-5">
					<input name="address" type="text" class="form-control" placeholder="address">

				</div>
			</div>
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary " value="등록 " > 
					<input type="reset" class="btn btn-primary " value="취소 " onclick="reset()" >
				</div>
			</div>
		</form>
	</div>
</body>
</html>