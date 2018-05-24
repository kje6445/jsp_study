<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <table border=1><!-- 테이블이 없으면 큰 판에 카드가 생긴 모양 전부 없어지고 그냥 숫자만 있음 -->
<tr> <!--<tr>은 가로줄을 만드는 역할    -->
	<%
		for(int i=1; i <=10; ++i){
			out.print("   ");
			out.print("<td>"); /*<td>은 셀을 만드는 역할  */
			out.print(i);
			out.print("</td>"); 
		}
	%>
</tr> <!-- <tr>가 없어도 똑같이 나온다.// <td>와<tr>이 없으면 작은 카드 흔적만 생기고 <td>은 없애고<tr>를 없애면 큰 틀 흔적만 남는다. -->
</table> 
	<!-- 1 2 3 4 5 6 7 8 9 10 가 카드 모양으로 나온다. 큰 판에 카드가 있는 모양으로 생김 -->
</body>
</html>