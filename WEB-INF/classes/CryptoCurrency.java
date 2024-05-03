package pack;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.crypto.SecretKey;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Statement;


public class CryptoCurrency extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CryptoCurrency() {
        super();
    }

   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String tid=request.getParameter("tid");
	    String acno=request.getParameter("acno");
	    String amt=request.getParameter("amt");
	    
	    response.setContentType("text/html");
	    PrintWriter pw=response.getWriter();
try{
        Connection con=Dbconn.getConnection();
        Statement st=con.createStatement();

        SecretKey secKey = AESEncryption.getSecretEncryptionKey();
        byte[] cipherText = AESEncryption.encryptText(tid+"-"+acno+"-"+amt, secKey);
        String decryptedText = AESEncryption.decryptText(cipherText, secKey);
	    pw.println("<input type='text' value='"+cipherText+"' />");

	    String[] parts = decryptedText.split("-");
	    pw.println("Id No: "+parts[0]); 
	    pw.println("Card No: "+parts[1]); 
	    pw.println("Amount: "+parts[2]); 
	    int i=st.executeUpdate("UPDATE transaction SET crypto='"+cipherText+"' WHERE id="+tid+" AND acno='"+acno+"'");
	    
	    if(i!=0){
	         response.sendRedirect("transaction.jsp?msg=success");
	      }
}
catch(Exception e){
	  System.out.println("AES Exception occurred");
}

	}

}
