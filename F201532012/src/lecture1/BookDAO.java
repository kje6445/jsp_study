package lecture1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class BookDAO {

	public static Book createBook(ResultSet resultSet) throws SQLException {
			Book book = new Book();
			book.setId(resultSet.getInt("id"));
			book.setTitle(resultSet.getString("title"));
			book.setAuthor(resultSet.getString("author"));
			book.setCategoryName(resultSet.getString("categoryName"));
			book.setPublisherName(resultSet.getString("publisherName"));
			book.setPrice(resultSet.getInt("price"));
			book.setAvailable(resultSet.getBoolean("available"));

    return book;
}
	public static List<Book> findAll() throws Exception{
		String sql = "SELECT b.*, c.categoryName " +
					"FROM book b LEFT JOIN category c ON b.categoryId = c.id " +
					"ORDER BY ID ASC";
		try(Connection connection = DB.getConnection("book2");
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()){
					ArrayList<Book> list = new ArrayList<Book>();
					while(resultSet.next()) {
						Book book = new Book();
						book.setId(resultSet.getInt("id"));
						book.setTitle(resultSet.getString("title"));
						book.setAuthor(resultSet.getString("author"));
						book.setCategoryName(resultSet.getString("categoryName"));
						book.setPrice(resultSet.getInt("price"));
						book.setAvailable(resultSet.getBoolean("available"));
						 list.add(book);
					}
					return list;

				}
	}

	public static List<Book> findAll2() throws Exception{
		String sql = "SELECT b.*, c.categoryName, p.title publisherName " +
					 "FROM book b LEFT JOIN category c ON b.categoryId = c.id " +
				     "LEFT JOIN publisher p ON b.publisherId = p.id " +
					 "ORDER BY ID ASC";

		try(Connection connection = DB.getConnection("book2");
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()){
					ArrayList<Book> list = new ArrayList<Book>();
					while(resultSet.next()) {
						Book book = new Book();
						book.setId(resultSet.getInt("id"));
						book.setTitle(resultSet.getString("title"));
						book.setAuthor(resultSet.getString("author"));
						book.setCategoryName(resultSet.getString("categoryName"));
						book.setPublisherName(resultSet.getString("publisherName"));
						book.setPrice(resultSet.getInt("price"));
						book.setAvailable(resultSet.getBoolean("available"));
						 list.add(book);
					}
					return list;

				}
	}

	public static List<Book> findAll3(int currentPage, int pageSize) throws Exception {
        String sql = "SELECT b.*, c.categoryName, p.title publisherName " +
				 	"FROM book b LEFT JOIN category c ON b.categoryId = c.id " +
				 	"LEFT JOIN publisher p ON b.publisherId = p.id " +
				 	"ORDER BY ID ASC " +
                     " LIMIT ?, ?";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, (currentPage - 1) * pageSize);
            statement.setInt(2, pageSize);
            try (ResultSet resultSet = statement.executeQuery()) {
                ArrayList<Book> list = new ArrayList<Book>();
                while (resultSet.next()) {
                	Book book = new Book();
					book.setId(resultSet.getInt("id"));
					book.setTitle(resultSet.getString("title"));
					book.setAuthor(resultSet.getString("author"));
					book.setCategoryName(resultSet.getString("categoryName"));
					book.setPublisherName(resultSet.getString("publisherName"));
					book.setPrice(resultSet.getInt("price"));
					book.setAvailable(resultSet.getBoolean("available"));
					 list.add(book);
                }
                return list;
            }
        }
    }
	public static List<Book> findAll4(int currentPage, int pageSize,String ss, String st) throws Exception {
        String sql = "SELECT b.*, c.categoryName, p.title publisherName " +
				 	"FROM book b LEFT JOIN category c ON b.categoryId = c.id " +
				 	"LEFT JOIN publisher p ON b.publisherId = p.id " +
				 	"ORDER BY ID ASC " +
                     " LIMIT ?, ?";
        try (Connection connection = DB.getConnection("student1");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, (currentPage - 1) * pageSize);
            statement.setInt(2, pageSize);
            statement.setString(3, ss);                        // 조회 방법
            statement.setString(4, st + "%");
            try (ResultSet resultSet = statement.executeQuery()) {
                ArrayList<Book> list = new ArrayList<Book>();
                while (resultSet.next()) {
                	Book book = new Book();
					book.setId(resultSet.getInt("id"));
					book.setTitle(resultSet.getString("title"));
					book.setAuthor(resultSet.getString("author"));
					book.setCategoryName(resultSet.getString("categoryName"));
					book.setPublisherName(resultSet.getString("publisherName"));
					book.setPrice(resultSet.getInt("price"));
					book.setAvailable(resultSet.getBoolean("available"));
					 list.add(book);
                }
                return list;
            }
        }
    }

    public static int count() throws Exception {
        String sql = "SELECT COUNT(*) FROM book";
        try (Connection connection = DB.getConnection("book2");
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next())
                    return resultSet.getInt(1);
        }
        return 0;
    }

    public static Book findOne(int id) throws Exception {
        String sql = "SELECT * FROM book WHERE id=?";
        try (Connection connection = DB.getConnection("book2");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                	Book book = new Book();
					book.setId(resultSet.getInt("id"));
					book.setTitle(resultSet.getString("title"));
					book.setAuthor(resultSet.getString("author"));
					book.setCategoryId(resultSet.getInt("categoryId"));
					book.setPublisherId(resultSet.getInt("publisherId"));
					book.setPrice(resultSet.getInt("price"));
                    return book;
                }
            }
            return null;
        }
    }

    public static void update(Book book) throws Exception {
        String sql = "UPDATE book SET title=?, author=?, categoryId=?, publisherId=?, price=? " +
                     " WHERE id = ?";
        try (Connection connection = DB.getConnection("book2");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, book.getTitle());
            statement.setString(2, book.getAuthor());
            statement.setInt(3, book.getCategoryId());
            statement.setInt(4, book.getPublisherId());
            statement.setInt(5, book.getPrice());
            statement.setInt(6, book.getId());
            statement.executeUpdate();
        }
    }

    public static int count(String name) throws Exception {
        String sql = "SELECT COUNT(*) FROM book WHERE name LIKE ?";
        try (Connection connection = DB.getConnection("book2");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, name + "%");
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next())
                    return resultSet.getInt(1);
            }
        }
        return 0;
    }

    public static List<Book> findByName(String title, int currentPage, int pageSize) throws Exception {
        String sql =
        "SELECT b.*, c.categoryName, p.title publisherName " +
	 	"FROM book b LEFT JOIN category c ON b.categoryId = c.id " +
	 	"LEFT JOIN publisher p ON b.publisherId = p.id " +
	 	"ORDER BY ID ASC " +
	 	 " WHERE title LIKE ?" +
         " LIMIT ?, ?";
        try (Connection connection = DB.getConnection("book2");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, title + "%");
            statement.setInt(2, (currentPage - 1) * pageSize);
            statement.setInt(3, pageSize);
            try (ResultSet resultSet = statement.executeQuery()) {
                ArrayList<Book> list = new ArrayList<Book>();
                while (resultSet.next()) {
                    list.add(createBook(resultSet));
                }
                return list;
            }
        }
    }

    public static int count(String ss, String st) throws Exception {
        String sql = "call book_count(?, ?)";
        try (Connection connection = DB.getConnection("book2");
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, ss);  // 조회 방법
            statement.setString(2, st + "%");  // 검색 문자열
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next())
                    return resultSet.getInt(1);
            }
        }
        return 0;
    }


}
