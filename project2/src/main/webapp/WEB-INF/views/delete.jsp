<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	input[type=text]{margin-bottom:10px;}
</style>    
<div id="page">
	<h1></h1>
	<form name="frm"   enctype="multipart/form-data">
		<table style="display: none;">
			<tr>
				<td class="title" width=100>아이디</td>
				<td width=500>
					<input type="text" name="uid" value="${vo.uid}" readonly>
				</td>
			</tr>
			<tr>
				<td class="title" width=100>비밀번호</td>
				<td width=500><input type="password" name="upass" ></td>
			</tr>
			<tr>
				<td class="title" width=100>이름</td>
				<td width=500><input type="text" name="uname" value="${vo.uname}"></td>
			</tr>
			<tr>
				<td class="title" width=100>전화번호</td>
				<td width=500><input type="text" name="utel" value="${vo.utel}"></td>
			</tr>
			<tr>
				<td class="title" width=100>이메일</td>
				<td width=500><input type="text" name="uemail" value="${vo.uemail}"></td>
			</tr>
			<tr>
				<td class="title" width=100>유저코드</td>
				<td width=500><input type="text" name="ucode" value="3"></td>
			</tr>
			<tr>
				<td class="title" width=100>결제방법</td>
				<td width=500><input type="text" name="upay" value="${vo.upay}"></td>
			</tr>
			<tr>
				<td class="title" width=100>주소</td>
				<td width=500>
					<input type="text" name="uaddress" size=30 value="${vo.uaddress}">
					<button type="button" id="search">주소검색</button><br>
				</td>
			</tr>
		
		</table>
		<div style="text-align:center;margin-top:10px;">
			<button type="submit" class="update">유저탈퇴</button>
			<button><a href="/user/update?uid=${uid}">뒤로</a></button>
		</div>
	</form>
</div>

<script>

	$(frm).on("submit", function(e){
		e.preventDefault();
		
		var ucode=$(frm.ucode).val();
		
		{
			if(!confirm("정말 탈퇴하시겟어요?")) return;
			frm.method="post";
			frm.action="update";
			frm.submit();
		}
	});
	

</script>





