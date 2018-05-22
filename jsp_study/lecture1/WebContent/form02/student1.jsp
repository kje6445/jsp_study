<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%
SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
String 현재시각 = format.format(new Date());
String id = "";
String studentNumber = "";
String name = "";
int departmentId;
String year = "";
String 에러메시지 = null;
request.setCharacterEncoding("UTF-8");
if (request.getMethod().equals("POST")) {
    id =  request.getParameter("id");
    studentNumber =  request.getParameter("studentNumber");
    name =  request.getParameter("name");
    String s = request.getParameter("departmentId");
    departmentId = (s == null) ? 0 : Integer.parseInt(s);
    year =  request.getParameter("year");
    
    if (id == null || id.length() == 0) 
        에러메시지 = "사용자 아이디를 입력하세요";
    else if (studentNumber == null || studentNumber.length() == 0) 
        에러메시지 = "학번을 입력하세요";
    else if (name == null || name.length() == 0) 
        에러메시지 = "이름을 입력하세요";
    else if (year == null || year.length() == 0) 
        에러메시지 = "학년을 입력하세요";
    
}
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
      input.form-control { width: 200px; }
  </style>
</head>
<body>

<div class="container">

<h1>학생 등록</h1>
<hr />

<form method="post">
  <div class="form-group">
    <label>ID</label>
    <input type="text" class="form-control" name="id" value="<%= id %>" />
  </div>
  <div class="form-group">
    <label>학번</label>
    <input type="text" class="form-control" name="studentNumber" value="<%= studentNumber %>" />
  </div>
    <div class="form-group">
    <label>이름</label>
    <input type="text" class="form-control" name="name" value="<%= name %>"/>
  </div>
  <div class="form-group">
    <label>학과</label>
    <select class="form-control" name="department">
      <option value="1">소프트웨어공학과</option>
      <option value="2">컴퓨터공학과</option>
      <option value="3">정보통신공학과</option>
      <option value="4">글로컬IT공학과</option>
    </select>
  </div>
   <div class="form-group">
    <label>학년</label>
    <input type="text" class="form-control" name="yearl" value="<%= year %>" />
  </div>
  <button type="submit" class="btn btn-primary">
    <i class="glyphicon glyphicon-ok"></i> 저장
  </button>
</form>

<hr />
<div class="alert alert-info">
  현재시각: <%= 현재시각 %>
</div>

<% if (에러메시지 != null) { %>
  <div class="alert alert-danger">
  학생 등록  실패: <%= 에러메시지 %>
  </div>
<% } %>
</div>
</body>
</html>
