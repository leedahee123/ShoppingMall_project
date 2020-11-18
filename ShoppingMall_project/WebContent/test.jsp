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

</body>
</html>