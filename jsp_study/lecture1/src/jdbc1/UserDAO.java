package jdbc1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import lecture1.DB;

public class UserDAO {
    public static User createUser(ResultSet resultSet) throws SQLException {
    	 User user = new User();
         user.setId(resultSet.getInt("id"));
         user.setName(resultSet.getString("name"));
         user.setEmail(resultSet.getString("email"));
         user.setDepartmentName(resultSet.getString("departmentName"));
         user.setUserType(resultSet.getString("userType"));
        return user;
    }
	  public static List<User> findAll() throws Exception {
	        String sql = "SELECT u.*,d.departmentName " +
	                     "FROM user u  JOIN department d ON u.departmentId = d.id";
	        Connection connection = null;
	        PreparedStatement statement = null;
	        ResultSet resultSet = null;
	        ArrayList<User> list = new ArrayList<User>();
	        try {
	            connection = DB.getConnection("student1");
	            statement = connection.prepareStatement(sql);
	            resultSet = statement.executeQuery();
	            while (resultSet.next()) {
	                User user = new User();
	                user.setId(resultSet.getInt("id"));
	                user.setName(resultSet.getString("name"));
	                user.setEmail(resultSet.getString("email"));
	                user.setDepartmentName(resultSet.getString("departmentName"));
	                user.setUserType(resultSet.getString("userType"));
	                list.add(user);
	            }
	        } finally {
	            if (connection != null) connection.close();
	            if (statement != null) statement.close();
	            if (resultSet != null) resultSet.close();
	        }
	        return list;
	    }
	  public static List<User> findByName(String name) throws Exception {
	        String sql = "SELECT u.*, d.departmentName " +
	                     "FROM user u LEFT JOIN department d ON u.departmentId = d.id " +
	                     "WHERE u.name LIKE ?";
	        try (Connection connection = DB.getConnection("student1");
	             PreparedStatement statement = connection.prepareStatement(sql)) {
	            statement.setString(1, name + "%");
	            try (ResultSet resultSet = statement.executeQuery()) {
	                ArrayList<User> list = new ArrayList<User>();
	                while (resultSet.next())
	                    list.add(createUser(resultSet));
	                return list;
	            }
	        }
	    }

	    public static List<User> findByDepartmentId(int departmentId) throws Exception {
	        String sql = "SELECT u.*, d.departmentName " +
	                     "FROM user u LEFT JOIN department d ON u.departmentId = d.id " +
	                     "WHERE u.departmentId = ?";
	        try (Connection connection = DB.getConnection("student1");
	             PreparedStatement statement = connection.prepareStatement(sql)) {
	            statement.setInt(1, departmentId);
	            try (ResultSet resultSet = statement.executeQuery()) {
	                ArrayList<User> list = new ArrayList<User>();
	                while (resultSet.next())
	                    list.add(createUser(resultSet));
	                return list;
	            }
	        }
	    }
}
