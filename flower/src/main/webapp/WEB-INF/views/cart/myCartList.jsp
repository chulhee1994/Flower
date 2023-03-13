<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="myCartList"  value="${cartMap.myCartList}"  />
<c:set var="myGoodsList"  value="${cartMap.myGoodsList}"  />

<c:set  var="totalGoodsNum" value="0" />  <!--주문 개수 -->
<c:set  var="totalDeliveryPrice" value="0" /> <!-- 총 배송비 --> 
<c:set  var="totalDiscountedPrice" value="0" /> <!-- 총 할인금액 -->
<head>
<style>

.myCartContainer{

display:flex;
justify-content: center;
flex-direction: column;
align-items: center;
margin-top:150px;

}
.inputQty{
padding-top: 5px;
margin-bottom: 3px;
}
.cartTitleFont{
	font-family: 'Gowun Batang', serif;
}

</style>
<script type="text/javascript">
var totalqty=0;
function calcGoodsPrice(bookPrice,obj){
	var totalPrice,final_total_price,totalNum;
	var goods_qty=document.getElementById("select_goods_qty");
	//alert("총 상품금액"+goods_qty.value);
	var p_totalNum=document.getElementById("p_totalNum");
	var p_totalPrice=document.getElementById("p_totalPrice");
	var p_final_totalPrice=document.getElementById("p_final_totalPrice");
	var h_totalNum=document.getElementById("h_totalNum");
	var h_totalPrice=document.getElementById("h_totalPrice");
	var h_totalDelivery=document.getElementById("h_totalDelivery");
	var h_final_total_price=document.getElementById("h_final_totalPrice");
	if(obj.checked==true){
	//	alert("체크 했음")
		
		totalNum=Number(h_totalNum.value)+Number(goods_qty.value);
		//alert("totalNum:"+totalNum);
		totalPrice=Number(h_totalPrice.value)+Number(goods_qty.value*bookPrice);
		//alert("totalPrice:"+totalPrice);
		final_total_price=totalPrice+Number(h_totalDelivery.value);
		//alert("final_total_price:"+final_total_price);

	}else{
	//	alert("h_totalNum.value:"+h_totalNum.value);
		totalNum=Number(h_totalNum.value)-Number(goods_qty.value);
	//	alert("totalNum:"+ totalNum);
		totalPrice=Number(h_totalPrice.value)-Number(goods_qty.value)*bookPrice;
	//	alert("totalPrice="+totalPrice);
		final_total_price=totalPrice-Number(h_totalDelivery.value);
	//	alert("final_total_price:"+final_total_price);
	}
	
	h_totalNum.value=totalNum;
	
	h_totalPrice.value=totalPrice;
	h_final_total_price.value=final_total_price;
	
	p_totalNum.innerHTML=totalNum;
	p_totalPrice.innerHTML=totalPrice;
	p_final_totalPrice.innerHTML=final_total_price;
}

