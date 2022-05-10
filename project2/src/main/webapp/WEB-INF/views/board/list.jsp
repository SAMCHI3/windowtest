<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/resources/css/boardlist.css">

<div id="page">
	<div class="container">
	<h1 >나만의 STYLE</h1>
	<table id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
		<div class="board-button2">
			<button><a href="/board/insert">글쓰기</a></button>
		</div>
		<div class="board-button">
			<button class="famous" type="button"><a href="/board/top">인기</a></button>
			<button class="new" type="button"><a href="/board/list">최신</a></button>
		</div>
		
		<div>
		{{#each list}}
				<div class="box">
				<div class="bno" style="display: none;">{{bno}}</div>
				<div class="img"><img src="/display?fileName={{bimage}}"></div>
				<div class="bid">{{bid}}</div>
				<div class="bcon">{{bcontent}}</div>
				<div class="imote"><button>❤️</button>{{bcount}}</div>
				</div>
		{{/each}}
	</script>
<div class="pagination"></div>
</div>
</div>
<script>
 	var page=1;
 	var keyword="";
 	
 	
 	$("#tbl").on("click",".img",function(){
 		var bno=$(this).parent().find(".bno").html();
 		var bid=$(this).parent().find(".bid").html();
 		alert(bno+bid);
 		location.href="/board/read?bno=" + bno+"&bid="+bid;
 	})
 	//검색어 엔터
	$("#keyword").on("keypress",function(e){
		if(e.keyCode==13) $("#search").click()
	});
	
	//검색클릭
	$("#search").on("click",function(){
		keyword=$("#keyword").val();
		page=1;
		getList();
	});
 	
	getList();
	function getList(){
		$.ajax({
			type:"get",
			url:"/board/list.json",
			data:{page:page,keyword:keyword},
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
		getList();
	})
	
	$(".new").on("click", function(){
		$(".new").css("background", "black");
		$(".new").css("color", "white");
	});
</script>