<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
<%
	request.setCharacterEncoding("UTF-8");
	
	Connection connection = null;
	Statement st = null;
	
	String postSequence = request.getParameter("postSequence");
	 
	
	try {	
		connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/vcms?useSSL=false" , "vcms", "vcms123!");
		
		String sql = "UPDATE VCMS_POST SET POST_TITLE = ?, POST_CONTENT = ?, UPDATE_ID = ?, UPDATE_DATE = ? WHERE POST_SEQUENCE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, postSequence);
		pstmt.setString(2, postContent);
		pstmt.setString(3, updateId);
		pstmt.setString(4, updateDate);
		
		pstmt.execute();
		pstmt.close();
		
		conn.close();
} catch(SQLException se1) {
    se1.printStackTrace();
    }
%>
  <script language=javascript>
   self.window.alert("입력한 글을 수정하였습니다.");
   location.href="boardList.jsp"; 

</script>
