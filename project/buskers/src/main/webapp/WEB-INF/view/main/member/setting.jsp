<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<link rel="stylesheet" href="<c:url value='/resources/css/main/member/setting.css'/>"/>
<script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<title>개인설정</title>
<main class="main-board profile-main">  
    <div class="profile">
		<div class="profile_title">
			<div class="profile_title_underline">
				<a href="<c:url value='/main/member/setting.do'/>">개인설정</a>
			</div> 
		</div>
    	<div class="profile_row">
			<div class="profile_info">
				<div class="profile_info_img">
					<div class="profile_info_img2" aria-label="프로필 사진">
						<div class="profile_info_img3">
							<img class="profile_info_img4" src="<c:url value='/file/download.do'/>?path=${sessionScope.user.profileImgPath}${sessionScope.user.profileImg}" title="프로필"/>
						</div>
					</div>
					<div class="profile_info_img5">
						<div class="profile_info_img6" title="즐겨찾기"></div>
					</div>
				</div>
				<div class="profile_info_nickName">
					${sessionScope.user.nickName}
				</div>
				<div class="profile_info_email">
					${sessionScope.user.email}
				</div>
				<hr class="profile_hr">
				<div class="profile_countbox">
					<div class="profile_posts">
						<p>6</p>
						<p>게시글</p>
					</div>
					<div class="profile_comment">
						<p>15</p>
						<p>댓글</p>
					</div>
				</div>
				<div class="profile_introduce1">
					<div class="profile_introduce2">
						안녕하세요 박보영 입니다!
					</div>
				</div>
			</div>
			<div class="profile_body">
				<div class="profile_menu">
					<ul class="pro_tab_wapper">
						<li class="pro_tab active">
							<a class="pro_tab_link"  onclick="tab_menu(0);" >프로필</a>
						</li>
						<li class="pro_tab">
							<a class="pro_tab_link"  onclick="tab_menu(1);" >친구 관리</a>
						</li>
						<li class="pro_tab">
							<a class="pro_tab_link" onclick="tab_menu(2);" >알림</a>
						</li>
						<li class="pro_tab">
							<a class="pro_tab_link"  onclick="tab_menu(3);" >개인정보 관리</a>
						</li>
						<li class="pro_tab">
							<a class="pro_tab_link"  onclick="tab_menu(4);" >결제</a>
						</li>
					</ul>
				</div>
				<div class="profile_content">
			        <div class="tab-pane0" id="profile" style="display: block;">
			        	<div class="form profile">
			        		<div class="profile__img__title">
			        			<h3>프로필 사진</h3>
			        		</div>	
			        		<div class="profile__img__box">
			        			<div class="profile__img__row">
			        				<div class="profile__img__setting">
			        					<div class="img__box1">
			        						<div class="img__box2">
			        							<img class="img__box3" src="<c:url value='/file/download.do'/>?path=${sessionScope.user.profileImgPath}${sessionScope.user.profileImg}" title="프로필 사진"/>
			        						</div>
			        					</div>
			        					<div class="img__update">
			        						<div class="img__update__box">
			        							<button type="button" class="img__update__button" id="profileBtn">프로필 사진 업데이트</button>
			        						</div>
			        						<div class="img__update__ment">
			        							<p>JPEG, PNG, GIF 중 하나여야 하며 10MB를 초과할 수 없습니다.</p>
			        						</div>
			        					</div>
			        				</div>
			        			</div>
			        		</div>
			        		<div class="profile__introduce__title">
			        			<h3>프로필 소개</h3>
			        		</div>
			        		<div class="profile__introduce__box">
			        			<textarea class="introduce__textarea" placeholder="소개글을 써주세요!"></textarea>
			        		</div>
			        	</div>
			        </div>
				    <div class="tab-pane1" id="friend" style="display: none;" >...22
				    
				    </div>
				    <div class="tab-pane2" id="notice" style="display: none;" >...33
				    
				    </div>
				    <div class="tab-pane3" id="privacy" style="display: none;" >
				    	<%@ include file= "change-info.jsp" %>
				    </div>
				    <div class="tab-pane4" id="pay" style="display: none;" >
				    	<%@ include file= "pay.jsp" %>
				    </div>
				</div>
			</div>
    	</div>
    	<div class="profile_title"></div>
	</div>
	
	<!-- The Modal -->
    <div id="myModal" class="modal">
	    <!-- Modal content -->
	    <div class="modal-content">
		    <div class="modal-header">
		    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		    	<h4 class="modal-title">프로필 사진 업데이트</h4>
		    </div>
		    <form id="profileFrom" action="profileUpload.do" method="POST">
		    <div class="modal-body">
		      	<button class="btn-file" id="btn___file">
				    <input type="file" id="profile__img" name="userProfile" enctype="multipart/form-data"/>
		      		<img class="preview-profile" id="profile__preview" src="" />
		      		<span class="btn-file-word">사진 업로드</span>
		      		<input type="hidden" name="memberNo" value="${sessionScope.user.memberNo }"/>
		      		<input type="hidden" name="id" value="${sessionScope.user.id }"/>
		      		<input type="hidden" name="profileImg" value="${sessionScope.user.profileImg }"/>
				</button>
		    </div>
		    </form>
		    <div class="modal-footer">
		    	<button type="button" class="closeBtn" >닫기</button>
		    	<button type="button" class="saveBtn" >저장</button>
		    </div>
	    </div>
    </div>
