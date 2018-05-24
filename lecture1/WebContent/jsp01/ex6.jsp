<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border =1>
<%
	for(int i=0; i<=3;++i){
		out.println("	<tr>");/*<tr>은 열이다.  */
		for(int j=1; j<=4; ++j){
			out.println("	<td>"+ (i*4+j)+"</td>");/*<td>는 행이다.  */
		}
		out.println("	</tr>");
	}
%><!-- 4X4 배열로 나타나져있다.  -->
</table>
</body>
</html>