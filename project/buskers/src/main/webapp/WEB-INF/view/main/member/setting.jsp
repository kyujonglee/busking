<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel="stylesheet" href="<c:url value='/resources/css/main/member/setting.css'/>"/>
<script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
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
							<img class="profile_info_img4" src="<c:url value='/resources/img/boyoung.jpg'/>" title="프로필"/>
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
							<a class="pro_tab_link" href="#profile;" onclick="tab_menu(0);" >프로필</a>
						</li>
						<li class="pro_tab">
							<a class="pro_tab_link" href="#friend;" onclick="tab_menu(1);" >친구 관리</a>
						</li>
						<li class="pro_tab">
							<a class="pro_tab_link" href="#notice;" onclick="tab_menu(2);" >알림</a>
						</li>
						<li class="pro_tab">
							<a class="pro_tab_link" href="#privacy;" onclick="tab_menu(3);" >개인정보 관리</a>
						</li>
						<li class="pro_tab">
							<a class="pro_tab_link" href="#social;" onclick="tab_menu(4);" >결제</a>
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
			        							<img class="img__box3" src="<c:url value='/resources/img/boyoung.jpg'/>" title="프로필 사진"/>
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
				    <div class="tab-pane3" id="privacy" style="display: none;" >...44
				    
				    </div>
				    <div class="tab-pane4" id="social" style="display: none;" >...55
				    	<% %>@> 
				    </div>
				</div>
			</div>
    	</div>
    	<div class="profile_title"></div>
	</div>
	
	<!-- The Modal -->
    <div id="myModal" class="modal">
	    <!-- Modal content -->
	    <form id="profileFrom" action="profileUpload.do" method="POST">
	    <div class="modal-content">
		    <div class="modal-header">
		    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		    	<h4 class="modal-title">프로필 사진 업데이트</h4>
		    </div>
		    <div class="modal-body">
		      	<button class="btn-file" id="btn___file">
				    <input type="file" id="profile__img" name="userProfile" />
		      		<img class="preview-profile" id="profile__preview" src="" />
		      		<span class="btn-file-word">사진 업로드</span>
				</button>
		    </div>
		    <div class="modal-footer">
		    
		    	<button type="button" class="closeBtn" >닫기</button>
		    	<button type="button" class="saveBtn" >저장</button>
		    </div>
	    </div>
	    </form>
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
	
	let files = e.target.files;
	let filesArr = Array.prototype.slice.call(files);
	
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
		let uriPath = "/buskers/main/board/member/";
		let file = $("#profileFrom")[0];
		console.log(file);
		let formData = new FormData();
		formData.append("file", file);
		formData.append("uriPath", uriPath);
		$.ajax({
			type: 'POST',
			url: "profileUpload.do",
			data: formData,
			processData: false,
			contentType: false,
			cache : false,
			success: function(result) {
				alert("프로필 이미지를 업로드 했습니다.");
			},
			error: function(error) {
				alert("프로필 이미지 업로드에 실패하였습니다.");
				console.log(error);
				console.log(error.status);
			}
			
		});
		$("#profileFrom").submit();
	}
});


</script>
	