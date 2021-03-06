<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="lecture1.*, java.net.*, java.util.*, lecture1.*,java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");

String 에러메세지 = null;
String s1 = request.getParameter("id");
int id= ParseUtils.parseInt(s1,0);

String pg = request.getParameter("pg");
/* //String srchText = request.getParameter("srchText");
if (srchText == null) srchText = "";
String srchTextEncoded = URLEncoder.encode(srchText, "UTF-8"); */
String ss = request.getParameter("ss");
String st = request.getParameter("st");
if(ss == null) ss="0";
if(st ==null) st="";
String stEncoded = URLEncoder.encode(st,"UTF-8");

String od = request.getParameter("od");
Article article =null;

if (request.getMethod().equals("GET")) {
	article = new Article();
	article.setTitle("");
	article.setBody("");

}
else {
	article = new Article();
	article.setId(id);
	article.setTitle(request.getParameter("title"));
	article.setBody(request.getParameter("body"));
	String s2 = request.getParameter("no");
	article.setNo(ParseUtils.parseInt(s2,0));
	s2 = request.getParameter("userId");
	article.setUserId(ParseUtils.parseInt(s2,0));	
	String s3 = request.getParameter("notice");
	article.setNotice(s3!=null);
	s3 = request.getParameter("boardId");
	article.setBoardId(ParseUtils.parseInt(s3,0));
	article.setWriteTime(new Timestamp(System.currentTimeMillis()));
	
	if(article.getNo() <= 0)
		에러메세지 ="no를 입력하세요";
	else if(article.getTitle() ==null || article.getTitle().length()==0)
		에러메세지 ="제목을 입력하세요";
	else if(article.getBody() ==null || article.getBody().length()==0)
		에러메세지 ="본문을 입력하세요";
	else if(article.getUserId() ==0)
		에러메세지 ="작성자를 입력하세요";
	else{
		ArticleDAO.insert(article);
		response.sendRedirect("list1.jsp?pg=9999");
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

<h1>게시글  등록</h1>
<hr />

<form method="post">
 <div class="form-group">
    <label>사용자 아이디</label>
    <input type="text" class="form-control" name="no" 
           value="<%= article.getNo() %>" />
           
  </div>
   <div class="form-group">
    <label>제목</label>
    <input type="text" class="form-control" name="title" 
           value="<%= article.getTitle() %>" />
  </div>
  <div class="form-group">
    <label>본문</label>
    <textarea class="form-control" name="body" rows="20"><%= article.getBody() %></textarea>
  </div>
<div class="form-group">
    <label>작성자</label>
    <select class="form-control" name="userId">
      <% for (User u : UserDAO.findAll()) { %>
          <% String selected = article.getUserId()==u.getId() ? "selected" : ""; %>
          <option value="<%= u.getId() %>" <%= selected %>>
            <%= u.getName() %>
          </option>
      <% } %>
    </select>
  </div>
<div class="form-group">
    <label>게시판</label>
    <select class="form-control" name="boardId">
      <% for (Board b : BoardDAO.findAll()) { %>
          <% String selected = article.getBoardId()==b.getId() ? "selected" : ""; %>
          <option value="<%= b.getId() %>" <%= selected %>>
            <%= b.getBoardName() %>
          </option>
      <% } %>
    </select>
  </div>

   <div class="form-group">
    <label>공지</label>
    <input type="checkbox" name="notice" <%=article.isNotice() ? "checked" : "" %> />
  </div>

  <button type="submit" class="btn btn-primary">
    <i class="glyphicon glyphicon-ok"></i> 저장
  </button>
  <a href="userList.jsp?pg=<%= pg %>&ss=<%=ss %>&st=<%=stEncoded %>&od=<%=od %>" 
     class="btn btn-default">
    <i class="glyphicon glyphicon-list"></i> 목록으로
  </a>  
</form>

<hr />
<% if (에러메세지 != null) { %>
  <div class="alert alert-danger">
    저장 실패: <%= 에러메세지 %>
  </div>
<% } %>
</div>
</body>
</html>

