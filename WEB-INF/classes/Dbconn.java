
package pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Dbconn {
    public static Connection con ;
    public static Connection getConnection() throws ClassNotFoundException, SQLException
    {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3308/offline","root","root");
        return con;
    }
    
    public static String getMobileNo(String UserName,String BankName) throws SQLException{
    	  String MobNo="";
    	  Statement st=con.createStatement();
    	  ResultSet rt=st.executeQuery("select cno from vendor where name='"+UserName+"' AND bname='"+BankName+"' ");
    	  if(rt.next()){
    	      MobNo=rt.getString("cno");
    	 } 
    	  return MobNo;
    }
}
