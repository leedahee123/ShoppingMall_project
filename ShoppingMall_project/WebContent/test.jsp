<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
try
{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection(
    "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");

    Statement insert_stmt=con.createStatement();
    Statement insert2_stmt=con.createStatement();

    Statement select_stmt=con.createStatement();



    for(int id=1; id <= 100 ; id++){
        String insert_query = "INSERT INTO MORUGATSUYO(id, COL1, COL2, COL3, COL4) VALUES(%d, %d, %d, %d, %d)";
        insert_stmt.executeQuery(String.format(insert_query, id, (int)(Math.random() * 100),(int)(Math.random() * 100),(int)(Math.random() * 100),(int)(Math.random() * 100)));
    }

    String select_query = "SELECT ID, COL1, COL2, COL3, COL4 FROM MORUGATSUYO WHERE AVG_COL IS NULL";
    ResultSet rs=select_stmt.executeQuery(select_query);
    while(rs.next()) {
        int AVG = ( rs.getInt("COL1") + rs.getInt("COL2") + rs.getInt("COL3") + rs.getInt("COL4") ) / 4;
        String insert_query2 = "UPDATE MORUGATSUYO SET AVG_COL = %d WHERE ID = %d";
        insert2_stmt.executeQuery(String.format(insert_query2, AVG, rs.getInt("ID")));
    }

    con.commit();
    con.close();
}
catch(Exception e)
{ 
    System.out.println(e);
}
%>

<%
	try
	{  
		Class.forName("oracle.jdbc.driver.OracleDriver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
		Statement select_stmt=con.createStatement();  
		Statement update_stmt=con.createStatement();  
		
		String select_query = "SELECT ID, COL1, COL2, COL3, COL4 FROM MORUGATSUYO";
		
		ResultSet rs=select_stmt.executeQuery(select_query);  
		while(rs.next()) {
			int col1 = rs.getInt("COL1");
			int col2 = rs.getInt("COL2");
			int col3 = rs.getInt("COL3");
			int col4 = rs.getInt("COL4");
			
			int id = rs.getInt("id");
			
			String update_query = "UPDATE MORUGATSUYO SET AVG_COL = %d WHERE ID = %d";
			update_stmt.executeQuery(String.format(update_query, (col1 + col2 + col3 + col4) / 4, id));
		}
	
		
		con.commit();
		con.close();
	}
	catch(Exception e)
	{ 
		System.out.println(e);
	}  
%>

<%
try
{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	Statement stmt=con.createStatement();  

	for (int i = 1; i <= 100; i++) {
		String query = "INSERT INTO MORUGATSUYO(ID, COL1, COL2, COL3, COL4) VALUES(%d, %d, %d, %d, %d)";
		
		stmt.executeQuery(String.format(query, i, (int)(Math.random() * 100),  (int)(Math.random() * 100),  (int)(Math.random() * 100), (int)(Math.random() * 100), (int)(Math.random() * 100)));

	
	}
	
	con.commit();
	con.close();
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>

</body>
</html>