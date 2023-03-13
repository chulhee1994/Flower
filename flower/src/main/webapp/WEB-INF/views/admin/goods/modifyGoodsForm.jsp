<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="euc-kr"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="goods"  value="${goodsMap.goods}"  />
<c:set var="imageFileList"  value="${goodsMap.imageFileList}"  />

<c:choose>
<c:when test='${not empty goods.goods_status}'>
<script>
window.onload=function()
{
	init();
}

function init(){
	var frm_mod_goods=document.frm_mod_goods;
	var h_goods_status=frm_mod_goods.h_goods_status;
	var goods_status=h_goods_status.value;
	var select_goods_status=frm_mod_goods.goods_status;
	 select_goods_status.value=goods_status;
}
</script>
</c:when>
</c:choose>
<script type="text/javascript">
function fn_modify_goods(goods_id, attribute){
	var frm_mod_goods=document.frm_mod_goods;
	var value="";
	if(attribute=='goods_sort'){
		value=frm_mod_goods.goods_sort.value;
	}else if(attribute=='goods_title'){
		value=frm_mod_goods.goods_title.value;
	}else if(attribute=='goods_price'){
		value=frm_mod_goods.goods_price.value;
	}else if(attribute=='goods_sales_price'){
		value=frm_mod_goods.goods_sales_price.value;
	}else if(attribute=='goods_point'){
		value=frm_mod_goods.goods_point.value;
	}else if(attribute=='goods_published_date'){
		value=frm_mod_goods.goods_published_date.value;
	}else if(attribute=='goods_delivery_price'){
		value=frm_mod_goods.goods_delivery_price.value;
	}else if(attribute=='goods_status'){
		value=frm_mod_goods.goods_status.value;
	}else if(attribute=='goods_intro'){
		value=frm_mod_goods.goods_intro.value;
	}

	$.ajax({
		type : "post",
		async : false, //false�� ��� ��������� ó���Ѵ�.
		url : "${contextPath}/admin/goods/modifyGoodsInfo.do",
		data : {
			goods_id:goods_id,
			attribute:attribute,
			value:value
		},
		success : function(data, textStatus) {
			if(data.trim()=='mod_success'){
				alert("��ǰ ������ �����߽��ϴ�.");
			}else if(data.trim()=='failed'){
				alert("�ٽ� �õ��� �ּ���.");	
			}
			
		},
		error : function(data, textStatus) {
			alert("������ �߻��߽��ϴ�."+data);
		},
		complete : function(data, textStatus) {
			//alert("�۾����Ϸ� �߽��ϴ�");
			
		}
	}); //end ajax	
}



  function readURL(input,preview) {
	//  alert(preview);
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#'+preview).attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
  }  

  var cnt =1;
  function fn_addFile(){
	
	  $("#d_file").append("<img  id='previewImage"+cnt+"'   width=200 height=200  />");
	  $("#d_file").append("<br>"+"<input  type='file' name='detail_image"+cnt+"' id='detail_image"+cnt+"' class='form-control w-75'  onchange=readURL(this,'previewImage"+cnt+"') />");
	  $("#d_file").append("<input  type='button' value='�߰�' class='btn btn-outline-dark btn-sm'  onClick=addNewImageFile('detail_image"+cnt+"','${imageFileList[0].goods_id}','detail_image')  />"+"<br><br>");
	  cnt++;
  }
  
  function modifyImageFile(fileId,goods_id, image_id,fileType){
    // alert(fileId);
	  var form = $('#FILE_FORM')[0];
      var formData = new FormData(form);
      formData.append("fileName", $('#'+fileId)[0].files[0]);
      formData.append("goods_id", goods_id);
      formData.append("image_id", image_id);
      formData.append("fileType", fileType);
      
      $.ajax({
        url: '${contextPath}/admin/goods/modifyGoodsImageInfo.do',
        processData: false,
        contentType: false,
        data: formData,
        type: 'POST',
	      success: function(result){
	         alert("�̹����� �����߽��ϴ�!");
	       }
      });
  }
  
  function addNewImageFile(fileId,goods_id, fileType){
	   //  alert(fileId);
		  var form = $('#FILE_FORM')[0];
	      var formData = new FormData(form);
	      formData.append("uploadFile", $('#'+fileId)[0].files[0]);
	      formData.append("goods_id", goods_id);
	      formData.append("fileType", fileType);
	      
	      $.ajax({
	          url: '${contextPath}/admin/goods/addNewGoodsImage.do',
	                  processData: false,
	                  contentType: false,
	                  data: formData,
	                  type: 'post',
	                  success: function(result){
	                      alert("�̹����� �����߽��ϴ�!");
	                  }
	          });
	  }
  
  function deleteImageFile(goods_id,image_id,imageFileName,trId){
	var tr = document.getElementById(trId);

      	$.ajax({
    		type : "post",
    		async : true, //false�� ��� ��������� ó���Ѵ�.
    		url : "${contextPath}/admin/goods/removeGoodsImage.do",
    		data: {goods_id:goods_id,
     	         image_id:image_id,
     	         imageFileName:imageFileName},
    		success : function(data, textStatus) {
    			alert("�̹����� �����߽��ϴ�!!");
                tr.style.display = 'none';
    		},
    		error : function(data, textStatus) {
    			alert("������ �߻��߽��ϴ�."+textStatus);
    		},
    		complete : function(data, textStatus) {
    			//alert("�۾����Ϸ� �߽��ϴ�");
    			
    		}
    	}); //end ajax	
  }
