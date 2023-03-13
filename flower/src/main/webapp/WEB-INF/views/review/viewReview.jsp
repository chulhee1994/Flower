<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%-- 
<c:set var="article"  value="${articleMap.article}"  />
<c:set var="imageFileList"  value="${articleMap.imageFileList}"  />

 --%>
<%
  request.setCharacterEncoding("UTF-8");
%> 

<head>
   <meta charset="UTF-8">
   <title>글보기</title>
   <style>
     #tr_file_upload{
       display:none;
     }
     #tr_btn_modify{
       display:none;
     }
   
   </style>
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
   <script type="text/javascript" >
     function backToList(obj){
	    obj.action="${contextPath}/review/reviewList.do";
	    obj.submit();
     }
 
	 function fn_enable(obj){
		 document.getElementById("i_content").disabled=false;
		 document.getElementById("i_imageFileName").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block";
		 document.getElementById("cnt").style.display="block";
		 document.getElementById("tr_file_upload").style.display="block";
		 document.getElementById("tr_btn").style.display="none";
		 
	 }
	 
	 function fn_modify_article(obj){
		 obj.action="${contextPath}/review/modReview.do";
		 obj.submit();
	 }
	 
	 function fn_remove_review(url,review_no){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var articleNOInput = document.createElement("input");
	     articleNOInput.setAttribute("type","hidden");
	     articleNOInput.setAttribute("name","reviewNO");
	     articleNOInput.setAttribute("value", review_no);
		 
	     form.appendChild(articleNOInput);
	     document.body.appendChild(form);
	     form.submit();
	 
	 }
	 
	 function fn_reply_form(url, parentNO){
		 var form = document.createElement("form");
		 form.setAttribute("method", "get");
		 form.setAttribute("action", url);
	     var parentNOInput = document.createElement("input");
	     parentNOInput.setAttribute("type","hidden");
	     parentNOInput.setAttribute("name","parentNO");
	     parentNOInput.setAttribute("value", parentNO);
		 
	     form.appendChild(parentNOInput);
	     document.body.appendChild(form);
		 form.submit();
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
 </script>
 <style>
.viewreviewcontainer{
	margin-top:150px;
	margin-bottom: 150px;
	display: flex;
    justify-content: center;
    flex-direction: column;
    align-items: center;
}
textarea{
resize: none;
}
select{
height:30px;
}
 </style>
</head>
<body>

  <div class="viewreviewcontainer">
  <p class="fs-3 mb-3 fst-italic"><i class="bi bi-flower1"></i>상세 리뷰</p>
  <form name="frmArticle" method="post"  action="${contextPath}"  enctype="multipart/form-data">
  <table  border=0  align="center" class="table table-hover ">
  	
  	
  	<thead>
    <tr>
      <th scope="col"></th>
      <th scope="col"></th>
      <th scope="col"></th>
      <th scope="col"></th>
    </tr>
  </thead>
   		 <tbody class="table-group-divider">
   
   
   
   <tr>
   <th scope="row">이름</th>   
   <td><input type="text" value="${review.member_name}" class="form-control" disabled aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"></td>	   	
   <td><input type="hidden" name="review_no" value="${review.review_no}"  /></td>
   <td><input type="hidden" name="review_star" value="${review.review_star}"></td>
  </tr>
  
  <tr>
  <th scope="row">아이디</th>
  <td><input type=text value="${review.member_id}" name="writer"  disabled class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" /></td>
  </tr>
  
  <tr>
  <th scope="row">리뷰</th>
  <td><textarea rows="15" cols="100"  class="form-control"  name="review_content"  id="i_content" disabled >${review.review_content}</textarea>
  </tr>
  
  <tr>
  <th>조회수</th>
   <td><input type ="text" name="cnt" id="cnt"  class="form-control" disabled value="${review.cnt}" ></td>
  </tr>
  
  
 <c:if test="${not empty imageFileList && imageFileList!='null' }">
	  <c:forEach var="item" items="${imageFileList}" varStatus="status" >
		    <tr>
		    <th scope="row">이미지${status.count}</th>
			    <td width="150" align="center" bgcolor="#FF9933"  rowspan="2">

			   </td>
			   <td>
			     <input  type= "hidden"   name="fileName" value="${item.fileName }" />
			    <img src="${contextPath}/download.do?goods_id=${review.goods_id}&fileName=${item.fileName}" id="preview"  /><br>
			   </td>   
			  </tr>  
			  <tr>
			    <td>
			       <input  type="file"  name="imageFileName " id="i_imageFileName"   disabled   onchange="readURL(this);"   />
			    </td>
			 </tr>
		</c:forEach>
 </c:if>
 	 
  <c:choose> 
	  <c:when test="${not empty review.fileName && review.fileName!='null' }">
	   	<tr>
	   	<th scope="row">이미지</th>
		   <td>
		     <input  type= "hidden"   name="fileName" value="${review.fileName}" />
		    <img src="${contextPath}/download.do?goods_id=${review.goods_id}&fileName=${review.fileName}" id="preview"  /><br>
		   </td>   
		  </tr>  
		  <tr>
		  <th scope="row">추가</th>
		    <td>
		       <input  type="file"  name="imageFileName " id="i_imageFileName"   disabled   onchange="readURL(this);"   />
		    </td>
		  </tr> 
		 </c:when>
		 <c:otherwise>
		    <tr  id="tr_file_upload" >
				    <td width="150" align="center" bgcolor="#FF9933"  rowspan="2">
				      이미지
				    </td>
				    <td>
				      <input  type= "hidden"   name="originalFileName" value="${review.fileName }" />
				    </td>
			    </tr>
			    <tr>
				    <td>
				       <img id="preview"  /><br>
				       <input  type="file"  name="imageFileName " id="i_imageFileName"   disabled   onchange="readURL(this);"   />
				    </td>
			  </tr>
		 </c:otherwise>
	 </c:choose>
	 
  <tr>
  <th scope="row">리뷰 날짜</th>
	   <td>
	    <input type=text class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="<fmt:formatDate value="${review.review_date}" />" disabled />
	   </td>   
  </tr>
  <tr   id="tr_btn_modify"  align="center"  >
	   <td colspan="2"   >
	       <input type=button class="btn btn-outline-secondary btn-md col-2" value="수정반영하기"   onClick="fn_modify_article(frmArticle)"  >
           <input type=button class="btn btn-outline-secondary btn-md col-2" value="취소"  onClick="backToList(frmArticle)">
	   </td>   
  </tr>
  <tr  id="tr_btn">
   <td colspan="2" align="center">
       <c:if test="${memberInfo.member_id == review.member_id }">
	   	&nbsp;&nbsp;  <input type=button class="btn btn-outline-secondary btn-md col-2" value="수정하기" onClick="fn_enable(this.form)">
	    &nbsp;&nbsp; <input type=button class="btn btn-outline-secondary btn-md col-2" value="삭제하기" onClick="fn_remove_review('${contextPath}/review/removeReview.do', ${review.review_no})">
	    </c:if>
	    &nbsp;&nbsp;<input type=button class="btn btn-outline-secondary btn-md col-2" value="목록보기"  onClick="backToList(this.form)">
   </td>
  </tr>
   </tbody>
 </table>
 </form>
 
 <div id="reply">
 
 </div>
 
 </div>
</body>
</html>