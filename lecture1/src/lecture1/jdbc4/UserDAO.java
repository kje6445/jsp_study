package lecture1.jdbc4;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import lecture1.DB;

public class UserDAO {

    public static List<User> findAll(int currentPage, int pageSize) throws Exception {
        String sql = "SELECT u.*, d.departmentName" +
                     " FROM user u LEFT JOIN department d ON u.departmentId = d.id" +
                     " LIMIT ?, ?";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, (currentPage - 1) * pageSize);
            statement.setInt(2, pageSize);
            try (ResultSet resultSet = statement.executeQuery()) {
                ArrayList<User> list = new ArrayList<User>();
                while (resultSet.next()) {
                	User user = new User();
	                user.setId(resultSet.getInt("id"));
	                user.setUserId(resultSet.getString("userid"));
	                user.setName(resultSet.getString("name"));
	                user.setEmail(resultSet.getString("email"));
                    user.setDepartmentId(resultSet.getInt("departmentId"));
	                user.setDepartmentName(resultSet.getString("departmentName"));
	                user.setUserType(resultSet.getString("userType"));

	                list.add(user);
                }
                return list;
            }
        }
    }

    public static int count() throws Exception {
        String sql = "SELECT COUNT(*) FROM student";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next())
                    return resultSet.getInt(1);
        }
        return 0;
    }

    public static User findOne(int id) throws Exception {
        String sql = "SELECT * FROM user WHERE id=?";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                	User user = new User();
	                user.setId(resultSet.getInt("id"));
	                user.setUserId(resultSet.getString("userid"));
	                user.setName(resultSet.getString("name"));
	                user.setEmail(resultSet.getString("email"));
	                user.setDepartmentId(resultSet.getInt("departmentId"));
	                user.setUserType(resultSet.getString("userType"));
                    return user;
                }
            }
            return null;
        }
    }

    public static void update(User user) throws Exception {
        String sql = "UPDATE User SET userid=?, name=?, email=?, departmentId=?,userType=?" +
                     " WHERE id = ?";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getUserId());
            statement.setString(2, user.getName());
            statement.setString(3, user.getEmail());
            statement.setInt(4, user.getDepartmentId());
            statement.setString(5, user.getUserType());
            statement.setInt(6, user.getId());
            statement.executeUpdate();
        }
    }

    public static void insert(User user) throws Exception {
        String sql = "INSERT user (userid,password, name, email,departmentId, userType, enabled)" +
                     " VALUES (?, ? ,?, ?, ?, ?, ?)";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getUserId());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getName());
            statement.setString(4, user.getEmail());
            statement.setInt(5, user.getDepartmentId());
            statement.setString(6, user.getUserType());
            statement.setBoolean(7, user.isEnabled());
            statement.executeUpdate();
        }
    }

    public static void delete(int id) throws Exception {
        String sql = "DELETE FROM user WHERE id = ?";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }
}
