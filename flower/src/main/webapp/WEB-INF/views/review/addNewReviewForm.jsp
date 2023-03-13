<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<%
  request.setCharacterEncoding("UTF-8");
%> 
<!-- 별점 -->
<link href=" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet"> rel="stylesheet">
<link href=" media="all" rel="stylesheet" type="text/css" />
<!-- optionally if you need to use a theme, then include the theme file as mentioned below -->
<link href=" media="all" rel="stylesheet" type="text/css" />
<head>
<meta charset="UTF-8">
<title>글쓰기창</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   function readURL(input) {
      if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        $('#preview').attr('src', e.target.result);
          }
         reader.readAsDataURL(input.files[0]);
      }
  }  
  function backToList(obj){
    obj.action="${contextPath}/review/reviewList.do";
    obj.submit();
  }
  
  var cnt=1;
  function fn_addFile(){
	  $("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
	  cnt++;
  }  
	
  $('#input-id').on('rating:change', function(event, value, caption) {
	    console.log(value);
	    console.log(caption);
	});
  
  $('#input-id').on('rating:hover', function(event, value, caption, target) {
	    console.log(value);
	    console.log(caption);
	    console.log(target);
	});
</script>
 <title>글쓰기창</title>
 <style>
 .newReviewContainer{
 display:flex;
	justify-content: center;
	flex-direction: column;
	align-items: center;
	margin-top:150px;
 }
 .form-control{
 resize:none;
 }
 
 select{
  width: 50px;
  height: 50px;
  background: url('https://freepikpsd.com/media/2019/10/down-arrow-icon-png-7-Transparent-Images.png') calc(100% - 5px) center no-repeat;
  background-size: 20px;
  padding: 5px 30px 5px 10px;
  border-radius: 4px;
  outline: 0 none;
  
  
}
img{
border-radius: 30px;
}

 </style>
</head>
<body>
    <!-- 부트 -->
  </form>
    
    <div class="newReviewContainer">
     <form name="frm_mod_member" method="post"   action="${contextPath}/review/addNewReview.do"   enctype="multipart/form-data">
 	<table class="table table-hover ">
 	<thead>
    <tr>
      <th scope="col"></th>
      <th scope="col"></th>
      <th scope="col"></th>
      <th scope="col"></th>
    
      
    </tr>
  </thead>
 	
 		 <tbody class="table-group-divider">
 		 <p class="fs-3 mb-3 fst-italic"><i class="bi bi-pencil"></i>&nbsp;리뷰 작성</p>
 		 <tr>
 		  <th scope="row">작성자</th>
 		 <td><input name ="member_name" type="text" size="20" maxlength="100"  value="${memberInfo.member_name}" readonly class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"/></td>
 			<input type="hidden" name ="member_id" value="${memberInfo.member_id }">
 		
 		<tr>
 		<th scope="row">상품</th>
 		<td><input type="text" size="67"  maxlength="500" name="goods_id" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"/></td>
 		</tr>
 		
 		<tr>
 		<th scope="row">리뷰 내용</th>
 		<td>
 		<textarea name="review_content" rows="10" cols="65" maxlength="4000"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" resize: none;></textarea>
 		</td>
 		</tr>
 		
 		<tr>
 		<th scope="row">별점</th>
 		<td><select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" name="review_star" >
 			 <option selected>평가</option>
  			 <option value="1">★</option>
  			 <option value="2">★★</option>
  			 <option value="3">★★★</option>
  			 <option value="3">★★★★</option>
  			 <option value="3">★★★★★</option>
</select></td>
 		</tr>
 		
 	
 		
 		<tr>
 		<th scope="row">이미지파일 첨부</th>
 		<td> <input type="file" name="fileName"  onchange="readURL(this);" /></td>
 		
		
 		</tr>
 		
 		<tr>
 		<th scope="row">미리보기</th>
 		<td><img  id="preview" src="#" style=  width=500 height=200 onerror="this.src='${contextPath}/resources/image/noPhoto.jpg';" /></td>
 		</tr>
 		
 		<tr>
 		<th scope="row">추가 이미지</th>
		<td align="left"> <input type="button" value="파일 추가" onClick="fn_addFile()" /></td> 
 		</tr>
 		
 		<tr>
 		<th scope="row"></th>
 		<td id="d_file"></td>
 		</tr>
 		
 		
 		<tr>
 		<th scope="row">완료</th>
 		<td><input type="submit" value="글쓰기" /> <input type=button value="목록보기"onClick="backToList(this.form)" /><td>
 		</tr>
 		
 		 </tbody>
 	</table> <!-- table table-hover -->
 	</form>
	</div>
</body>
</html>