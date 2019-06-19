<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<section class="busker-support">
  <header class="busker-show__header">
    <div class="busker-show__header-top-menu">
      <a
        class="header-top-menu__content"
        href="<c:url value='/artist/main/main.do'/>?buskerNo=${param.buskerNo}"
      >
        <i class="fas fa-home fa-lg"></i> 버스커 홈
      </a>
      &gt <a class="header-top-menu__content"> 후원게시판 </a>
    </div>
    <div class="busker-show__header-title">
      <a class="busker-show__header-link" href="#">후원게시판</a>
    </div>
  </header>
  <section class="busker-support__main">
    <div class="busker-support__main-column">
      <header class="support-info__header">
        <div class="support-info__percent">
          <span class="support-info__percent-value">79</span>
          <span class="support-info__percent-icon">%</span>
        </div>
      </header>
      <section class="support-info__section">
        <div class="support-info__progressbar-wrapper">
          <div class="support-info__progressbar">
            <div class="support-info__progressbar-all"></div>
            <div class="support-info__progressbar-percent"></div>
          </div>
        </div>
		<span class="support-info__date">2019.05.29 ~ 2019.08.27 까지</span>
		<div class="support-info__Dday">
			<button class="support-info__btn" type="button"> D - 69 </button>
		</div>
      </section>
    </div>
    <div class="busker-support__main-column">
      <header class="support-header">
        <div class="support-title">후원 댓글</div>
        <div class="support-subtitle">
          총 <span class="support-user__money">1,294</span>개의 후원내역과
          응원메시지가 있습니다.
        </div>
      </header>
      <section class="support-section">
        <div class="support-section__item">
          <div class="support-section__column">
            <img
              class="support-section__profile"
              src="<c:url value='/resources/img/profile.png'/>"
            />
          </div>
          <div class="support-section__column">
            <div class="support-section__content">희망을 응원합니다.</div>
            <div class="support-section__date">2019.06.19 10:27</div>
            <div class="support-section__money">
              <span class="support-user">Yelle님</span>
              <div class="support-user__support"
                ><span class="support-user__money">1,400</span>원 후원</div
              >
            </div>
          </div>
        </div>
        <div class="support-section__item">
          <div class="support-section__column">
            <img
              class="support-section__profile"
              src="<c:url value='/resources/img/profile.png'/>"
            />
          </div>
          <div class="support-section__column">
            <div class="support-section__content">
              아이들이 조금이라도 더 행복해지길 바랍니다
            </div>
            <div class="support-section__date">2019.06.19 10:27</div>
            <div class="support-section__money">
              <span class="support-user">홍선경님</span>
              <div class="support-user__support">
                <span class="support-user__money"> 30,000 </span> 원 후원
              </div>
            </div>
          </div>
        </div>
        <div class="support-section__item">
          <div class="support-section__column">
            <img
              class="support-section__profile"
              src="<c:url value='/resources/img/profile.png'/>"
            />
          </div>
          <div class="support-section__column">
            <div class="support-section__content">희망을 응원합니다.</div>
            <div class="support-section__date">2019.06.19 10:27</div>
            <div class="support-section__money">
              <span class="support-user">Yelle님</span>
              <div class="support-user__support"
                ><span class="support-user__money">1,400</span>원 후원</div
              >
            </div>
          </div>
        </div>
        <div class="support-section__item">
          <div class="support-section__column">
            <img
              class="support-section__profile"
              src="<c:url value='/resources/img/profile.png'/>"
            />
          </div>
          <div class="support-section__column">
            <div class="support-section__content">
              아이들이 조금이라도 더 행복해지길 바랍니다
            </div>
            <div class="support-section__date">2019.06.19 10:27</div>
            <div class="support-section__money">
              <span class="support-user">홍선경님</span>
              <div class="support-user__support">
                <span class="support-user__money"> 30,000 </span> 원 후원
              </div>
            </div>
          </div>
        </div>
        <div class="support-section__item">
          <div class="support-section__column">
            <img
              class="support-section__profile"
              src="<c:url value='/resources/img/profile.png'/>"
            />
          </div>
          <div class="support-section__column">
            <div class="support-section__content">희망을 응원합니다.</div>
            <div class="support-section__date">2019.06.19 10:27</div>
            <div class="support-section__money">
              <span class="support-user">Yelle님</span>
              <div class="support-user__support"
                ><span class="support-user__money">1,400</span>원 후원</div
              >
            </div>
          </div>
        </div>
        <div class="support-section__item">
          <div class="support-section__column">
            <img
              class="support-section__profile"
              src="<c:url value='/resources/img/profile.png'/>"
            />
          </div>
          <div class="support-section__column">
            <div class="support-section__content">
              아이들이 조금이라도 더 행복해지길 바랍니다
            </div>
            <div class="support-section__date">2019.06.19 10:27</div>
            <div class="support-section__money">
              <span class="support-user">홍선경님</span>
              <div class="support-user__support">
                <span class="support-user__money"> 30,000 </span> 원 후원
              </div>
            </div>
          </div>
        </div>
        <div class="support-section__item">
          <div class="support-section__column">
            <img
              class="support-section__profile"
              src="<c:url value='/resources/img/profile.png'/>"
            />
          </div>
          <div class="support-section__column">
            <div class="support-section__content">희망을 응원합니다.</div>
            <div class="support-section__date">2019.06.19 10:27</div>
            <div class="support-section__money">
              <span class="support-user">Yelle님</span>
              <div class="support-user__support"
                ><span class="support-user__money">1,400</span>원 후원</div
              >
            </div>
          </div>
        </div>
        <div class="support-section__item">
          <div class="support-section__column">
            <img
              class="support-section__profile"
              src="<c:url value='/resources/img/profile.png'/>"
            />
          </div>
          <div class="support-section__column">
            <div class="support-section__content">
              아이들이 조금이라도 더 행복해지길 바랍니다
            </div>
            <div class="support-section__date">2019.06.19 10:27</div>
            <div class="support-section__money">
              <span class="support-user">홍선경님</span>
              <div class="support-user__support">
                <span class="support-user__money"> 30,000 </span> 원 후원
              </div>
            </div>
          </div>
        </div>
        <div class="support-section__item">
          <div class="support-section__column">
            <img
              class="support-section__profile"
              src="<c:url value='/resources/img/profile.png'/>"
            />
          </div>
          <div class="support-section__column">
            <div class="support-section__content">희망을 응원합니다.</div>
            <div class="support-section__date">2019.06.19 10:27</div>
            <div class="support-section__money">
              <span class="support-user">Yelle님</span>
              <div class="support-user__support"
                ><span class="support-user__money">1,400</span>원 후원</div
              >
            </div>
          </div>
        </div>
        <div class="support-section__item">
          <div class="support-section__column">
            <img
              class="support-section__profile"
              src="<c:url value='/resources/img/profile.png'/>"
            />
          </div>
          <div class="support-section__column">
            <div class="support-section__content">
              아이들이 조금이라도 더 행복해지길 바랍니다
            </div>
            <div class="support-section__date">2019.06.19 10:27</div>
            <div class="support-section__money">
              <span class="support-user">홍선경님</span>
              <div class="support-user__support">
                <span class="support-user__money"> 30,000 </span> 원 후원
              </div>
            </div>
          </div>
        </div>
        <div class="support-section__item">
          <div class="support-section__column">
            <img
              class="support-section__profile"
              src="<c:url value='/resources/img/profile.png'/>"
            />
          </div>
          <div class="support-section__column">
            <div class="support-section__content">희망을 응원합니다.</div>
            <div class="support-section__date">2019.06.19 10:27</div>
            <div class="support-section__money">
              <span class="support-user">Yelle님</span>
              <div class="support-user__support"
                ><span class="support-user__money">1,400</span>원 후원</div
              >
            </div>
          </div>
        </div>
        <div class="support-section__item">
          <div class="support-section__column">
            <img
              class="support-section__profile"
              src="<c:url value='/resources/img/profile.png'/>"
            />
          </div>
          <div class="support-section__column">
            <div class="support-section__content">
              아이들이 조금이라도 더 행복해지길 바랍니다
            </div>
            <div class="support-section__date">2019.06.19 10:27</div>
            <div class="support-section__money">
              <span class="support-user">홍선경님</span>
              <div class="support-user__support">
                <span class="support-user__money"> 30,000 </span> 원 후원
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  </section>
</section>
