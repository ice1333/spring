<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	function formCheck(){
		if ($("#id").val() == '') {
			alert('아이디를 입력하세요');
			$("#id").focus();
			return false;
		}
		//아이디 중복체크 
		var con = true; //returnfalse 를 하기위해
		$.ajax({
		url:"idcheck.do",
		data:{ 
		id:$("#id").val()
		},
		async:false, //얘가 false면 순서를 기다렸따가 실행
		method:"get",
		success:function(r){ //함수이기떄문에
				if (r.trim()=='1'){
					alert('아이디가 중복되었습니다. 다른아이디를 입력해주세요.');
					$("#id").val('');
					$("#id").focus();
					//return false; //요함수 안에서만 중지됨
					con = false;
				}
			}
		//val(안에 매개변수가있으면 넣어줌)
		});
		if(con == false)
			return false;
		
		if($("#pwd").val() == '') { 
			alert('비밀번호를 입력하세요');
			$("#pwd").focus();
			return false;
		}
		if ($("#pwd").val() != $("#pwd2").val()){
			alert('비밀번호 값을 확인하세요.');
			$("#pwd2").focus();
			return false;
		}
		if($("#name").val() == '') {
			alert('이름을 입력하세요');
			$("#name").focus();
			return false;
		}
		//학교정보 체크
		$("input[name='school']").each(function(idx){ // input태그의 name속성의 값이 school 선택자의 객체를 반복
			//console.log($("input[name='school']").eq(idx).val());//이름이 스쿨인 인덱스에 값을 가져옴
			if($("input[name='school']").eq(idx).val() == ''){
				alert(idx+1 +'번째 학교명을 입력해 주세요');
				$("input[name='school']").eq(idx).focus();
				con = false;
				return false;
			}
			if($("input[name='year']").eq(idx).val() == ''){
				alert(idx+1 +'번째 졸업년도를 입력해 주세요');
				$("input[name='year']").eq(idx).focus();
				con = false;
				return false;
			}
		});
		if (con == false)
			return false;
		return true;
	
	}
	function idcheck(){
		if($("#id").val() ==''){
			alert('아이디를 입력하세요');
		} else {
		$.ajax({
			url:"idcheck.do",
			data:{ 
			//id:$("#id").val() //아이디인 밸류값
			},
			async:false,
			method:"get",
			success:function(r){
					if (r.trim()=='1'){
						alert('아이디가 중복되었습니다. 다른아이디를 입력해주세요.');
						$("#id").val('');
						$("#id").focus();
					} else {
						alert('사용가능한 아이디 입니다.');
					}
				},
				error:function(res){
					console.log(res);
				}
		});
	}
	}
	$(function(){
		$("#id").keyup(function(){
			$.ajax({
				url:"idcheck.do",
				data:{ 
				id:$("#id").val()
				},
				async:false,
				method:"get",
				success:function(r){
						if (r.trim()=='1'){
							$("#duplicateMsg").html("사용불가");
						} else {
							$("#duplicateMsg").html("사용가능");
						}
					}
			});
		})
	});
</script>
</head>
<body>
<h2>회원 가입</h2>
<form action="regist.do" method="post" onsubmit="return formCheck();">

<table border="1">
	<tr>
		<td>아이디</td>
		<td>
			<input type="text" name="id" id="id">
			<input type="button" value="중복체크" onclick="idcheck();"><br>
			<span id="duplicateMsg"></span>
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="pwd" id="pwd"></td>
	</tr>
	<tr>
		<td>비밀번호 확인</td>  <!-- 안에서 처리함 -->
		<td><input type="password" name="pwd2" id="pwd2"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" id="name"></td>
	</tr>
	<tr>
		<td>학교</td>
		<td>
			<table>
				<tr>
					<td>학교명</td>
					<td>졸업년도</td>
				</tr>
				<tr>
					<td><input type="text" name="school"></td>
					<td><input type="text" name="year"></td>
					
				</tr>
				<tr>
					<td><input type="text" name="school"></td>
					<td><input type="text" name="year"></td>
				</tr>
				<tr>
					<td><input type="text" name="school"></td>
					<td><input type="text" name="year"></td> 
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="가입" ></td>
	</tr>
		

</table>
</form>
</body>
</html>