</script>
<style>
.modifyContainer{
	display: flex;
	justify-content:center;
	flex-direction: column;
	align-items: center;
	margin-top:150px;
	margin-left: auto;
	margin-right:auto;
}

</style>
</HEAD>
<BODY>
<div class="modifyContainer">
<form  name="frm_mod_goods"  method=post >
 <p class="fs-3 mb-5 mt-5 fst-italic ">��ǰ��������</p>
	<!-- ���� ��� ���� �� -->
			<div class="tabs_container mt-5 ">
			<ul class="tabs pb-auto">
			<li style="list-style:none; float:left; margin: 0px 5px ;" ><a class="btn btn-outline-dark btn-lg" 
			href="#tab1" role="button"><i class="bi bi-flower3"></i>&nbsp;��ǰ����&nbsp;&nbsp;</a></li>&nbsp;
			
			<li style="list-style:none; float:left; margin: 0px 5px ;"><a class="btn btn-outline-dark btn-lg" 
			href="#tab2" role="button"><i class="bi bi-flower3"></i>&nbsp;�ɸ�&nbsp;&nbsp;</a></li>&nbsp;
			
			<li style="list-style:none; float:left; margin: 0px 5px ;"><a class="btn btn-outline-dark btn-lg" 
			href="#tab3" role="button"><i class="bi bi-flower3"></i>&nbsp;��ǰ�̹���&nbsp;&nbsp;</a></li>		
			</ul>
			</div>
		
		<DIV class="tab_container">
			<DIV class="tab_content" id="tab1">
			<table class="table table-hover">
			<thead>
		    <tr>
		      <th scope="col"></th>
		      
		    </tr>
		     </thead>
		        <tbody class="table-group-divider">
		    	<tr>
			      <th scope="row">�� ����</th>
			      <td> 
			      <input type="text"  name="goods_sort" class="form-control" 
			      aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" 
			      value="${goods.goods_sort }">
			      </td>
			   		<td>
			   		 <input type="button" class="btn btn-outline-dark btn-sm " value="���� �ݿ�" onClick="fn_modify_goods('${goods.goods_id }','goods_sort')">
			   		
			   		 
			   		</td>
			    </tr>
				
			
			<tr>
				<th scope="row">�� �̸�</th>
			
				<td>		 
			      <input type="text"  name="goods_title" class="form-control" 
			      aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" 
			      value="${goods.goods_title}">
				</td>

				<td>
				 <input type="button" class="btn btn-outline-dark btn-sm " value="���� �ݿ�" onClick="fn_modify_goods('${goods.goods_id }','goods_title')">
			
				</td>
				
			</tr>
			
		
			<tr>
		    <th scope="row">����</th>
		    <td><input type="text"  name="goods_price" class="form-control"  value="${goods.goods_price }"
		    aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
		    </td>	
		    
		    <td>	 
		    	 <input type="button" class="btn btn-outline-dark btn-sm " value="���� �ݿ�" onClick="fn_modify_goods('${goods.goods_id }','goods_price')">
		   
		    </td>
		    </tr>
			
			

				<tr>
		    	<th scope="row">�ǸŰ�</th>
		    	<td> <input type="text"  name="goods_sales_price" class="form-control"  value="${goods.goods_sales_price }"
		    	aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
		    	</td>
		    	
		    	<td>
		    	<input type="button" class="btn btn-outline-dark btn-sm " value="���� �ݿ�" onClick="fn_modify_goods('${goods.goods_id }','goods_sales_price')">
		 
		    	</td>
		    	
			   	 
		    	</tr>
		
				
		    	<tr>
		    	<th scope="row">��������Ʈ</th>
		    	<td> <input type="text"  name="goods_point" class="form-control"  value="${goods.goods_point }" 
		    	aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
		    	</td>		    
		    	
				<td>
				<input type="button" class="btn btn-outline-dark btn-sm " value="���� �ݿ�" onClick="fn_modify_goods('${goods.goods_id }','goods_point')">
		
				</td>
		    	
		    	</tr>
	

		  	 	<tr>
		    	<th scope="row">������</th>
		    	<td><input type="text"  name="goods_published_date" class="form-control" value="${goods.goods_published_date }"
		    	aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
		    	</td>
		    	<td>
		    		<input type="button" class="btn btn-outline-dark btn-sm " value="���� �ݿ�" onClick="fn_modify_goods('${goods.goods_id }','goods_published_date')">
		
				
				</td>

		    	</tr>
		    	
			  	<tr>
		    	<th scope="row">��ۺ�</th>	
		    	<td> <input type="text"  name="goods_delivery_price" class="form-control"  value="${goods.goods_delivery_price }"
		    	aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
		    	</td>
				<td>
				<input type="button" class="btn btn-outline-dark btn-sm " value="���� �ݿ�" onClick="fn_modify_goods('${goods.goods_id }','goods_delivery_price')">
				 
				</td>
		    	</tr>
		
			

			<tr>
		    	<th scope="row">��ǰ����</th>
		    	<td>
		    	<select name="goods_status" class="form-select">
				  <option value="bestseller"  >BEST</option>
				  <option value="steadyseller" >STEADY</option>
				  <option value="newbook" selected >NEW</option>
				</select>
				<input  type="hidden" name="h_goods_status" value="${goods.goods_status }"/>
		    	</td>
		    	<td>
		    			<input type="button" class="btn btn-outline-dark btn-sm " value="���� �ݿ�" onClick="fn_modify_goods('${goods.goods_id }','goods_status')">
		
		    	</td>
		    	</tr>
			
		
				</tbody>
				</table>	
			</DIV>
		
			<DIV class="tab_content" id="tab2">
			  
			<table class="table table-hover">
			<thead>
		    <tr>
		      <th scope="col"></th>
		
		    </tr>
		     </thead>
		    <tbody class="table-group-divider">
		    	<tr>
			      <th scope="row">�ɸ�</th>
			      <td>
			      <div class="form-floating">
				  <textarea class="form-control" placeholder="�� ���� �ۼ��� �ּ���" name="goods_intro" id="floatingTextarea2" style="height: 200px; width: 400px;">${goods.goods_intro }</textarea>
				  <label for="floatingTextarea2">�ɸ��� �ۼ��� �ּ���</label>
				 </div>
			      </td>
			  	 <td> 	
			  	  <input  type="button" value="�����ݿ�"   class="btn btn-outline-dark btn-sm "
			  	  onClick="fn_modify_goods('${goods.goods_id }','goods_intro')"/>
			  	  </td>
			    </tr>
			</tbody>
			</table>
			</div>
			
	
			<DIV class="tab_content" id="tab3">
			  <form id="FILE_FORM" method="post" enctype="multipart/form-data"  >
				<table class="table table-hover">
			<thead>
		    <tr>
		      <th scope="col">
		        
		      </th>
		  
		    </tr>
		     </thead>
		     
		    <tbody class="table-group-divider">
		    	<tr>
		    	 <c:forEach var="item" items="${imageFileList }"  varStatus="itemNum">
				 <c:choose>
				<c:when test="${item.fileType=='main_image' }">
			      <th scope="row">�����̹���</th>
			      	
			      <td> 
			      <input  type='file' name='main_image' id='main_image' class='form-control ' onchange="readURL(this,'preview${itemNum.count}');"/>
			     	<input type="hidden"  name="image_id" value="${item.image_id}"  />
			     </td>
			     	
			    
			    <td>
				 <img  id="preview${itemNum.count }"   
				 width=200 height=200 src="${contextPath}/download.do?goods_id=${item.goods_id}&fileName=${item.fileName}" />
			   </td>
					
				<td>
				<input type="button" class="btn btn-outline-dark btn-sm " value="����" 
			 	   onClick="modifyImageFile('main_image','${item.goods_id}','${item.image_id}','${item.fileType}')">
			
			   </td> 	   
			    </tr>
			    
			 </c:when>
			<c:otherwise>
			<tr>
			<th scope="row" id="${itemNum.count-1}">�� �̹���${itemNum.count-1 }</th>
			
			 <td>
			 	   <input  type='file' name='detail_image' id='detail_image' class='form-control ' 
			 	      onchange="readURL(this,'preview${itemNum.count}');"/>
		
			    <input type="hidden"  name="image_id" value="${item.image_id }"  />
			 </td>
			    <td>
				 <img  id="preview${itemNum.count }"   width=200 height=200 src="${contextPath}/download.do?goods_id=${item.goods_id}&fileName=${item.fileName}">
			   </td>
			   
			 <td>
			 	  <input type="button" class="btn btn-outline-dark btn-sm " value="����" 
			 	  onClick="modifyImageFile('detail_image','${item.goods_id}','${item.image_id}','${item.fileType}')">
			 	  	  <input type="button" class="btn btn-outline-dark btn-sm " value="����"
			 	  	   onClick="deleteImageFile('${item.goods_id}','${item.image_id}','${item.fileName}','${itemNum.count-1}')">
			
			   </td> 
			</tr>
			</c:otherwise>
		  </c:choose>		
		</c:forEach>
		<tr>
		<th scope="row"></th>
		<td>
		 <div id="d_file"></div>
		  <input type="button" class="btn btn-outline-dark btn-sm " value="���� �߰�" onClick="fn_addFile()">
		 </td>
		 <td></td>
		 <td></td>
		
		</tr>
			</tbody>
			
			</table>
			</form>
			</div>
			
		</DIV>
		</form>
		</div>
		
</BODY>