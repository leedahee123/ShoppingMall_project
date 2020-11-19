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
	for (int i = 1; i <= 5; i++) {
		for (int j = 1; j <= i; j++ ) {
			%><a>*</a><% 
		}
		%><br><%
	}
	%>
	
	
	<%
	int A = 1;
	int B = 1;
	while(B < 100) {
		int temp_number = A + B;
		A = B;
		B = temp_number;
		%><%=A %><br><%
	}
	%>
	
	<table border="1">
	<%
		int x;
		for (int i = 1; i <= 9; i++) {
			%><tr><%
			for (int j = 1; j <= 9; j++) {
				x = i * j;
				%><td><%=i %> * <%=j %> = <%=x %></td><%
			}
			%></tr><%
		}
	%>
	</table>
	
	
	<table border="1">
	<%
		for (int i = 1; i <= 5; i++) {
			%><tr><%
			for (int j = 1; j <= 5; j++ ) {
				%>
				<td>
					<%
					if(j<=i){
						%><%="*" %><%
					}
				 	%>
				 	</td><%
			}
			%></tr><%
		}	
	%>
	</table>
	
	</br>
	
	<table border ="1">
	<%
		for(int i=1 ; i<= 5; i++){
			%><tr><%
			for(int j=1; j<=5; j++){
				%>
					<td>
						<%
						if(j>=6-i){
							%><a>*</a><%
						}
						 %>
					</td>
				<%
			}
			%> </tr><%
		}
	%>
	</table>
	</br>


	<table border ="1">
	<%
		for(int i=1 ; i<= 3; i++){
			%><tr><%
			for(int j=1; j<=5; j++){
				%>
					<td>
						<%
						if(3-i<j && j<3+i){
							%><a>*</a><%
						}
						 %>
						
					</td>
				<%
			}
			%> </tr><%
		}
	for(int i=4 ; i<= 5; i++){
		%><tr><%
		for(int j=1; j<=5; j++){
			%>
				<td>
					<%
					if(i-3<j && j<9-i){
						%><a>*</a><%
					}
					 %>
					
				</td>
			<%
		}
		%> </tr><%
	}
	%>
	</table>
	</br>
	
	<table border="1">
			<tr>
		<td>ID</td>
		<td>카테고리ID</td>
		<td>이름</td>
		<td>가격</td>
		<td>재고</td>
		<td>설명</td>
		<td>원산지</td>
	</tr>
			
	<%
		try{
		    //step1 load the driver class
		    Class.forName("oracle.jdbc.driver.OracleDriver");
		
		    //step2 create  the connection object
		    Connection con=DriverManager.getConnection(
		    "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");
		
		    //step3 create the statement object
		    Statement stmt=con.createStatement();
		
		    //step4 execute query
		    String query = "SELECT " +
		    "ID, NAME, CATEGORY_ID, PRICE, STOCK, DESCRIPTION, ORIGIN " +
		    "FROM " +
		    "PRODUCT ";
		    ResultSet rs=stmt.executeQuery(query);
			while(rs.next()) {
				%><tr><%
				
				%><td><%=rs.getInt("ID")%></td><%
				%><td><%=rs.getInt("CATEGORY_ID")%></td><%
				%><td><%=rs.getString("NAME")%></td><%
				%><td><%=rs.getInt("PRICE")%></td><%
				%><td><%=rs.getInt("STOCK")%></td><%
				%><td><%=rs.getString("DESCRIPTION")%></td><%
				%><td><%=rs.getString("ORIGIN")%></td><%
																
				
				%><tr><%
			}
			
		    //step5 close the connection object
		    con.close();
		
		    }catch(Exception e){ System.out.println(e);}
	%>
	
	</table>
	