function modify_cart_qty(goods_id,bookPrice,index){
	console.log(index);
	console.log(goods_id);
	/* var cartPrice = document.getElementById("price"+index); */
	/* del("price"+index); */
	
	//alert(index);
   var length=document.frm_order_all_cart.cart_goods_qty.length;
   var _cart_goods_qty=0;
	if(length>1){ //카트에 제품이 한개인 경우와 여러개인 경우 나누어서 처리한다.
		_cart_goods_qty=document.frm_order_all_cart.cart_goods_qty[index].value;		
	}else{
		_cart_goods_qty=document.frm_order_all_cart.cart_goods_qty.value;
	}
		
	var cart_goods_qty=Number(_cart_goods_qty);
	//alert("cart_goods_qty:"+cart_goods_qty);
	console.log(cart_goods_qty);
	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/cart/modifyCartQty.do",
		data : {
			goods_id:goods_id,
			cart_goods_qty:cart_goods_qty
		},
		
		success : function(data, textStatus) {
			/* alert(data); */
			var jsonInfo = JSON.parse(data);
			var result = jsonInfo.modify_success;
			if(result.trim()=='modify_success'){
				alert("수량을 변경했습니다!!");
				del('p_totalGoodsNum');
				del('h_totalGoodsNum');
				/* del('p_final_totalPrice');
				del('h_final_totalPrice');  상품금액 변경은 다음에 ㅎ
				방법1. 변수로 먼저 상품 가격 getelementbyid로 각각 해당하는 변수들 가져온후 delete 함수 만들어서 요소들 지운다음
				innerHtml해서 db에서 가져온 값을 각각 for문으로 넣기==> 단점.개 쌍노가다, 결과가 잘 나올지 안나올지도 모름
				
				방법2. 상품 총 가격만 넣고 개별 상품 합계는 화면상 지워버리기 ==>화면이 허접해짐 */
				
				totalqty=jsonInfo.totalQty;
				var html ='';
				/* var html2 =''; */
				html += "<p id='p_totalGoodsNum' class='fs-3'>"+totalqty+"개 </p>";
				html += "<input id='h_totalGoodsNum'type='hidden' value='"+totalqty+"'/>";
				var listView = document.getElementById("newTOtalNum");
				/* var listView2 = document.getElementById("newTotalPrice"); */
			    listView.innerHTML = html;
			    /* listView2.innerHTML = html2; */
			   /*  console.log(document.getElementById("h_totalGoodsNum").value); */
				
				
			   
				
			}else{
				alert("다시 시도해 주세요!!");	
			}
			
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다."+data);
		},
		complete : function(data, textStatus) {
			//alert("작업을완료 했습니다");
			
		}
	
		
	}); //end ajax	
	

	location.href="${contextPath}/cart/myCartList.do";
	
}


function del(elementId){
	   var element = document.getElementById(elementId);
	   if(element){
		  element.remove();
	   }
	}

function delete_cart_goods(cart_id){
	var cart_id=Number(cart_id);
	var formObj=document.createElement("form");
	var i_cart = document.createElement("input");
	i_cart.name="cart_id";
	i_cart.value=cart_id;
	
	formObj.appendChild(i_cart);
    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="${contextPath}/cart/removeCartGoods.do";
    formObj.submit();
}

function fn_order_each_goods(goods_id,goods_title,goods_sales_price,fileName,goods_delivery_price,point){
	var total_price,final_total_price,_goods_qty;
	var cart_goods_qty=document.getElementById("cart_goods_qty");
	
	_order_goods_qty=cart_goods_qty.value; //장바구니에 담긴 개수 만큼 주문한다.
	var formObj=document.createElement("form");
	var i_goods_id = document.createElement("input"); 
    var i_goods_title = document.createElement("input");
    var i_goods_sales_price=document.createElement("input");
    var i_fileName=document.createElement("input");
    var i_order_goods_qty=document.createElement("input");
    var i_order_goods_delivery_price =document.createElement("input");
    var i_order_goods_point=document.createElement("input");
    
    
    i_goods_id.name="goods_id";
    i_goods_title.name="goods_title";
    i_goods_sales_price.name="goods_sales_price";
    i_fileName.name="goods_fileName";
    i_order_goods_qty.name="order_goods_qty";
    i_order_goods_delivery_price.name="goods_delivery_price";
    i_order_goods_point.name="goods_point"
    
    
    i_goods_id.value=goods_id;
    i_order_goods_qty.value=_order_goods_qty;
    i_goods_title.value=goods_title;
    i_goods_sales_price.value=goods_sales_price;
    i_fileName.value=fileName;
    i_order_goods_delivery_price.value = goods_delivery_price;
    i_order_goods_point.value = point;
    
    formObj.appendChild(i_goods_id);
    formObj.appendChild(i_goods_title);
    formObj.appendChild(i_goods_sales_price);
    formObj.appendChild(i_fileName);
    formObj.appendChild(i_order_goods_qty);
    formObj.appendChild(i_order_goods_delivery_price);
    formObj.appendChild(i_order_goods_point);

    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="${contextPath}/order/orderEachGoods.do";
    formObj.submit();
}

