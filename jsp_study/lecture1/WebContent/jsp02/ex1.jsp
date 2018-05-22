<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% for(int i=1; i<=10; ++i){ %>
	4*i=4*i
<%} %> <!-- 4*i=4*i 4*i=4*i 4*i=4*i 4*i=4*i 4*i=4*i 4*i=4*i 4*i=4*i 4*i=4*i 4*i=4*i 4*i=4*i  -->

<%for(int i=1; i<=10; ++i) {%>
	<%= 4*i %> = <%=4*i %>
<%} %> <!--4 = 4 8 = 8 12 = 12 16 = 16 20 = 20 24 = 24 28 = 28 32 = 32 36 = 36 40 = 40   -->

<% for(int i=1; i <=10; ++i) {%>
	<%=4 %> * <%=i %> =<%=4*i %>
<%} %> <!--4 * 1 =4 4 * 2 =8 4 * 3 =12 4 * 4 =16 4 * 5 =20 4 * 6 =24 4 * 7 =28 4 * 8 =32 4 * 9 =36 4 * 10 =40   -->

<% for(int i=1; i <=10; ++i) {%>
	4*<%= i %> =<%= 4*i %>
<%} %> <!-- 4*1 =4 4*2 =8 4*3 =12 4*4 =16 4*5 =20 4*6 =24 4*7 =28 4*8 =32 4*9 =36 4*10 =40  -->

<tr> 

<%  for (int i=1; i <= 10; ++i) { %> 
     <td>4 * <%= i %> = <%= 4 * i %></td> 
<%  } %> 
</tr> <!--   4 * 1 = 4 4 * 2 = 8 4 * 3 = 12 4 * 4 = 16 4 * 5 = 20 4 * 6 = 24 4 * 7 = 28 4 * 8 = 32 4 * 9 = 36 4 * 10 = 40  -->

<td> 

<%  for (int i=1; i <= 10; ++i) { %> 
     4 * <%= i %> = <%= 4 * i %><br /> 
<%  } %> 
</td> <!-- 
4 * 1 = 4
 4 * 2 = 8
 4 * 3 = 12
 4 * 4 = 16
 4 * 5 = 20
 4 * 6 = 24
 4 * 7 = 28
 4 * 8 = 32
 4 * 9 = 36
 4 * 10 = 40 -->

</body>
</html>