<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, jdbc1.*" %>
<%
String[] s = request.getParameterValues("departmentId");
 if(s == null)
	s=new String[0]; 
int[] departmentId =  new int[s.length];

for(int i=0; i<departmentId.length; ++i)
	departmentId[i] = Integer.parseInt(s[i]);//s[i].equals("0") ? 0 : Integer.parseInt(s[i]);
List<Student> list = new ArrayList<>();
for(int i=0; i<departmentId.length;++i){
  if  (departmentId[i] == 0) list = StudentDAO3.findAll(); 
 else list.addAll(StudentDAO3.findByDepartmentId(departmentId[i]));
  //지금 파라미터 값 앞에 계속 +이가 같이 찍힌다.
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
      thead th { background-color: #eee; }
      table.table { width: 700px; margin-top: 10px; }
  </style>
</head>
<body>

<div class="container">

<h1>학생목록</h1>

<form class="form-inline">
  <div class="form-group">
    <label>학과</label>
    	<form method ="post">
           <input  type="checkbox" name="departmentId" value="0"  />전체<!-- checked="checked" -->
           <input type="checkbox" name="departmentId" value="1" />국문학
           <input type="checkbox" name="departmentId" value="2" />영어영문학
           <input type="submit" class = "btn btn-primary" value="조회"></input>
          </form>
  </div>
</form>

<table class="table table-bordered table-condensed">
    <thead>
        <tr>
            <th>학번</th>
            <th>이름</th>
            <th>학과</th>
            <th>학년</th>
        </tr>
    </thead>
    <tbody>
        <% for (Student student : list) { %>
            <tr>
                <td><%= student.getStudentNumber() %></td>
                <td><%= student.getName() %></td>
                <td><%= student.getDepartmentName() %></td>
                <td><%= student.getYear() %></td>
            </tr>
        <% } %>
    </tbody>
</table>

</div>
</body>
</html>
