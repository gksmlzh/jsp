<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script language = "javascript"> // 자바 스크립트 시작

function writeCheck()
  {
   var form = document.writeform;
   
   if( !form.name.value )   // form 에 있는 name 값이 없을 때
   {
    alert( "이름을 적어주세요" ); // 경고창 띄움
    form.name.focus();   // form 에 있는 name 위치로 이동
    return;
   }
   
   if( !form.password.value )
   {
    alert( "비밀번호를 적어주세요" );
    form.password.focus();
    return;
   }
   
  if( !form.title.value )
   {
    alert( "제목을 적어주세요" );
    form.title.focus();
    return;
   }
 
  if( !form.memo.value )
   {
    alert( "내용을 적어주세요" );
    form.memo.focus();
    return;
   }
 
  form.submit();
  }
 </script>


<html>
 <head>
 <title>게시판</title>
 </head>
 <body>
<table>
<form name=writeform method=post action="boardInsertOk.jsp">
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr>
      <td>글쓰기</td>
     </tr>
    </table>
   <table>
     <tr>
      <td></td>
      <td align="center">제목</td>
      <td><input name="title" size="50" maxlength="100"></td>
      <td></td>
     </tr>
    <tr>
      <td></td>
      <td align="center">이름</td>
      <td><input name="name" size="50" maxlength="50"></td>
      <td></td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td></td>
      <td align="center">내용</td>
      <td><textarea name="content" cols="50" rows="13"></textarea></td>
      <td></td>
     </tr>
     <tr align="center">
      <td></td>
      <td colspan="2"><input type=button value="등록">
       <input type=button value="취소">
      <td></td>
     </tr>
    </table>
   </td>
  </tr>
 </form>
 </table>
</body> 
</html>