</main>
<script type="text/javascript">
// 탭이동
function tab_menu(num){
    var f = $('.pro_tab_wapper').find('li');
    for ( var i = 0; i < f.length; i++ ) { 
    	if ( i == num) { 
      		f.eq(i).addClass('active');
      		$('.tab-pane' + i ).css('display','block');
     	} else {
      		f.eq(i).removeClass('active');   
      		$('.tab-pane' + i ).css('display','none');
     	}
    }
}

//Get the modal
var modal = document.getElementById('myModal');
var probtn = document.getElementById("profileBtn");
var span = document.getElementsByClassName("close")[0];                                          
var cbtn = document.getElementsByClassName("closeBtn")[0];                                          

probtn.onclick = function() {
    modal.style.display = "block";
}

span.onclick = function() {
    modal.style.display = "none";
}

cbtn.onclick = function() {
    modal.style.display = "none";
}


// 프로필 이미지 미리보기
let sel_file;

$(document).ready(function () {
	$("#profile__img").on("change", handleImgFileSelect);
});

function handleImgFileSelect(e) {
	e.preventDefault();
	
	let prvFiles = e.target.files;
	let filesArr = Array.prototype.slice.call(prvFiles);
	
	filesArr.forEach(function (f) {
		if(!f.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		
		sel_file = f;
		
		let reader = new FileReader();
		reader.onload = function (e) {
			$(".preview-profile").css('display','inline-block');
			$(".btn-file-word").css('display','none');
			console.log(e.target.result);
// 			$(".btn-file").prepend('<img class="preview-profile" id="profile__preview" src="'+e.target.result+'"/>');
			$("#profile__preview").attr("src", e.target.result);
			
		}
		reader.readAsDataURL(f);
	});
}

// let parent = document.getElementById("btn___file");
// let child = document.getElementById("profile__preview");

// $(".closeBtn").on("click", function() {
// 	parent.removeChild(document.getElementById("profile__preview"));
// 	$("#profile__preview").remove();
// 	$(".preview-profile").css('display','none');
// 	$(".btn-file-word").css('display','block');
// });

// $(".btn-file").on("click", function() {
// 	$(this).prepend("<img class='preview-profile' id='profile__preview' />");
// });


// 프로필 이미지 업로드


$(".saveBtn").click(function () {
	if(($("#profile__img").val() == "" || $("#profile__img").val() == null)) {
		alert("이미지 파일을 등록해주세요!");
	} else {
		let file = $("#profile__img")[0].files[0];
		let uriPath = "/buskers/main/board/member/";
		let memberNo = "${sessionScope.user.memberNo}";
		let id = "${sessionScope.user.id}";
		let profileImg = "${sessionScope.user.profileImg}";
		
		let formData = new FormData();
		formData.append("file", file);
		formData.append("uriPath", uriPath);
		formData.append("memberNo", memberNo);
		formData.append("id", id);
		formData.append("profileImg", profileImg);
		$.ajax({
			type: 'POST',
			url: "profileUpload.do",
			data: formData,
			processData: false,
			contentType: false,
			cache : false,
			success: function(result) {
				alert("프로필 이미지를 업로드 했습니다.");
				modal.style.display = "none";
			},
			error: function(error) {
				alert("프로필 이미지 업로드에 실패하였습니다.");
				console.log(error);
				console.log(error.status);
			}
			
		});
	}
});



/*  후승   */
  	let userEmail = "${sessionScope.user.email}";
  	let userNickName = "${sessionScope.user.nickName}";
	let emailck = 0;
	let nickNameck = 0;
	
	$("#modify").click(
	function DosignUp() {
		let getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
     	let getCheck = RegExp(/^[a-zA-Z0-9]{4,16}$/);
     	let getCheckPwd = RegExp(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/);
      	let getName = RegExp(/^[가-힣]+$/);
      	
      	// 비밀번호 공백 확인
      	if($("#pass").val() == "") {
      		Swal.fire({
				  title:'비밀번호를 입력해 주세요',
				  type:'warning',
				  timer:2000	
			});
      		return false;
      	}
      	
      	
      	// 비밀번호 유효성 검사
      	if(!getCheckPwd.test($("#pass").val())) {
	      	Swal.fire({
				  title:'비밀번호는 특수문자를 제외한 영문,숫자를 혼용하여 8~16자를 입력해주세요!',
				  type:'warning',
				  timer:2000	
			});
	      	$("#pass").val("");
	      	$("#pass").focus();
	      	return false;
      	}	
      	
     	// 비밀번호체크 공백 확인
      	if($("#checkpass").val() == "") {
      		Swal.fire({
				  title:'비밀번호확인을 입력해 주세요',
				  type:'warning',
				  timer:2000	
			});
      		return false;
      	}
     
        // 비밀번호와 비밀번호체크가 같은지 검사
        if($("#pass").val() != ($("#checkpass").val())){ 
        	Swal.fire({
				  title:'비밀번호가 같지 않습니다.',
				  type:'warning',
				  timer:2000	
			});
	        $("#pass").val("");
	        $("#checkpass").val("");
	        $("#pass").focus();
        	return false;
        }
        
        // 이메일 공백 확인
        if($("#email").val() == ""){
          	alert("이메일을 입력해주세요!");
          	$("#email").focus();
          	return false;
        }
             
        // 이메일 유효성 검사
        if(!getMail.test($(".user__email").val())){
          	alert("이메일형식에 맞게 입력해주세요!")
          	$("#email").focus();
          	return false;
        }
        
	})
	
	

	
	
	// 이메일 중복 체크
	$(function() {
		$("#checkEmail").click(function() {
			let email = $(".user__email").val();
			
			/* 현재이메일과 같은경우 */ 
			if(email==userEmail){
				Swal.fire({
					  title:'사용가능한 이메일 입니다',
					  type:'info',
					  timer:2000	
				});
				emailck = 1;
				return;
			
			}
			
			//이메일 공백일때
			if(email.length < 1) {
				Swal.fire({
					  title:'이메일을 입력해 주세요',
					  type:'warning',
					  timer:2000	
				});
			} else {
				$.ajax({
					data: "email="+email,
					url: "checkEmail.do",
					success: function(result) {
						if (result == 0) {
							Swal.fire({
								  title:'사용가능한 이메일 입니다',
								  type:'info',
								  timer:2000	
							});
							emailck = 1;
						} else if (result == 1) {
							Swal.fire({
								  title:'존재하는 이메일입니다.',
								  type:'warning',
								  timer:2000	
							});
						} else {
							Swal.fire({
								  title:'에러발생',
								  type:'warning',
								  timer:2000	
							});
						}
					}
				});
			}
		});
	})
	
	/* 닉네임 중복체크 */
	// 닉네임 중복 체크
	$(function() {
		$("#checkNickName").click(function() {
			
			let nickName = $(".user__nickName").val();
			

			/* 현재닉네임과 같은경우 */
			if(nickName==userNickName){
				Swal.fire({
					  title:'사용가능한 닉네임 입니다',
					  type:'info',
					  timer:2000	
				});
				nickNameck = 1;
				return;
			
			}			
			
			
			if(nickName.length < 1) {
				alert("닉네임을 입력해주시기 바랍니다.");
			} else {
				$.ajax({
					data: "nickName="+nickName,
					url: "checkNickName.do",
					success: function(result) {
						if (result == 0) {
							Swal.fire({
								  title:'사용가능한 닉네임 입니다',
								  type:'info',
								  timer:2000	
							});
							nickNameck = 1;
						} else if (result == 1) {
							Swal.fire({
								  title:'이미 존재하는 닉네임입니다. 다른 닉네임을 입력해주세요',
								  type:'warning',
								  timer:2000	
							});
						} else {
							alert("에러 발생");
						}
					}
				});
			}
		});
	});
	
 
</script>
	