<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.io.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>
<%
int  rno = Integer.parseInt(request.getParameter("rno"));
String name = request.getParameter("name");
float avge = Float.parseFloat(request.getParameter("avge"));
Connection con;
PreparedStatement pst;
int n;

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "manideep");
	String q = "update student set name=?, avge=? where rno=? ";
	pst=con.prepareStatement(q);
	pst.setString(1, name);
	pst.setFloat(2,avge);
	pst.setInt(3, rno);
	
	n = pst.executeUpdate();
	out.print(n+" Rec(s) Updated...");
	out.print("<br><a href=index.html>home</a>");
}
catch(Exception e) {
	
}

	
%>
	
			
			