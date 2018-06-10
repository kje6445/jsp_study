package lecture1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ArticleDAO {
	public static Article createArticle(ResultSet resultSet) throws SQLException {
		  Article article = new Article();
	  article.setId(resultSet.getInt("id"));
	  article.setBoardId(resultSet.getInt("boardId"));
	  article.setNo(resultSet.getInt("no"));
	  article.setUserId(resultSet.getInt("userId"));
	  article.setWriteTime(resultSet.getTimestamp("writeTime"));
	  article.setTitle(resultSet.getString("title"));
	  article.setBody(resultSet.getString("body"));
	  article.setNotice(resultSet.getBoolean("notice"));
//	  article.setBoardName(resultSet.getString("boardName"));
//	  article.setName(resultSet.getString("name"));

    return article;
}

	 public static List<Article> findAll( int currentPage, int pageSize, String ss, String st, String od
) throws Exception {
	    	String sql = "call article_findAll(?,?,?,?,?)";

	        try (Connection connection = DB.getConnection("bbs2");
	             PreparedStatement statement = connection.prepareStatement(sql)) {
	            statement.setInt(1, (currentPage - 1) * pageSize);
	            statement.setInt(2, pageSize);
	            statement.setString(3, ss);
	            statement.setString(4, st);
	            statement.setString(5, od);
	            try (ResultSet resultSet = statement.executeQuery()) {
	                ArrayList<Article> list = new ArrayList<Article>();
	                while (resultSet.next()) {
	                    Article article = createArticle(resultSet);
	                    article.setUserName(resultSet.getString("userName"));
	                    article.setBoardName(resultSet.getString("boardName"));
	                    list.add(article);
	                }
	                return list;
	            }
	        }
	    }

/*	  public static int count(String title) throws Exception {
	        String sql = "SELECT COUNT(*) FROM article WHERE title LIKE ?";
	        try (Connection connection = DB.getConnection("bbs2");
	             PreparedStatement statement = connection.prepareStatement(sql)) {
	            statement.setString(1,title + "%");
	            try (ResultSet resultSet = statement.executeQuery()) {
	                if (resultSet.next())
	                    return resultSet.getInt(1);
	            }
	        }
	        return 0;
	    }*/
	 public static int count(String ss, String st) throws Exception{
		 String sql = "call article_count(?,?)";
		 try(Connection connection = DB.getConnection("bbs2");
				 PreparedStatement statement = connection.prepareStatement(sql)){
			 statement.setString(1,ss); //조회 방법
			 statement.setString(2, st); //검색 문자열
			 try(ResultSet resultSet = statement.executeQuery()){
				 if(resultSet.next())
					 return resultSet.getInt(1);
			 }
		 }
		 return 0;
	 }

/*	    public static Article findOne(int id) throws Exception {
	        String sql = "SELECT * FROM article WHERE id=?";
	        try (Connection connection = DB.getConnection("bbs2");
	             PreparedStatement statement = connection.prepareStatement(sql)) {
	            statement.setInt(1, id);
	            try (ResultSet resultSet = statement.executeQuery()) {
	                if (resultSet.next()) {
	          		  Article article = new Article();
	          		  article.setId(resultSet.getInt("id"));
	          		  article.setBoardId(resultSet.getInt("boardId"));
	          		  article.setNo(resultSet.getInt("no"));
	          		  article.setUserId(resultSet.getInt("userId"));
	          		  article.setWriteTime(resultSet.getTimestamp("writeTime"));
	          		  article.setTitle(resultSet.getString("title"));
	          		  article.setBody(resultSet.getString("body"));
	          		  article.setNotice(resultSet.getString("notice"));
	          		  article.setNotice(resultSet.getString("boardName"));
	        	      return article;
	                }
	            }
	            return null;
	        }
	    }*/
	 public static Article findOne(int id) throws Exception{
		 String sql = "SELECT * FROM article WHERE id =?";
		 try(Connection connection = DB.getConnection("bbs2");
				 PreparedStatement statement = connection.prepareStatement(sql)){
			 statement.setInt(1, id);
			 try(ResultSet resultSet = statement.executeQuery()){
				 if(resultSet.next()) {
					 Article article = createArticle(resultSet);
					 return article;
				 }
			 }
			 return null;
		 }
	 }
/*
	    public static void update(User user) throws Exception {
	        String sql = "UPDATE user SET userId=?, name=?, email=?, departmentId=?, userType=? " +
	                     " WHERE id = ?";
	        try (Connection connection = DB.getConnection("student1");
	             PreparedStatement statement = connection.prepareStatement(sql)) {
	            statement.setString(1, user.getUserid());
	            statement.setString(2, user.getName());
	            statement.setString(3, user.getEmail());
	            statement.setInt(4, user.getDepartmentId());
	            statement.setString(5, user.getUserType());
	            statement.setInt(6, user.getId());
	            statement.executeUpdate();
	        }
	    }
*/
	 	public static void update(Article article)throws Exception{
	 		String sql = "update article set title=?, body=?,notice=?,userId=?"+
	 					" where id=?";
	 		try(Connection connection = DB.getConnection("bbs2");
	 				PreparedStatement statement = connection.prepareStatement(sql)){
	 			statement.setString(1,article.getTitle());
	 			statement.setString(2,article.getBody());
	 			statement.setBoolean(3,article.isNotice());
	 			statement.setInt(4,article.getUserId());
	 			statement.setInt(5,article.getId());
	 			statement.executeUpdate();

	 		}
	 	}
	    public static void insert(Article article) throws Exception {
	        String sql = "INSERT article (no,title, body, userid , boardId, notice, writeTime)" +
	                     " VALUES (?, ?, ?, ?, ?, ?,?)";
	        try (Connection connection = DB.getConnection("bbs2");
	             PreparedStatement statement = connection.prepareStatement(sql)) {
	            statement.setInt(1, article.getNo());
	            statement.setString(2, article.getTitle());
	            statement.setString(3, article.getBody());
	            statement.setInt(4, article.getUserId());
	            statement.setInt(5, article.getBoardId());
	            statement.setBoolean(6, article.isNotice());
	            statement.setTimestamp(7, article.getWriteTime());
	            statement.executeUpdate();
	        }
	    }

	    public static void delete(int id) throws Exception {
	        String sql = "DELETE FROM user WHERE id = ?";
	        try (Connection connection = DB.getConnection("article1");
	             PreparedStatement statement = connection.prepareStatement(sql)) {
	            statement.setInt(1, id);
	            statement.executeUpdate();
	        }
	    }


	}
