<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    #tbl{overflow:hidden; width:900px; margin:0px auto;}
    .box {float:left; width:250px; height:300px; margin-left:10px; padding:5px;
		border:1px solid gray;}
	.box img { width:150px; height:200; position: relative; left: 40px;}
    </style>
<div id="page">

	<h1 >게시판</h1>
	<table id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
		<div style="text-align: center; padding: 20px;">
			<button type="button"><a href="/board/top">인기</a></button>
			<button type="button"><a href="/board/list">최신</a></button>
		</div>
		<div style="text-align: right;">
			<button><a href="/board/insert">글쓰기</a><button>
		</div>
		<div>
		{{#each top}}
				<div class="box">
				<div class="bno" style="display: none;">{{bno}}</div>
				<div class="img"><img src="/display?fileName={{bimage}}"></div>
				<div class="bid">{{bid}}</div>
				<div>{{bcontent}}</div>
				<div><button>관심</button>{{bcount}}</div>
				</div>
		{{/each}}
	</script>
<div class="pagination"></div>
</div>

<script>
 	var page=1;
 	
 		getTop();
 		function getTop(){
 		$.ajax({
			type:"get",
			url:"/board/top.json",
			data:{page:page},
			dataType:"json",
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
				$(".pagination").html(getPagination(data));
				}
			})
 		}
	$(".pagination").on("click","a",function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getTop();
		})
 	
 	
 	$("#tbl").on("click",".img",function(){
 		var bno=$(this).parent().find(".bno").html();
 		var bid=$(this).parent().find(".bid").html();
 		alert(bno+bid);
 		location.href="/board/read?bno=" + bno+"&bid="+bid;
 	})
	
	
	
</script>