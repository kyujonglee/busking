/** 
  * Template Name: SpicyX
  * Version: 1.0  
  * Template Scripts
  * Author: MarkUps
  * Author URI: http://www.markups.io/

  Custom JS
  

  1. FIXED NAVBAR 
  2. TOP SLIDER
  3. ABOUT US (SLICK SLIDER) 
  4. DATEPICKER
  5. SHEF SLIDER (SLICK SLIDER)
  6. TESTIMONIAL SLIDER (SLICK SLIDER)
  7. COUNTER
  8. MIXIT FILTER (FOR GALLERY)
  9. FANCYBOX (FOR PORTFOLIO POPUP VIEW) 
  10. MENU SMOOTH SCROLLING
  11. HOVER DROPDOWN MENU
  12. SCROLL TOP BUTTON
  13. PRELOADER  

  
**/

jQuery(function($){


  /* ----------------------------------------------------------- */
  /*  1. FIXED NAVBAR 
  /* ----------------------------------------------------------- */
    
    
  jQuery(window).bind('scroll', function () {
    if (jQuery(window).scrollTop() > 50) {
        jQuery('.main_menu_navigation').addClass('menu_bigger');
      } else {
        jQuery('.main_menu_navigation').removeClass('menu_bigger');          
      }
  });
  
  /* ----------------------------------------------------------- */
  /*  2. TOP SLIDER (SLICK SLIDER)
  /* ----------------------------------------------------------- */    

    jQuery('.mu-top-slider').slick({
      dots: false,
      infinite: true,
      arrows: true,
      speed: 500,     
      autoplay: true,
      fade: true,
      cssEase: 'linear'
    });


  
  /* ----------------------------------------------------------- */
  /*  11. HOVER DROPDOWN MENU
  /* ----------------------------------------------------------- */ 
  
  // for hover dropdown menu
    jQuery('ul.nav li.dropdown').hover(function() {
      jQuery(this).find('.dropdown-menu').stop(true, true).delay(100).fadeIn(200);
    }, function() {
      jQuery(this).find('.dropdown-menu').stop(true, true).delay(100).fadeOut(200);
    });

    
  /* ----------------------------------------------------------- */
  /*  12. SCROLL TOP BUTTON
  /* ----------------------------------------------------------- */

  //Check to see if the window is top if not then display button

    jQuery(window).scroll(function(){
      if (jQuery(this).scrollTop() > 200) {
        jQuery('.scrollToTop').fadeIn();
      } else {
        jQuery('.scrollToTop').fadeOut();
      }
    });
     
    //Click event to scroll to top

    jQuery('.scrollToTop').click(function(){
      jQuery('html, body').animate({scrollTop : 0}, 800);
      return false;
    });

});