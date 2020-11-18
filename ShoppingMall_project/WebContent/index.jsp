<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% String a = "나는 스트링입니다!!!"; %>
	<a> A 는 무슨 글자일까요?? 정답은 : <%=a %></a>
	
<%
for (int i = 0; i <= 10; i++){
	%><a><%=i %></a><%
}
%>
</body>
</html>