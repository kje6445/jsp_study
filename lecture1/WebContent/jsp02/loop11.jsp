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
<%for(int i=1; i<=10; ++i){%>
	<td><%=i %></td>
 <% } %>
</body>
</html>