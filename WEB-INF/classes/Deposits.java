package pack;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.ResultSet;
import pack.Dbconn;
import java.sql.Statement;
import java.sql.Connection;




public class Deposits extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Deposits() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

	    String name=request.getParameter("name");
	    String acno=request.getParameter("acno");
	    String bname=request.getParameter("bname").toUpperCase();
	    String deposit=request.getParameter("amount");
	         
	      HttpSession session3=request.getSession(true); 
	     try{
	   Connection con=Dbconn.getConnection();
	   
	  Statement st=con.createStatement();
	  ResultSet rt=st.executeQuery("select acno,bname from register where name='"+name+"' AND acno='"+acno+"' AND bname='"+bname+"' ");
	  System.out.println("result set executed");
	  if(rt.next()){
	      String p=rt.getString("acno");
	      if(p.equals(acno)){
	          if(rt.getString("bname").toUpperCase().equals(bname)){
	          session3.setAttribute("uname",name);
	          session3.setAttribute("bank",bname);
	          session3.setAttribute("acc",acno);
	          String Str="INSERT INTO transaction(name,acno,bname,amount,crypto,flag) VALUES('"+name+"','"+acno+"','"+bname+"',"+deposit+",'Pending',0)";
	          int i=st.executeUpdate(Str);
	   if(i!=0){
	     //  out.println("<script>alert('registered')</script>");
	      response.sendRedirect("deposit.jsp?msg=success");
	   }
	   else {
	   response.sendRedirect("deposit.jsp?umsg=failed");
	  }
	         
	}
	                         
	 }
	     
	  }
	  else{
	      response.sendRedirect("deposit.jsp?umsg=failed");
	  }
	}
	catch (Exception e) {
        e.printStackTrace();
    }
	}
}
