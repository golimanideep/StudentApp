<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Read Student Records</title>
</head>
<body>
    <h2>Student Records</h2>

    <%
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college", "root", "manideep");
            String q = "SELECT * FROM student";  
            stmt = con.createStatement();          
            rs = stmt.executeQuery(q);
            if (rs != null) {
                out.print("<table border='1'>");
                out.print("<tr><th>RNO</th><th>Name</th><th>Average</th></tr>");
                
                while (rs.next()) {
                    int rno = rs.getInt("rno");
                    String name = rs.getString("name");
                    float avge = rs.getFloat("avge");

                    out.print("<tr>");
                    out.print("<td>" + rno + "</td>");
                    out.print("<td>" + name + "</td>");
                    out.print("<td>" + avge + "</td>");
                    out.print("</tr>");
                }

                out.print("</table>");
            	out.print("<br><a href=index.html>home</a>");
            } else {
                out.print("No records found.");
            }
        } catch (Exception e) {
            out.print("Error: " + e.getMessage());
        } 
    %>
</body>
</html>
