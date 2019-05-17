<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="<c:url value='/resources/css/main/board/notice/notice.css'/>" />
<main class="notice-board main-board">
<div class="board">
	<header class="notice-board__header">
		<span class="notice-board__header-title">notice</span> <span
			class="notice-board__header-subtitle">ㅡ</span>
	</header>
	<div class="notice-board__main">
		<header class="notice-board__main-header">
			<div class="notice-board-main-header__tabs">
				<div class="notice-board-main-header__tab tab-selected">news</div>
				<div class="notice-board-main-header__tab">culture</div>
				<div class="notice-board-main-header__tab">gallery</div>
			</div>
		</header>
		<section class="notice-board-main__search">
			<form class="notice-board-main__search-form" action="">
				<div class="notice-board-main__search-column">
					<select class="notice-board-main__search-item" name="" id="">
						<option value="" selected>전체</option>
						<option value="">내용</option>
					</select>
				</div>
				<div class="notice-board-main__search-column">
					<input class="notice-board-main__search-item" type="text" />
				</div>
				<div class="notice-board-main__search-column">
					<button class="notice-board-main__search-item">검색</button>
				</div>
			</form>
		</section>
		<section class="notice-board-main__view">
			<div class="notice-board-main__view-column">
				<button type="button" class="notice-board-main__view-top-btn">
					<span class="view-top-btn">top</span> <i
						class="fas fa-angle-up fa-2x"></i>
				</button>

				<ul class="notice-board-main__view-items">
					<li class="notice-board-main__view-item"><a href="#">
							<div class="view-item__top">
								<div class="view-item__title">
									<button class="view-item__notice-btn">공지</button>
									3월 open project
								</div>
								<span class="view-item__date">9 APR 2019</span>
							</div> <span class="view-item__content">삼성전자의
								진화된 4K UHD만의 생생한 컬러 Lorem ipsum dolor, sit amet consectetur
								adipisicing elit. Minus doloremque aut vitae fuga maiores
								exercitationem velit ea eligendi iusto. Est provident quam culpa
								ratione unde officiis quisquam incidunt impedit laboriosam.</span>
					</a></li>
					<li class="notice-board-main__view-item"><a href="#"> <span
							class="view-item__top">
								<div class="view-item__title">
									<button class="view-item__notice-btn">공지</button>
									3월 open project
								</div> <span class="view-item__date">9 APR 2019</span>
						</span> <span class="view-item__content">삼성전자의
								진화된 4K UHD만의 생생한 컬러 Lorem ipsum dolor, sit amet consectetur
								adipisicing elit. Minus doloremque aut vitae fuga maiores
								exercitationem velit ea eligendi iusto. Est provident quam culpa
								ratione unde officiis quisquam incidunt impedit laboriosam.</span>
					</a></li>
					<li class="notice-board-main__view-item"><a href="#"> <span
							class="view-item__top">
								<div class="view-item__title">
									<button class="view-item__notice-btn">공지</button>
									3월 open project
								</div> <span class="view-item__date">9 APR 2019</span>
						</span> <span class="view-item__content">삼성전자의
								진화된 4K UHD만의 생생한 컬러 Lorem ipsum dolor, sit amet consectetur
								adipisicing elit. Minus doloremque aut vitae fuga maiores
								exercitationem velit ea eligendi iusto. Est provident quam culpa
								ratione unde officiis quisquam incidunt impedit laboriosam.</span>
					</a></li>
					<li class="notice-board-main__view-item"><a href="#"> <span
							class="view-item__top">
								<div class="view-item__title">
									<button class="view-item__notice-btn">공지</button>
									3월 open project
								</div> <span class="view-item__date">9 APR 2019</span>
						</span> <span class="view-item__content">삼성전자의
								진화된 4K UHD만의 생생한 컬러 Lorem ipsum dolor, sit amet consectetur
								adipisicing elit. Minus doloremque aut vitae fuga maiores
								exercitationem velit ea eligendi iusto. Est provident quam culpa
								ratione unde officiis quisquam incidunt impedit laboriosam.</span>
					</a></li>
					<li class="notice-board-main__view-item"><a href="#"> <span
							class="view-item__top">
								<div class="view-item__title">
									<button class="view-item__notice-btn">공지</button>
									3월 open project
								</div> <span class="view-item__date">9 APR 2019</span>
						</span> <span class="view-item__content">삼성전자의
								진화된 4K UHD만의 생생한 컬러 Lorem ipsum dolor, sit amet consectetur
								adipisicing elit. Minus doloremque aut vitae fuga maiores
								exercitationem velit ea eligendi iusto. Est provident quam culpa
								ratione unde officiis quisquam incidunt impedit laboriosam.</span>
					</a></li>
				</ul>
			</div>
			<div class="notice-board-main__view-column">
				<header class="notice-board__view-content-header">
					<div class="view-content__header-title">2018 상반기 워크샵 안내</div>
					<div class="view-content__header-content">
						<div class="header-content__column">
							<span class="header-content__column-name">작성자</span> <span
								class="header-content__column-writer">관리자</span>
						</div>
						<div class="header-content__column">
							<span class="header-content__column-name">작성일</span> <span
								class="header-content__column-writer">2018.04.15</span>
						</div>
					</div>
				</header>
				<section class="notice-board__view-content">따뜻한 봄햇살과 함께 ★
					다람미디어 전직원 상반기 워크샵을 갑니다. 바쁜 일상 업무속에서 단합과 지친몸 힐링이되는 워크샵이 되세요. 다음과 같이
					일정을 안내드리며, 세부적인 행사 일정은 추후 다시 안내하겠습니다. ▶ 일 시 : 2018.04. 20~ 2018.
					04.21 (1박 2일) ▶ 장 소 : 단양 페러마을 ▶ 일 정 : 자세한 일정 추후공지 ★ 4월20일 (금)요일은
					워크샵으로 인한 (휴무) 입니다.</section>
			</div>
		</section>
	</div>
</div>
</main>
<script src="<c:url value='/resources/js/main/board/agency/detail.js'/>"></script>