<%-- 
    Document   : delete
    Created on : 15-Aug-2020, 11:25:02 PM
    Author     : bikumalla
--%>

<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%!String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/artist";%>
<%!String user = "root";%>
<%!String pwd = "";%>
<%
String id = request.getParameter("painting_id");
PrintWriter outs=response.getWriter();
outs.print(id);
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int id1 = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,pwd);
String sql="Delete from artist where painting_id=?";
ps = con.prepareStatement(sql);
ps.setInt(1, id1);
int i = ps.executeUpdate();
if(i > 0)
{
outs.print("Record Deleted Successfully");
response.sendRedirect("admin.jsp");
}
else
{
outs.print("There is a problem in deleting Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
outs.println(sql);
}
}
%> 