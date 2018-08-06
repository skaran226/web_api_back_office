<%@ page import="java.sql.*" errorPage="error.jsp"  isELIgnored="true" buffer="16kb" %>

<%

	
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		String starttime="";
		String endtime="";
		String username="";
		String password="";
	
		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		}
		catch(Exception ex){
			
			out.print("<br/> Driver not load properly, please check your Driver <br/>");
		}
	
	try{
		
		 con=DriverManager.getConnection("jdbc:odbc:db");
	}
	catch(Exception ex1){
			
			out.print("<br/> Driver load successfuly but something problem in connection string <br/>");
		}
	
	try{
		
			starttime=request.getParameter("starttime");
			endtime=request.getParameter("endtime");
			
			username=request.getParameter("username");
			password=request.getParameter("password");
		
			
		
		    if(username.equals("backoffice") && password.equals("backoffice")){
				
				if((!starttime.equals("") || !starttime.equals(null) || !starttime.isEmpty()) && (!endtime.equals("") || !endtime.equals(null) || !endtime.isEmpty())){
					
					
					
				}
				else{
					
					out.print("<h2>wrong starttime and endtime parameter values ");
				}
			}
			else{
					out.print("<h2>wrong username,password, starttime and endtime parameter values ");
			}
			
			 st=con.createStatement();
			
			 rs=st.executeQuery("SELECT SUM(DEPOSIT) as depo,SUM(CHANGE) as s_change,SUM(0) as TOTALDEBITPURCHASE,SUM(0) as TOTALCREDITPURCHASE  FROM TRANSACTIONS where AUTHORIZED_TIME >= '" + starttime + "' and AUTHORIZED_TIME <= '" + endtime + "'");
			
			while(rs.next()){
				out.print("&lt;endtime&gt;"+endtime+"&lt;/endtime&gt;<br/>");
				out.print("&lt;starttime&gt;"+starttime+"&lt;/starttime&gt;<br/>");
				out.print("&lt;totaldeposit&gt;"+rs.getString("depo")+"&lt;/totaldeposit&gt;<br/>");
				out.print("&lt;totalchange&gt;"+rs.getString("s_change")+"&lt;/totalchange&gt;<br/>");
				out.print("&lt;totaldebitpurchase&gt;"+rs.getString("TOTALDEBITPURCHASE")+"&lt;/totaldebitpurchase&gt;<br/>");
				out.print("&lt;totalcreditpurchase&gt;"+rs.getString("TOTALCREDITPURCHASE")+"&lt;/totalcreditpurchase&gt;<br/>");

			}
	}
	catch(Exception ex2){
		
			out.print("<br/> Driver load successfuly and Connection String Success but something problem in your Statement  <br/>");
	}



%>

