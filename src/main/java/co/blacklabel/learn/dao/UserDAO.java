package co.blacklabel.learn.dao;

import co.blacklabel.learn.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Class for control the User data
 */
public class UserDAO {
  private String jdbcURL = "jdbc:mysql://localhost:3306/demo?useSSL=false";
  private String dbUser = "root";
  private String dbPassword = "KAtg1090528922";

  private static final String INSERT_USERS_SQL = "INSERT INTO users(user_name, user_email, user_country)"
          +"VALUES (?,?,?);";
  private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
  private static final String SELECT_ALL_USERS = "select * from users";
  private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
  private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";

  /**
   * Make the Connection to the database using the url, user, password given in config values
   * @return Connection if that's return ok, else null
   */
  private Connection getConnection(){
    Connection connection = null;
    try{
      Class.forName("com.mysql.jdbc.Driver");
      connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
    } catch (ClassNotFoundException | SQLException exception){
      System.out.println(exception);
    }
    return connection;
  }

  /**
   * get the JDBC URL
   * @return jdbcURL String data
   */
  public String getJdbcURL() {
    return jdbcURL;
  }

  /**
   * replace the jdbc URL
   * @param jdbcURL new url for connection
   */
  public void setJdbcURL(String jdbcURL) {
    this.jdbcURL = jdbcURL;
  }

  /**
   * get the saved username from database
   * @return dbUser String with the database username
   */
  public String getDbUser() {
    return dbUser;
  }

  /**
   * updates the username for the database connection
   * @param dbUser String with the new username
   */
  public void setDbUser(String dbUser) {
    this.dbUser = dbUser;
  }

  /**
   * get the database config password
   * @return dbPassword, string with the password connection
   */
  public String getDbPassword() {
    return dbPassword;
  }

  /**
   * set the password connection
   * @param dbPassword String new password for database
   */
  public void setDbPassword(String dbPassword) {
    this.dbPassword = dbPassword;
  }

  /**
   * searches within the database for the user with the identifier given by parameters
   * @param userId User id that is gonna be search
   * @return User if exist, else null
   */
  public User getUserByID(int userId){
    User user = null;
    try{
      PreparedStatement ps = getConnection().prepareStatement(SELECT_USER_BY_ID);
      ps.setInt(1, userId);
      ResultSet rs = ps.executeQuery();
      while (rs.next()){
        user = new User(
                rs.getInt("user_id"),
                rs.getString("user_name"),
                rs.getString("user_email"),
                rs.getString("user_country")
        );
      }
    } catch (SQLException e){
      System.out.println(e);
    }
    return user;
  }

  /**
   * executes MySQL query to get all in table users
   * @return users a list with all the users
   */
  public List<User> selectAllUsers(){
    List<User> users = new ArrayList<>();
    try {
      Connection connection = getConnection();
      PreparedStatement ps = connection.prepareStatement(SELECT_ALL_USERS);
      ResultSet rs = ps.executeQuery();

      while (rs.next()){
        int id = rs.getInt("id");
        String name = rs.getString("name");
        String email = rs.getString("email");
        String country = rs.getString("country");
        users.add(new User(id, name, email, country));
      }
    } catch (SQLException e){
      System.out.println(e);
    }
    return users;
  }

  /**
   * Delete from the database the user with the ID given
   * @param id int with the id user
   * @return true if success, else, false
   * @throws SQLException if SQL error
   */
  public boolean deleteUser(int id) throws SQLException {
    boolean rowDeleted;
    Connection connection = getConnection();
    PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);
    statement.setInt(1, id);
    rowDeleted = statement.executeUpdate() > 0;
    return rowDeleted;
  }

  /**
   * Updates the user data
   * @param user User whose data will be updated
   * @return true if success, else false
   * @throws SQLException if SQL error
   */
  public boolean updateUser(User user) throws SQLException {
    boolean rowUpdated;
    Connection connection = getConnection();
    PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);
    statement.setString(1, user.getUser_name());
    statement.setString(2, user.getUser_email());
    statement.setString(3, user.getUser_country());
    statement.setInt(4, user.getUser_id());
    return statement.executeUpdate() > 0;
  }

  /**
   * insert a new User in database
   * @param user new user to be insert
   * @throws SQLException if SQL error
   */
  public void insertUser(User user) throws SQLException {
    Connection connection = getConnection();
    PreparedStatement ps = connection.prepareStatement(INSERT_USERS_SQL);
    ps.setString(1, user.getUser_name());
    ps.setString(2, user.getUser_email());
    ps.setString(3, user.getUser_country());
    ps.executeUpdate();
  }
}
