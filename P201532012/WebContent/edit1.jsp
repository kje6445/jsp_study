<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lecture1.*, java.net.*, java.util.*, lecture1.*" %>
<%
request.setCharacterEncoding("UTF-8");

String 에러메시지 = null;
String s1 = request.getParameter("id");
int id = ParseUtils.parseInt(s1, 0);

String pg = request.getParameter("pg");
String srchText = request.getParameter("st");
if (srchText == null) srchText = "";
String srchTextEncoded = URLEncoder.encode(srchText, "UTF-8");
String od =request.getParameter("od");
Article article=null;

if (request.getMethod().equals("GET")) {
    article=ArticleDAO.findOne(id);
}
else {
    article = new Article();
    article.setId(id);
    article.setTitle(request.getParameter("title"));

  	String s2 = request.getParameter("userId");
    article.setUserId(ParseUtils.parseInt(s2,1));
    
    if (s1 == null || s1.length() == 0) 
        에러메시지 = "제목을 입력하세요";
    else if (article.getTitle() == null || article.getTitle().length() == 0) 
        에러메시지 = "본문을 입력하세요";
       
    else {
    	ArticleDAO.update(article);
        response.sendRedirect("articleList.jsp?pg=" + pg + "&srchText=" + srchTextEncoded+"&od="+od);
        return;
    }
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
      input.form-control, select.form-control { width: 200px; }
  </style>
</head>
<body>

<div class="container">

<h1>게시물 등록</h1>
<hr />

<form method="post">
  <div class="form-group">
    <label>제목</label>
    <input type="text" class="form-control" name="title" 
           value="<%= article.getTitle() %>" />
  </div>
  <div class="form-group">
    <label>본문</label>
    <input type="text" class="form-control" name="name" value="<%= article.getBody() %>" />
  </div>

 

  <button type="submit" class="btn btn-primary">
    <i class="glyphicon glyphicon-ok"></i> 저장
  </button>
  <a href="Delete1.jsp?id=<%= id %>&pg=<%= pg %>&srchText=<%= srchTextEncoded %>&od<%=od%>" 
     class="btn btn-danger" onclick="return confirm('삭제하시겠습니까?')">
    <i class="glyphicon glyphicon-trash"></i> 삭제
  </a>
  <a href="userList.jsp?pg=<%= pg %>&srchText=<%= srchTextEncoded %>&od<%=od%>" 
     class="btn btn-default">
    <i class="glyphicon glyphicon-list"></i> 목록으로
  </a>
</form>

<hr />
<% if (에러메시지 != null) { %>
  <div class="alert alert-danger">
    학생등록 실패: <%= 에러메시지 %>
  </div>
<% } %>
</div>
</body>
</html>
