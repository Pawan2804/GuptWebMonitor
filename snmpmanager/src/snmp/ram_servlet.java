package snmp;
import java.awt.List;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import snmp.*;

public class ram_servlet extends HttpServlet  {
	protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		//response.setIntHeader("Refresh", 3);
			
	      ramtabledata dd = new ramtabledata();
	      request.setAttribute("data", dd.getpingresult());
				
	      		System.out.println("entering servlet");
				
	}
}


class ramtabledata{
public ArrayList getpingresult(){
    ArrayList<m_bean> v = new ArrayList<m_bean>();
    
    try{
    	Connection connection =  DBConnection.getConnection();
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery("SELECT * FROM ram_usage order by ip");
     
     while(rs.next()){
    	 m_bean m_bean= new m_bean();
         m_bean.setip(rs.getString("ip")); 
         m_bean.setram_usage(rs.getString("ram_usage")); 
         m_bean.setlut(rs.getString("lut")); 
 
         v.add(m_bean); 
     }
     try {
        //connection.commit();
         connection.close();
     } catch (SQLException e) {
         e.printStackTrace();
     }
    }catch(Exception asd){
        System.out.println(asd.getMessage());
    }
    
    return v;
}
}