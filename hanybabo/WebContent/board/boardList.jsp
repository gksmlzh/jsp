<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
session.setAttribute("userId", "hanybabo");
/* dao */
Connection connection = null;
Statement st = null;
try {
    Class.forName("com.mysql.jdbc.Driver");
    connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/vcms?useSSL=false" , "vcms", "vcms123!");
    st = connection.createStatement();

    String sql= "SELECT * FROM VCMS_POST limit 0,10";

    ResultSet rs = st.executeQuery(sql);

%>
	<table>
		<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>게시기간</th>
			<th>등록일</th>
			<th>게시여부</th>
		</tr>
		</thead>
		<tbody>
		
		
		<%
	    while (rs.next()) {
	        String POST_SEQUENCE = rs.getString("POST_SEQUENCE");
	        String MENU_ID = rs.getString("MENU_ID");
	        String POST_ID = rs.getString("POST_ID");
	        String POST_TITLE = rs.getString("POST_TITLE");
	        String POST_CONTENT = rs.getString("POST_CONTENT");
	        String POST_START_DAY = rs.getString("POST_START_DAY");
	        String POST_START_TIME = rs.getString("POST_START_TIME");
	        String POST_END_DAY = rs.getString("POST_END_DAY");
	        String POST_END_TIME = rs.getString("POST_END_TIME");
	        String POST_NOTICE_YN = rs.getString("POST_NOTICE_YN");
	        String POST_REGISTER_ID = rs.getString("POST_REGISTER_ID");
	        String POST_REGISTER_DAY = rs.getString("POST_REGISTER_DAY");
	        String POST_TOP_FIX = rs.getString("POST_TOP_FIX");
	        String INSERT_ID = rs.getString("INSERT_ID");
	        String INSERT_DATE = rs.getString("INSERT_DATE");
	        String UPDATE_ID = rs.getString("UPDATE_ID");
	        String UPDATE_DATE = rs.getString("UPDATE_DATE");
	        String VIEW_COUNT = rs.getString("VIEW_COUNT");
	        %>
	        <tr>
	        	<td><a href="<%= request.getContextPath()%>/board/boardDetail.jsp?post_sequence=<%=POST_SEQUENCE%>"><%= POST_SEQUENCE %></a></td>
	        	<td><%= POST_TITLE %></td>
	        	<td><%= POST_START_DAY + POST_END_DAY %></td>
	        	<td><%= POST_REGISTER_DAY %></td>
	        	<td><%= POST_NOTICE_YN %></td>
	        </tr>
	        
	        <%
	    };
	    rs.close();
	    st.close();
	    connection.close();
	} catch (SQLException se1) {
	    se1.printStackTrace();
	} catch (Exception ex) {
	    ex.printStackTrace();
	} finally {
	    try {
	        if (st != null)
	            st.close();
	    } catch (SQLException se2) {
	    }
	    try {
	        if (connection != null)
	            connection.close();
	    } catch (SQLException se) {
	        se.printStackTrace();
	    }
	}    
	        %>
		</tbody>
	</table>
	<input type=button value="글쓰기" OnClick="window.location='boardInsert.jsp'">
</body>
</html>