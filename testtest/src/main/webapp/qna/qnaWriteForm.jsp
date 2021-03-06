<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	margin: auto;
	padding: 0;
}
.qnaWrite{
	width: 1200px;
	height: 1250px;
	margin: auto;
}
.qnaWrite #qnaWriteNavi{
	font-weight: normal;
	color: #353535;
}
.qnaWrite h1{
	color: #4B1152;
	border-bottom: 2px solid #4B1152;
}
#qnaTab{
	margin-left: 140px;
	width: 1000px;
}
#qnaTab td{
	width: 1000px;
	height: 70px;
	border-bottom: 1px solid #ccc;
}
#qnaTab label{
	font-size: 20px;
	margin-right: 20px;
	vertical-align: middle;
}
#qnaTab select{
	width: 200px;
	height: 30px;
}
#qnaTab input{
	width: 200px;
	height: 30px;
}
#qnaTab textarea{
	margin-left: 120px;
}
.mybutton{
	background-color: #4B1152;
	border: 1px solid #124d77;
	display: inline-block;
	color: white;
	font-family: arial;
	font-size: 15px;
	font-weight: nomal;
	padding: 6px 24px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #154682;
}

.mybutton:hover {
	background-color: #4A0BA3;
}

.mybutton:active {
	position: relative;
	top: 1px;
}
</style>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function () {
  $('.code1').show();
  $('.content-panel').hide();
  $('.d1').show();

  $('#code1').on("change",function () {
    $('.content-panel').hide();
    $('.d'+$(this).val()).show();
  });
});
$(function() {
	$("form[name='qnaWriteForm']").submit(function() {
		if(!confirm("정말 저장하시겠습니까?")) {
			return false;
		}
	});
	
	$("input[type='reset']").click(function() {
		if(!confirm("정말 입력을 취소하시겠습니까?")) {
			return false;
		}
	});
});
</script>
</head>
<body>
<form action="../qna/qnaWrite.do" name="qnaWriteForm" method="get">
<div class="qnaWrite">
	<h3 id="qnaWriteNavi">JAJUAIR &gt; 고객센터<img alt="" src="../img/navimg.png"></h3><br>
	<h1>고객센터</h1>
	<p>${sessionScope.memName }님의 문의사항을 남겨주세요.</p>
	<table id="qnaTab">
		<tr>
			<td>
				<h2>고객정보</h2>	
			</td>
		</tr>
		<tr>
			<td>
				<label>이름 *</label>
				<input type="text" name="koreanName" value="${sessionScope.memName }">
			</td>
		</tr>
		<tr>
			<td>
				<label>전화번호 *</label>
				<select name="tel1">
					<option value="010">010</option>
					<option value="010">011</option>
					<option value="010">019</option>
				</select>
				<input type="text" name="tel2">-<input type="text" name="tel3">
			</td>
		</tr>
		<tr>
			<td>
				<label>이메일 *</label>
				<input type="text" name="email1">@
				<select name="email2">
					<option value="naver.com">naver.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="gmail.com">gmail.com</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<h2>문의정보</h2>	
			</td>
		</tr>
		<tr>
			<td>
				<label>문의유형 *</label>			
				<select id="code1" name="code1" class="code1">
				  <option value="1">QnA</option>
				  <option value="2">항공권영문 정정</option>
				  <option value="3">수하물파손</option>
				  <option value="4">유실물</option>
				</select>
				<label class="content-panel d1">분류 *</label>
				<select name="code2" class="content-panel d1">
					<option value="항공권예약발권&#47;변경&#47;취소">항공권예약발권/변경/취소</option>
					<option value="포인트">포인트</option>
					<option value="홈페이지&#38;모바일 이용">홈페이지&모바일 이용</option>
					<option value="공항서비스">공항서비스</option>
					<option value="이벤트">이벤트</option>
					<option value="기타">기타</option>
				</select>
			</td>
		</tr>
		<tr class="content-panel d2">
			<td>
				<label>예약번호 *</label>
				<input type="text" name="reservNum">
				<label>탑승자명 *</label>
				<input type="text" name="boardName">
			</td>
		</tr>
		<tr class="content-panel d2">
			<td>
				<label>변경할 영문 이름 *</label>
				<input type="text" name="englishName">
			</td>
		</tr>
		<tr class="content-panel d3">
			<td>
		  		<label>탑승일 *</label>
				<input type="text" name="boardDate">
			</td>
		</tr>
		<tr class="content-panel d3">
		  <td>
		  <label>출발지 *</label>
		  	<select name="airportName1">
		  		<option value="인천(icn)1">인천(icn)</option>
		  		<option value="김포(gmp)1">김포(gmp)</option>
		  		<option value="부산(pus)1">부산(pus)</option>
		  		<option value="제주(cju)1">제주(cju)</option>
		  		<option value="광주(kwj)1">광주(kwj)</option>
		  		<option value="대구(tae)1">대구(tae)</option>
		  		<option value="청주(cjj)1">청주(cjj)</option>
		  		<option value="나고야(ng0)1">나고야(ng0)</option>
		  		<option value="도쿄(나리타)(nrt)1">도쿄(나리타)(nrt)</option>
		  		<option value="도쿄(하네다)(hnd)1">도쿄(하네다)(hnd)</option>
		  		<option value="삿포로(cts)1">삿포로(cts)</option>
		  		<option value="오사카(kix)1">오사카(kix)</option>
		  		<option value="후쿠오카(fuk)1">후쿠오카(fuk)</option>
		  		<option value="오키나와(oka)1">오키나와(oka)</option>
		  		<option value="마카오(mfm)1">마카오(mfm)</option>
		  		<option value="베이징(pek)1">베이징(pek)</option>
		  		<option value="홍콩(hkg)1">홍콩(hkg)</option>
		  		<option value="타이베이(tpe)1">타이베이(tpe)</option>
		  		<option value="다낭(dad)1">다낭(dad)</option>
		  		<option value="마닐라(mnl)1">마닐라(mnl)</option>
		  		<option value="방콕(bkk)1">방콕(bkk)</option>
		  		<option value="세부(ceb)1">세부(ceb)</option>
		  		<option value="하노이(han)1">하노이(han)</option>
		  		<option value="호치민(sgn)1">호치민(sgn)</option>
		  	</select>
		  	<label>도착지 *</label>
		  	<select name="airportName2">
		  		<option value="인천(icn)2">인천(icn)</option>
		  		<option value="김포(gmp)2">김포(gmp)</option>
		  		<option value="부산(pus)2">부산(pus)</option>
		  		<option value="제주(cju)2">제주(cju)</option>
		  		<option value="광주(kwj)2">광주(kwj)</option>
		  		<option value="대구(tae)2">대구(tae)</option>
		  		<option value="청주(cjj)2">청주(cjj)</option>
		  		<option value="나고야(ng0)2">나고야(ng0)</option>
		  		<option value="도쿄(나리타)(nrt)2">도쿄(나리타)(nrt)</option>
		  		<option value="도쿄(하네다)(hnd)2">도쿄(하네다)(hnd)</option>
		  		<option value="삿포로(cts)2">삿포로(cts)</option>
		  		<option value="오사카(kix)2">오사카(kix)</option>
		  		<option value="후쿠오카(fuk)2">후쿠오카(fuk)</option>
		  		<option value="오키나와(oka)2">오키나와(oka)</option>
		  		<option value="마카오(mfm)2">마카오(mfm)</option>
		  		<option value="베이징(pek)2">베이징(pek)</option>
		  		<option value="홍콩(hkg)2">홍콩(hkg)</option>
		  		<option value="타이베이(tpe)2">타이베이(tpe)</option>
		  		<option value="다낭(dad)2">다낭(dad)</option>
		  		<option value="마닐라(mnl)2">마닐라(mnl)</option>
		  		<option value="방콕(bkk)2">방콕(bkk)</option>
		  		<option value="세부(ceb)2">세부(ceb)</option>
		  		<option value="하노이(han)2">하노이(han)</option>
		  		<option value="호치민(sgn)2">호치민(sgn)</option>
		  	</select>
		  </td>
		</tr>
		<tr class="content-panel d4">
		  <td>
		   <label>물품명 *</label>
		  	<input type="text" name="goodsName">
		  	<label>색상 *</label>
		  	<input type="text" name="goodsColor">
		  </td>
		</tr>
		<tr class="content-panel d4">
		  <td>
		  	<label>탑승일 *</label>
		  	<input type="text" name="boardDate">
		  </td>
		</tr>
		<tr class="content-panel d4">
		  <td>
		  <label>출발지 *</label>
		  	<select name="airportName1">
		  		<option value="인천(icn)">인천(icn)</option>
		  		<option value="김포(gmp)">김포(gmp)</option>
		  		<option value="부산(pus)">부산(pus)</option>
		  		<option value="제주(cju)">제주(cju)</option>
		  		<option value="광주(kwj)">광주(kwj)</option>
		  		<option value="대구(tae)">대구(tae)</option>
		  		<option value="청주(cjj)">청주(cjj)</option>
		  		<option value="나고야(ng0)">나고야(ng0)</option>
		  		<option value="도쿄(나리타)(nrt)">도쿄(나리타)(nrt)</option>
		  		<option value="도쿄(하네다)(hnd)">도쿄(하네다)(hnd)</option>
		  		<option value="삿포로(cts)">삿포로(cts)</option>
		  		<option value="오사카(kix)">오사카(kix)</option>
		  		<option value="후쿠오카(fuk)">후쿠오카(fuk)</option>
		  		<option value="오키나와(oka)">오키나와(oka)</option>
		  		<option value="마카오(mfm)">마카오(mfm)</option>
		  		<option value="베이징(pek)">베이징(pek)</option>
		  		<option value="홍콩(hkg)">홍콩(hkg)</option>
		  		<option value="타이베이(tpe)">타이베이(tpe)</option>
		  		<option value="다낭(dad)">다낭(dad)</option>
		  		<option value="마닐라(mnl)">마닐라(mnl)</option>
		  		<option value="방콕(bkk)">방콕(bkk)</option>
		  		<option value="세부(ceb)">세부(ceb)</option>
		  		<option value="하노이(han)">하노이(han)</option>
		  		<option value="호치민(sgn)">호치민(sgn)</option>
		  	</select>
		  	<label>도착지 *</label>
		  	<select name="airportName2">
		  		<option value="인천(icn)">인천(icn)</option>
		  		<option value="김포(gmp)">김포(gmp)</option>
		  		<option value="부산(pus)">부산(pus)</option>
		  		<option value="제주(cju)">제주(cju)</option>
		  		<option value="광주(kwj)">광주(kwj)</option>
		  		<option value="대구(tae)">대구(tae)</option>
		  		<option value="청주(cjj)">청주(cjj)</option>
		  		<option value="나고야(ng0)">나고야(ng0)</option>
		  		<option value="도쿄(나리타)(nrt)">도쿄(나리타)(nrt)</option>
		  		<option value="도쿄(하네다)(hnd)">도쿄(하네다)(hnd)</option>
		  		<option value="삿포로(cts)">삿포로(cts)</option>
		  		<option value="오사카(kix)">오사카(kix)</option>
		  		<option value="후쿠오카(fuk)">후쿠오카(fuk)</option>
		  		<option value="오키나와(oka)">오키나와(oka)</option>
		  		<option value="마카오(mfm)">마카오(mfm)</option>
		  		<option value="베이징(pek)">베이징(pek)</option>
		  		<option value="홍콩(hkg)">홍콩(hkg)</option>
		  		<option value="타이베이(tpe)">타이베이(tpe)</option>
		  		<option value="다낭(dad)">다낭(dad)</option>
		  		<option value="마닐라(mnl)">마닐라(mnl)</option>
		  		<option value="방콕(bkk)">방콕(bkk)</option>
		  		<option value="세부(ceb)">세부(ceb)</option>
		  		<option value="하노이(han)">하노이(han)</option>
		  		<option value="호치민(sgn)">호치민(sgn)</option>
		  	</select>
		  </td>
		</tr>
		<tr>
			<td colspan="2">
				<label>문의제목 *</label>
				<input type="text" name="subject">
			</td>
		</tr>
		<tr class="qnaContent">
			<td>
				<label><p>문의내용 *</p></label>
				<textarea rows="15" cols="130" name="content" style="resize: none;"></textarea>
				<input type="hidden" name="answer">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="문의 작성" class="mybutton">
				<input type="reset" value="다시작성" class="mybutton">
			</td>
		</tr>
	</table>
	</div>
</form>
</body>
</html>