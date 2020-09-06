import $ from 'jquery';

let siteMenuClone = function() {

  $('.js-clone-nav').each(function() {
    let $this = $(this);
    $this.clone().attr('class', 'site-nav-wrap').appendTo('.site-mobile-menu-body');
  });

  setTimeout(function() {
    let counter = 0;
    $('.site-mobile-menu .has-children').each(function(){
      let $this = $(this);

      $this.prepend('<span class="arrow-collapse collapsed">');

      $this.find('.arrow-collapse').attr({
        'data-toggle' : 'collapse',
        'data-target' : '#collapseItem' + counter,
      });

      $this.find('> ul').attr({
        'class' : 'collapse',
        'id' : 'collapseItem' + counter,
      });

      counter++;

    });

  }, 1000);

  $('body').on('click', '.arrow-collapse', function() {
    let $this = $(this);
    if ( $this.closest('li').find('.collapse').hasClass('show') ) {
      $this.removeClass('active');
    } else {
      $this.addClass('active');
    }
  });

  $(window).resize(function() {
    let $this = $(this),
      w = $this.width();

    if ( w > 768 ) {
      if ( $('body').hasClass('offcanvas-menu') ) {
        $('body').removeClass('offcanvas-menu');
      }
    }
  })

  $('body').on('click', '.js-menu-toggle', function() {
    let $this = $(this);

    if ( $('body').hasClass('offcanvas-menu') ) {
      $('body').removeClass('offcanvas-menu');
      $this.removeClass('active');
    } else {
      $('body').addClass('offcanvas-menu');
      $this.addClass('active');
    }
  })

  // click outside of canvas
  $(document).mouseup(function(e) {
    const container = $(".site-mobile-menu");
    if (!container.is(e.target) && container.has(e.target).length === 0) {
      if ( $('body').hasClass('offcanvas-menu') ) {
        $('body').removeClass('offcanvas-menu');
      }
    }
  });
};

// scroll
let scrollWindow = function() {
  $(window).scroll(function(){
    let $w = $(this),
        st = $w.scrollTop(),
        navbar = $('.js-site-navbar'),
        sd = $('.js-scroll-wrap'),
        toggle = $('.site-menu-toggle');

    if ( toggle.hasClass('open') ) {
      $('.site-menu-toggle').trigger('click');
    }


    if (st > 150) {
      if ( !navbar.hasClass('scrolled') ) {
        navbar.addClass('scrolled');
      }
    }
    if (st < 150) {
      if ( navbar.hasClass('scrolled') ) {
        navbar.removeClass('scrolled sleep');
      }
    }
    if (st > 350) {
      if ( !navbar.hasClass('awake') ) {
        navbar.addClass('awake');
      }

      if(sd.length > 0) {
        sd.addClass('sleep');
      }
    }
    if ( st < 350 ) {
      if ( navbar.hasClass('awake') ) {
        navbar.removeClass('awake');
        navbar.addClass('sleep');
      }
      if(sd.length > 0) {
        sd.removeClass('sleep');
      }
    }
  });
};

export { siteMenuClone, scrollWindow };
