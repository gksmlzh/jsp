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
		
		String sql = "DELETE FROM VCMS_POST WHERE POST_SEQUENCE = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, postSequence);
		
		pstmt.execute();
		pstmt.close();
		
		conn.close();
} catch(SQLException se1) {
    se1.printStackTrace();
    }
%>
  <script language=javascript>
   self.window.alert("입력한 글을 삭제하였습니다.");
   location.href="boardList.jsp"; 

</script>
