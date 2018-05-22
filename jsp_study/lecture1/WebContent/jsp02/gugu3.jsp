<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	table{ border-collapse: collapse;}
 	td{padding: 5px; border: solid 1px gray;} 
</style> 
<title>Insert title here</title>
</head>
<body>
<table>
<%-- <%
	for(int i=1; i<=9;++i){
		out.print("	<tr>");
		for(int j=2; j<=9; ++j){
			out.print("	<td>");
 			out.println( j+" x "+i+"="+(i*j)); 
 			out.print("	</td>");
		}
		out.println("	</tr>");
		
	}
%> --%>

<%-- <%
	for(int i=2; i<=9;++i){
				out.print("	<td>");
		for(int j=1; j<=9; ++j){
 			out.println( i+ "x "+j+"="+(i*j)) ;
 			out.print("<br>");
	}out.print("	</td>");
	}
%> --%>

<%		out.print("	<tr>");
	for(int i=2; i<=5;++i){
				out.print("	<td>");
		for(int j=1; j<=9; ++j){
 			out.println( i+ "x "+j+"="+(i*j)) ;
 			out.print("<br>");
	}out.print("	</td>");
	}	out.println("	</tr>");
	
	out.print("	<tr>");
	for(int i=6; i<=9;++i){
				out.print("	<td>");
		for(int j=1; j<=9; ++j){
 			out.println( i+ "x "+j+"="+(i*j)) ;
 			out.print("<br>");
	}out.print("	</td>");
	}	out.println("	</tr>");
/* for(int i=6; i<=9;++i){
			out.print("	<td>");
	for(int j=1; j<=9; ++j){
			out.println( i+ "x "+j+"="+(i*j)) ;
			out.print("<br>");
}
}
out.print("	<tr>"); */ 
%>
</table>
</body>
</html>