function fn_order_all_cart_goods(){
//	alert("모두 주문하기");
	var order_goods_qty;
	var order_goods_id;
	var objForm=document.frm_order_all_cart;
	var cart_goods_qty=objForm.cart_goods_qty;
	var h_order_each_goods_qty=objForm.h_order_each_goods_qty;
	var checked_goods=objForm.checked_goods;
	var goods_delivery_price;
	var length=checked_goods.length;
	
	
	
	//alert(length);
	if(length>1){
		for(var i=0; i<length;i++){
			if(checked_goods[i].checked==true){
				order_goods_id=checked_goods[i].value;
				order_goods_qty=cart_goods_qty[i].value;
				cart_goods_qty[i].value="";
				cart_goods_qty[i].value=order_goods_id+":"+order_goods_qty;
				goods_delivery_price=$('#deliverPrice'+[i]).val();
				
				//alert(select_goods_qty[i].value);
				console.log(cart_goods_qty[i].value);
			}
		}	
	}else{
		order_goods_id=checked_goods.value;
		order_goods_qty=cart_goods_qty.value;
		cart_goods_qty.value=order_goods_id+":"+order_goods_qty;
		goods_delivery_price=$('#deliverPrice0').val();
		
		//alert(select_goods_qty.value);
	}
		
	
 	objForm.method="post";
 	objForm.action="${contextPath}/order/orderAllCartGoods.do";
	objForm.submit();
}

</script>
</head>
<body>



