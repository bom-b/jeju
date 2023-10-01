<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 댓글창과 지도 -->	
	<div class="commentBox container-xxl py-5">
		<div class="container my-5 py-5">
			<div class="row align-items-center g-5">
				<div class="col-sm-8  wow fadeInUp" data-wow-delay="0.3s">
					<p class="text-left"><strong>댓글 (3)</strong></p>
	                <table class="table table-hover">
	                <thead>
                        <tr>
                            <th colspan="2" style="display: none;">작성자</th>
                            <th colspan="8" style="display: none;">내용</th>
                            <th colspan="2" style="display: none;">추천 및 삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="text-left">
                            <td colspan="2" class="comment">
	                            <strong>kim9</strong><br/>
	                            <span class="regdate">2023.09.19</span>
                            </td>
                            <td colspan="8" class="comment">정말 맛있어 보이네요.정말 맛있어 보이네요.정말 맛있어 보이네요.정말 맛있어 보이네요.정말 맛있어 보이네요.정말 맛있어 보이네요.정말 맛있어 보이네요.정말 맛있어 보이네요.정말 맛있어 보이네요.정말 맛있어 보이네요.</td>
                            <td colspan="2" class="comment">
	                            <button type="submit" class="btn btn-outline-dark form-control-sm" onclick="">
									삭제
								</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                <!-- 댓글작성폼 -->	
                <div id="insertComment">
                <p class="text-left"><strong>댓글작성</strong></p>
		           <form id="comment_form" method="post" role="form" class="form-horizontal" >
				   <table class="table">
				       <thead>
				       </thead>
				       <tbody>
				         <tr>
				           <td class="text-left">
				              <label for="content" class="menubox-sub">작성자</label>              
				           </td>
				           <td>
				            <input type="hidden" name="no" value="${bean.no}" />
				            <input type="text" name="fakeid" id="fakeid" class="form-control" size="5" 
				               disabled="disabled" value="${sessionScope.loginfo.name}(${sessionScope.loginfo.id})님">                           
				            <input type="hidden" name="id" id="id" value="${sessionScope.loginfo.id}">
				            <input type="hidden" name="comment_Type" id="comment_Type" value="">
				           </td>
				         </tr>
				         <tr>
				           <td class="text-left">
				              <label for="content" class="menubox-sub">댓글내용</label>
				           </td>
				           <td class="text-left">
					           <div>
					           	<textarea name="content" rows="3" cols="50" id="content" ></textarea>
					           </div>
					           <div>
					           	<button type="button" id="submitComment" class="btn btn-warning">등록</button> 
					           </div>   
				           </td>
				         </tr>
				       </tbody>
				   </table>
				</form>
		      </div>
            </div>            
            <!-- 댓글작성폼 -->	       	
				
				<div class="col-sm-4 wow fadeInUp" data-wow-delay="0.3s">
					<p class="text-left"><strong>위치</strong></p>
					<div class="col-md-6 maps" >
			       		 <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d11880.492291371422!2d12.4922309!3d41.8902102!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x28f1c82e908503c4!2sColosseo!5e0!3m2!1sit!2sit!4v1524815927977" frameborder="0" style="border:0" allowfullscreen></iframe>
			      	</div>
				</div>
			</div>
		</div>
	</div>
<!-- 댓글창과 지도 -->	
</body>
</html>