<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, lecture1.jdbc4.*, lecture1.*" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%
int currentPage = 1;
int pageSize = 10;

String pg = request.getParameter("pg");
if (pg != null) currentPage = Integer.parseInt(pg);

List<User> list = UserDAO.findAll(currentPage, pageSize);
int recordCount = UserDAO.count();
%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
      body { font-family: 굴림체; }
      thead th { background-color: #eee; }
      table.table { width: 700px; }
      tr:hover td { background-color: #ffe; cursor: pointer; }
       #createButton { margin-left: 590px; margin-bottom: 4px; }
  </style>
</head>
<body>

<div class="container">
<h1>사용자 목록</h1>

<a id="createButton" class="btn btn-primary" href="userCreate1.jsp">
  <i class="glyphicon glyphicon-plus"></i> 사용자 등록
</a>

<table class="table table-bordered table-condensed">
    <thead>
        <tr>
            <th>아이디</th>
            <th>사용자ID</th>
            <th>이름</th>
            <th>이메일</th>
            <th>학과</th>
            <th>사용자유형</th>
        </tr>
    </thead>
    <tbody>
        <% for (User user : list) { %>
            <tr data-url="userEdit1.jsp?id=<%= user.getId() %>&pg=<%= currentPage %>">
                <td><%= user.getId() %></td>
                <td><%= user.getUserId() %></td>
                <td><%= user.getName() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getDepartmentName() %></td>
                <td><%= user.getUserType() %></td>
            </tr>
        <% } %>
    </tbody>
</table>

<my:pagination pageSize="<%= pageSize %>" recordCount="<%= recordCount %>" queryStringName="pg" />

</div>
<script>
$("[data-url]").click(function() {
	var url = $(this).attr("data-url");
	location.href = url;
})
</script>
</body>
</html>
