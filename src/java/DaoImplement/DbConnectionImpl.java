package DaoImplement;

import DaoInterface.DbConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnectionImpl {
    
    private static Connection conn=null;
    private static String url=null;

    private static void prepareURL(){
        url="jdbc:mysql://"+ DbConnection.hostname+"/"+DbConnection.dbName+"?useSSL=false";
    } //end of prepareURL method

    public static Connection getConnection(){
        prepareURL();
        try {
//            System.out.println("URL = "+url);
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection(url,DbConnection.userName,DbConnection.pwd);
//            System.out.println("Database Connection successfull...");
        }catch (SQLException e){
            e.printStackTrace();
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return conn;
    }
}