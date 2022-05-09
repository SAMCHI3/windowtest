<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div id="page">
	<h1>비밀번호재발급</h1>
	<form name="frm"  enctype="multipart/form-data">
		<table>
			<tr>
				<td class="title" width=100>아이디</td>
				<td width=500>
					<input type="text" name="uid">
					<button type="button" id="check1">아이디체크</button>
				</td>
			</tr>
			<tr>
				<td class="title" width=100>유저이메일</td>
				<td width=500>
					<input type="text" name="uemail">
					<button type="button" id="check2">이메일체크</button>
				</td>
			</tr>
		
		</table>
		<div style="text-align:center;margin-top:10px;">
			<button type="submit">비밀번호재발급</button>
			<button type="reset">입력정보리셋</button>
		</div>
	</form>
</div>

<script>
	var check=false;
	$("#check1").on("click", function(){
		var uid=$(frm.uid).val();
		if(uid==""){
			alert("아이디를 입력하세요!");
			$(frm.uid).focus();
			return;
		}
		
		$.ajax({
			type: "post",
			url: "/user/inserttest",
			data: {uid:uid},
			success: function(data){
				if(data==0){
					alert("존재하지않는아이디입니다!");
					check=true;
				}else if(data==1){
					alert("존재하는아이디입니다!");
				}else if(data==2){
					alert("존재하는아이디입니다!");
				}else{
					alert("존재하는아이디입니다!");
				}
			}
		});
	});
	$("#check2").on("click", function(){
		var uemail=$(frm.uemail).val();
		if(uemail==""){
			alert("이메일을 입력하세요!");
			$(frm.uemail).focus();
			return;
		}
		
		$.ajax({
			type: "post",
			url: "/user/inserttest2",
			data: {uemail:uemail},
			success: function(data){
				if(data==0){
					alert("존재하지않는이메일입니다!");
					check=true;
				}else if(data==1){
					alert("존재하는 이메일입니다!");
				}else if(data==2){
					alert("존재하는 이메일입니다!");
				}
			}
		});
	});
	
	$(frm).on("submit",function(e){
		e.preventDefault();
		var uemail=$(frm.uemail).val();
		var uid=$(frm.uid).val();
		var upass="pass";
		
		alert(uemail+"\n"+uid+"\n"+upass);
		
		if(uid==""){
	         alert("아이디를 입력하세요");
	         $(frm.uid).focus();
	         return;
	      }else if(uemail==""){
	         alert("이메일을 입력하세요");
	         $(frm.uemail).focus();
	         return;
			}
	      if(!confirm("비밀번호를 재발급받으시겟습니까?")) return;
		  	frm.method="post";
			frm.action="updatereset";
	     	frm.submit();		
		});
</script>