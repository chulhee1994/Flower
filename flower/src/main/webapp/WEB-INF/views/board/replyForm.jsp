<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%> 

<head>
<meta charset="UTF-8">
 <script src="//code.jquery.com/jquery-3.3.1.js"></script> 
<script type="text/javascript">

 function backToList(obj){
 obj.action="${contextPath}/board/listArticles.do";
 obj.submit();
 }
  function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
              $('#preview').attr('src', e.target.result);
          }
          reader.readAsDataURL(input.files[0]);
      }
  }  
  var cnt=1;
  function fn_addFile(){
	  $("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
	  cnt++;
  }  
  
</script> 
<style>
.textbox{
    height: 201px;
    width: 535px;
    resize : none;
    }

</style>
<title>답글쓰기 페이지</title>
</head>

<body>
 <h1>답글쓰기</h1>
  <form name="frmReply" method="post"  action="${contextPath}/board/addReply.do" enctype="multipart/form-data">
    <table>
    
    <tr>
			<td align="right"> 작성자:</td>
			<td align="left"><input  type="text" size="20" maxlength="100"  name="writer" value="${memberInfo.member_name}" readonly></input></td>
		</tr>
		<tr>
			<td align="right">제목:&nbsp;  </td>
			<td><input type="text" size="67"  maxlength="500" name="title"> </input></td>
		</tr>
		<tr>
			<td align="right" valign="top"><br>내용:&nbsp;</td>
			<td align="left"><textarea name="content" rows="10" cols="65" maxlength="4000" class ="textbox"> </textarea> </td>
		</tr>

		<tr>
			<td align="right"> </td>
			<td>
				<input type=submit value="답글쓰기" />
				<input type=button value="취소"onClick="backToList(this.form)" />
				
			</td>
		</tr>
    
    </table>
  
  </form>
</body>
</html> --%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<%
  request.setCharacterEncoding("UTF-8");
%> 

<head>
<meta charset="UTF-8">
<title>글쓰기창</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

 function backToList(obj){
 obj.action="${contextPath}/board/listArticles.do";
 obj.submit();
 }
  function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
              $('#preview').attr('src', e.target.result);
          }
          reader.readAsDataURL(input.files[0]);
      }
  }  
  var cnt=1;
  function fn_addFile(){
	  $("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
	  cnt++;
  }  
  
</script> 
<style>
.container{
  display: flex;
	justify-content:center;
	flex-direction: column;
	align-items: center;
	margin-top:150px;
	margin-left: auto;
	margin-right:auto;
	width : 100%;
	
}
</style>
 <title>답글창</title>
</head>
<body>

<div class="container">
	<p class="fs-2 fst-italic"><i class="bi bi-pencil-square"></i>&nbsp;답글쓰기</p>
  <form name="articleForm" method="post" action="${contextPath}/board/addNewArticle.do"   enctype="multipart/form-data">
     <hr class="border border border-2 opacity-50 ">
    <table class="table-borderless">
    <thead class="table">
    <tr>
    <th scope="col"></th>
    </tr>
    </thead>
      		<tr >
			<th scope="row">작성자</th>
			
			<td>
			<input type="text"   class="form-control mt-3" aria-label="Sizing example input"
    		 aria-describedby="inputGroup-sizing-sm" value="${memberInfo.member_name }"  disabled  style="width:200px; background:white; ">
			</td>
			
			</tr>
			
	     	<tr>
	     	<th scope="row">글제목</th>
			<td>
			<input type="text"   name="title" class="form-control mt-3" aria-label="Sizing example input"
    		 aria-describedby="inputGroup-sizing-sm" >
    		 </td>
			 </tr>
			 
	 		<tr>
	 			<th scope="row">글내용</th>
				<td>
				 <textarea class="form-control mt-3"  name="content"  
		  		  style="height: 300px; width: 600px;">${article.content}</textarea>
				</td>
   			</tr>

	    <tr>
	      <th scope="row"></th>
	    	<td>
	    	<div class="wrap mt-3">
	    	 <input type="submit" class="btn btn-outline-secondary  btn-sm " value="답글쓰기" >
	      	<input type="button" class="btn btn-outline-secondary btn-sm " value="목록보기" onClick="backToList(this.form)">
	      </div>
	      </td>
    	 </tr>
  
  	</tbody>
    </table>
  </form>
  </div>
</body>