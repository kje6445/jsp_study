<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Insert title here</title>
</head>
<body>
<%
	String s1 ="hello";
	String s2 = "world";
	
	out.println(s1);	/* hello */
	out.println(s2);	/* world */
	out.println(s1+s2);/* 	helloworld */
	out.println("s1");	/* s1 */
	out.println("s2");	/* s2 */
	out.println("s1"+"s2");	/* s1s2 */
	out.println("s1 + s2");/* 	s1 + s2 */
%>
<%=s1 %>	 <!-- hello -->
<%=s2 %>	<!-- world -->
<%= s1+s2 %>	<!-- helloworld -->
<%="s1" %>	<!-- s1 -->
<%="s2" %>	<!-- s2 -->
<%="s1"+"s2" %>	<!-- s1s2 -->
<%="s1 + s2" %>	<!-- s1 + s2 -->
</body>
</html>