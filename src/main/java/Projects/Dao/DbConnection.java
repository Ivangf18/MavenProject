package Projects.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import Projects.exception.DbException;

public class DbConnection {

	private static String HOST = "localhost";
	private static String PASSWORD = "projects";
	private static int PORT = 3306;
	private static String SCHEMA = "projects";
	private static String USER = "projects";
	
	public static Connection getconnection() {
     String uri = String.format("jdbc:mysql://%s:%d/%s?user=%s&password=%s&useSSL=false" ,
    		 HOST, PORT, SCHEMA, USER, PASSWORD);
    		 
      System.out.println("Connecting with url=" + uri);
      
      try {
          
          Connection connection = DriverManager.getConnection(uri);
          
          
          System.out.println("Database connection established successfully.");
          return connection;
      } catch (SQLException e) {
         
          System.out.println("Error establishing database connection: " + e.getMessage());
          throw new DbException("Failed to connect to the database", e);
      }
  }

	}
	