<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.io.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert student Records</title>
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
	String q = "insert into student values  (?,?,?)";
	pst=con.prepareStatement(q);
	pst.setInt(1, rno);
	pst.setString(2,name);
	pst.setFloat(3, avge);
	
	n = pst.executeUpdate();
	out.print(n+" Rec(s) inserted...");
	out.print("<br><a href=index.html>home</a>");
}
catch(Exception e) {
	
}
	
%>
	
			
			