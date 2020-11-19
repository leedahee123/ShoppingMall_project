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

<table border = "1">
<tr>
	<td>상품명</td>
	<td>가격</td>
	<td>재고</td>
	<td>설명</td>
	<td>원산지</td>
</tr>
<%
String phone_number = request.getParameter("phone_number"); // != null ? request.getParameter("test") : "";
String email = request.getParameter("email");

try
{  
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	Connection con=DriverManager.getConnection(  
	"jdbc:oracle:thin:@localhost:1521:xe","SMC_USER","SMC_USER");  
	Statement stmt=con.createStatement();  
	String query = "SELECT " +
		    " PRODUCT.NAME, PRICE, STOCK, DESCRIPTION, ORIGIN " +
		    	" FROM " +
		    " PRODUCT ";
	
	if (phone_number != null) {
		query += " AND MEMBER.PHONE like '%" + phone_number + "'";
	}
	if( email != null){
		query += "AND MEMBER.EMAIL like '%" + email + "%'";
	}
	
	%> <%=query%> <%
	
	ResultSet rs=stmt.executeQuery(query);  
	while(rs.next()) {
		%><tr><%
			%><td><%=rs.getString("NAME")%></td><%
			%><td><%=rs.getInt("PRICE")%></td><%
			%><td><%=rs.getInt("STOCK")%></td><%
			%><td><%=rs.getString("DESCRIPTION")%></td><%
			%><td><%=rs.getString("ORIGIN")%></td><%
		%><tr><%
	}
	
	con.commit();
	con.close();  
	  
}
catch(Exception e)
{ 
	System.out.println(e);
}  
%>
</table>

<p>전화번호 뒷 4자리를 입력하여 주세요</p>
<input type="text" id="phone_number">
<p>이메일을 입력하여 주세요</p>
<input type="text" id="email">
<input type="button" onclick="click_search()" value="search">

<script>
	function click_search() {
		const price = document.getElementById("price").value;
		const stock = document.getElementById("stock").value;
	
		redirect_with_get_params(price, stock);
	}
	
	function redirect_with_get_params(phone_number, email) {
		window.location.href = 'parameter_query.jsp?phone_number=' + phone_number + param + '&email' + email;
	}
</script>
</body>
</html>