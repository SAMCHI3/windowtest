
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<link href="/resources/css/buysinsert.css" rel="stylesheet" >
<head>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<div id="page">
<div class="background">
<h1>판매등록</h1>
<div class="container">
	<div class="buy">
		<div id="trade">
			<div class="trade1">
				<div class="trade2">
					<image src="/display?fileName=${vo.pimage}" width=100 height=100>
				</div>
				<div id="tr">
					<div class="trl" id="sid" style="display: none;">${uid}</div>
					<div class="tr1" id="smodel">${vo.pmodel}</div>
					<div class="tr1">${vo.pename}</div>
					<div class="tr1">${vo.pkname}</div>
					<div class="tr1" id="plprice">즉시판매가격: ${vo.plprice}</div>
					<div class="tr1" id="ssize">판매 사이즈: ${param.ssize}</div>
				</div>
			</div>
		</div>
		<form name="frm" method="post" action="sinsert" enctype="multipart/form-data">
		<div id="buy1">
			<table>
				<tr class="price">
					<td><input type="text" id="ssell1">원</td>
				</tr>
				<tr class="gender">
					<td>
						<span><input type="radio" name="sgender" value="1">남자</span>
						<span><input type="radio" name="sgender" value="2">여자</span>
						<span><input type="radio" name="sgender" value="3">키즈</span>
					</td>
				</tr>
				<tr class="color">
					<td>
						<select name="scolor">
							<option value="" selected>색상선택</option> 
							<option value="white">white</option>
							<option value="black">black</option>
							<option value="red">red</option>
							<option value="sky">sky</option>
							<option value="blue">blue</option>
							<option value="brown">brown</option>
							<option value="gray">gray</option>
						</select>
					</td>
				</tr>
				<tr style="display:none;">
					<td><input type="text" name="sid" value="${uid}"></td>
					<td><input type="text" name="ssize" value="${param.ssize}"></td>
					<td><input type="text" name="smodel" value="${vo.pmodel}"></td>
					<td><input type="text" id="ssell" value="${vo.plprice}"></td>
					<td><input type="text" name="ssell"></td>
				</tr>
			</table>
			<div class="button">
			<button type="submit" class="sell1">즉시판매</button>
			<button type="submit" class="sell" >입찰판매</button>
			</div>
			</div>
		</div>
	</form>
		</div>
	</div>
</div>
<script>
	
	$(frm).on("submit", function(e) {
		e.preventDefault();
	});
	
	$(".sell1").on("click", function() {
		
		var ssell = $("#ssell").val();
		var sid = $(frm.sid).val();
		var ssize = $(frm.ssize).val();
		var smodel = $(frm.smodel).val();
		var sgender = $('input[name="sgender"]:checked').val();
		var scolor = $(frm.scolor).val();
		$(frm.ssell).val(ssell);
		
		
		if ($('input[name="sgender"]:checked').length<1) {
			alert("성별을 선택해 주세요!");
			return;
		} else if (scolor == "") {
			alert("색깔을 입력해주세요!");
			return;
		}else{
			if (!confirm("상품을 입찰판매하실래요?")) return;
			frm.submit();
		} 
		
	});
	
	$(".sell").on("click", function() {
		
		var ssell = $("#ssell1").val();
		var sid = $(frm.sid).val();
		var ssize = $(frm.ssize).val();
		var smodel = $(frm.smodel).val();
		sgender = $('input[name="sgender"]:checked').val();
		scolor = $(frm.scolor).val();
		ssell = $(frm.ssell).val(ssell);
		
		if(ssell==""){
			alert("입찰금액을 입력해 주세요!");
			return;
		}else if ($('input[name="sgender"]:checked').length<1) {
			alert("성별을 선택해 주세요!");
			return;
		} else if (scolor == "") {
			alert("색깔을 입력해주세요!");
			return;
		}else {
			if (!confirm("상품을 입찰판매하실래요?")) return;
			frm.submit();
		}
	});

</script>