<table border=1>
        <%
        int firstNum=0;
        int secondNum=1;
        int countNum=1;
        while(countNum<=33){
            %><tr><%
            int countRow=0;
            while(countRow<3){
                %><td>
                    <a><%=secondNum %></a><%
                    int temp = secondNum;
                    secondNum += firstNum;
                    firstNum = temp;
                    countRow++;
                    countNum++;
                %></td><%
            }
            %></tr><%

        }
    %></table>
    
     <table border = 1>
        <%
        int first_number = 0;
        int second_number = 1;

        while(second_number < 100){

            for(int i=1;i<=11;i++) {%><tr></tr><%
                for(int j=1;j<=3;j++) {
                    int temp_number = first_number + second_number;
                    first_number = second_number;
                    second_number = temp_number;
                    %><td><%=temp_number %></td><%
                }
            }

        }
        %>
    </table>
    
    </table>
		
		
		
	<table border=1>
		<tr>
			<td>ID</td>
			<td>Category</td>
			<td>Name</td>
			<td>Price</td>
			<td>Stock</td>
			<td>Description</td>
			<td>Origin</td>
		</tr>
	
	<%
try{
    //step1 load the driver class
    Class.forName("oracle.jdbc.driver.OracleDriver");

    //step2 create  the connection object
    Connection con=DriverManager.getConnection(
    "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");

    //step3 create the statement object
    Statement stmt=con.createStatement();

    //step4 execute query
    String query=	"SELECT "+ 
    				"PRODUCT.ID, CATEGORY.NAME as CATEGORY_NAME, PRODUCT.NAME as PRODUCT_NAME, PRODUCT.PRICE, PRODUCT.STOCK, PRODUCT.DESCRIPTION, PRODUCT.ORIGIN " +
    	  			"FROM "+
    				"PRODUCT, CATEGORY " +
    	  			"WHERE " +
    				"PRODUCT.CATEGORY_ID = CATEGORY.ID";

    ResultSet rs=stmt.executeQuery(query);
    while(rs.next()){
    		%><tr><%
		
		%><td><%=rs.getInt("ID")%></td><%
		%><td><%=rs.getString("CATEGORY_NAME")%></td><%
		%><td><%=rs.getString("PRODUCT_NAME")%></td><%
		%><td><%=rs.getInt("PRICE")%></td><%
		%><td><%=rs.getInt("STOCK")%></td><%
		%><td><%=rs.getString("DESCRIPTION")%></td><%
		%><td><%=rs.getString("ORIGIN")%></td><%
														
		%><tr><%

    }	
    System.out.println("!");

    //step5 close the connection object
    con.close();

    }catch(Exception e){ System.out.println(e);}
%>
	</table>
		
		
	<table border=1>
		<tr>
			<td>ID</td>
			<td>PW</td>
			<td>NAME</td>
			<td>EMAIL</td>
			<td>PHONE</td>
			<td>ADDRESS</td>
			<td>AGE</td>
		</tr>
	
	<%
try{
    //step1 load the driver class
    Class.forName("oracle.jdbc.driver.OracleDriver");

    //step2 create  the connection object
    Connection con=DriverManager.getConnection(
    "jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");

    //step3 create the statement object
    Statement stmt=con.createStatement();

    //step4 execute query
    String query=	"SELECT "+ 
    				"ID, PASSWORD, NAME, EMAIL, PHONE, ADDRESS, AGE " +
    	  			"FROM "+
    				"MEMBER";

    ResultSet rs=stmt.executeQuery(query);
    while(rs.next()){
    		%><tr><%
		
		%><td><%=rs.getInt("ID")%></td><%
		%><td><%=rs.getString("PASSWORD")%></td><%
		%><td><%=rs.getString("NAME")%></td><%
		%><td><%=rs.getString("EMAIL")%></td><%
		%><td><%=rs.getString("PHONE")%></td><%
		%><td><%=rs.getString("ADDRESS")%></td><%
		%><td><%=rs.getInt("AGE")%></td><%
														
		%><tr><%

    }	
    System.out.println(rs.getInt("ID")+","+ rs.getInt("CATEGORY_ID")+","+
    		rs.getString("NAME")+","+ rs.getInt("PRICE")+","+rs.getInt("STOCK")+","+
    		rs.getString("DESCRIPTION")+","+ rs.getString("ORIGIN"));

    //step5 close the connection object
    con.close();

    }catch(Exception e){ System.out.println(e);}
%>
	</table>
	
	
	</body>
	</html>