<div class="myCartContainer">
	
	<div class="tableContainer w-75 ">
	<p class="fs-3 mb-3 fst-italic"><i class="bi bi-flower1"></i>&nbsp;장바구니</p>
	<table class="table table-hover">
	
		 <thead>
           <tr>
             <th scope="col">구분</th>
             <th scope="col">상품명</th>
             <th scope="col">가격</th>
             <th scope="col">수량</th>
             <th scope="col">포인트</th>
             <th scope="col">합계</th>
           </tr>
         </thead>
         
		 <tbody class="table-group-divider">
			 <c:choose>
				    <c:when test="${ empty myCartList }">

				    <tr>
				       <th colspan="5">
				       <img src="${contextPath}/resources/image/cart_empty.png" class="rounded mx-auto d-block w-30">
				   
				       </th>
				      
				     </tr>
				     
				    </c:when>
			        <c:otherwise>
			        
			        
			        
					<tr>
					 <form name="frm_order_all_cart">
					 <c:forEach var="item" items="${myGoodsList }" varStatus="cnt">
					 <c:set var="cart_goods_qty" value="${myCartList[cnt.count-1].cart_goods_qty}" />
				     <c:set var="cart_id" value="${myCartList[cnt.count-1].cart_id}" />
				     
						<th scope="row"><input class="form-check-input mt-5" type="checkbox" name="checked_goods" value="${item.goods_id }" id="checkboxNoLabel" onClick="calcGoodsPrice(${item.goods_sales_price },this)" checked></th>			
						<td><a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
					
						<img src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}" class="figure-img img-fluid rounded" style="width: 120px;">
						<span class="cartTitleFont fs-5 fw-semibold"> &nbsp;&nbsp;&nbsp;&nbsp;${item.goods_title} </span>
						</a>
						</td>
						<!-- 구분 및 상품명 열 (상품 id 이미지 체크박스)-->
						
		
						<td> 
						<fmt:formatNumber  value="${item.goods_sales_price}" type="number" var="discounted_price" />
				         <p class="fs-5 mt-5">${discounted_price}원</p>
				         </td>
				         <!-- 가격  -->
				            
						<td>  
						<div class="clear mt-5"></div>
						<input type="text" class="inputQty" id="cart_goods_qty" name="cart_goods_qty" size=4 value="${cart_goods_qty}" >
						<a class="btn btn-outline-dark btn-sm mb-2" 
						    href="javascript:modify_cart_qty(${item.goods_id },${item.goods_sales_price },${cnt.count-1 });">변경</a>
						
						</td>
						<!-- 상품수량 -->
				            
						<td>  
						<div class="clear mt-5"></div>
						<p class="fs-5 mt-5">${item.goods_point * cart_goods_qty }P</p>
						</td>
						<!-- 포인트 -->
						
						<td><fmt:formatNumber  value="${item.goods_sales_price*cart_goods_qty}" type="number" var="total_sales_price" />
				      	<p class="fs-5 mt-5" id="price${cnt.count-1 }">  ${total_sales_price}원 </p>
				         <input type="hidden" id="deliverPrice${cnt.count-1 }" value="${item.goods_delivery_price}" />
				         </td>
				         <!-- 가격 -->
				         
				         <td>  
					       <a class="btn btn-outline-dark btn-sm mt-5" 
					       href="javascript:fn_order_each_goods('${item.goods_id }','${item.goods_title }','${item.goods_sales_price}','${item.goods_fileName}','${item.goods_delivery_price}','${item.goods_point * cart_goods_qty }');">주문</a>
						   
						    <a class="btn btn-outline-dark btn-sm  mt-5" 
						    href="javascript:delete_cart_goods('${cart_id}');">삭제</a>
				         </td>	
				         
					</tr>

   				<c:set  var="totalGoodsPrice" value="${totalGoodsPrice+item.goods_sales_price*cart_goods_qty }" />
				<c:set  var="totalGoodsNum" value="${totalGoodsNum+cart_goods_qty }" />
				<c:if test="${totalDeliveryPrice < item.goods_delivery_price}">
				<c:set var="totalDeliveryPrice" value="${item.goods_delivery_price}"/>
				</c:if>
				<!--  -->
				
			   </c:forEach>
					
						    
		</tbody>
	</table>
					
	<div class="clear"></div>
		  </c:otherwise>
		  </c:choose> 		    
					 
		
	</div>				
	
				
	<div class="tableContainer2 w-75 mt-3">
	<table class="table table-hover">
		<thead>
	     <tr>
	       <th scope="col">총 상품수 </th>
	       <th scope="col">총 배송비</th>
	      <!--  <th scope="col">총 상품금액 </th>  -->
	       <th scope="col">최종 결재금액 </th>
	     </tr>
	     </thead>
	     <tbody class="table-group-divider">
		 <tr>
		 	<th id="newTOtalNum" scope="row">
			  <p id="p_totalGoodsNum" class="fs-3">${totalGoodsNum}개 </p>
			  <input id="h_totalGoodsNum"type="hidden" value="${totalGoodsNum}"  />
			</th>
			<!-- 상품수  -->
			
			<td>
			<c:choose>
			<c:when test="${totalGoodsPrice >=100000}">
	         <p id="p_totalDeliveryPrice" class="fs-3">
	          10만원이상 배송비 무료! </p>
	          <input id="h_totalDeliveryPrice" type="hidden" value=0 />
	         </c:when>
	         <c:otherwise>
	           <p id="p_totalDeliveryPrice" class="fs-3">
	          ${totalDeliveryPrice }원</p>
	          <small>(10만원이상 배송비 무료)</small>
	          <input id="h_totalDeliveryPrice" type="hidden" value="${totalDeliveryPrice}" />
	          </c:otherwise>
	         </c:choose>
	        </td>
	        <!-- 배송비  -->
			
			<%--  상품금액(정가)
	       <td>
	          <p id="p_totalGoodsPrice">
	          <fmt:formatNumber  value="${totalGoodsPrice}" type="number" var="total_goods_price" />
				         ${total_goods_price}원
	          </p>
	          <input id="h_totalGoodsPrice"  type="hidden" value="${totalGoodsPrice}" />
	       </td>
	        --%>
       
	      
	       

	      <%--  <td>  
	         <p id="p_totalSalesPrice" class="fs-3"> 
			 ${totalDiscountedPrice}원
	         </p>
	         <input id="h_totalSalesPrice"type="hidden" value="${totalSalesPrice}" />
	       </td>
	       <!-- 할인금액 --> --%>
	    
	       <td id="newTotalPrice">
	          <p id="p_final_totalPrice" class="fs-3">
	          <fmt:formatNumber  value="${totalGoodsPrice+totalDeliveryPrice-totalDiscountedPrice}" type="number" var="total_price" />
	            ${total_price}원
	          </p>
	          <input id="h_final_totalPrice" type="hidden" value="${totalGoodsPrice+totalDeliveryPrice-totalDiscountedPrice}" />
	       </td>
	       <!-- 결재금액 -->
		</tr>
		</tbody>
	</table>
	</div>
	
    <br><br>	
		 <div class="buttonRow justify-content-center">
		 <a class="btn btn-outline-dark btn-lg" href="javascript:fn_order_all_cart_goods()" role="button">주문하기</a>
		 <a class="btn btn-outline-dark btn-lg" href="${contextPath}/main/main.do" role="button">쇼핑계속하기</a>
		</div>
</form>

	
</div>

</body>