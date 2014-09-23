/*
 *	Name:		Official Premium All Purpose Site Tamplate
 *	Version:		1.3
 *	Developer:	T20
 *	Designer:	behzadg
 *	Group:		http://Theme20.com
 *
 *	Copyright (c) 2013-2014 Theme20
 *	All rights reserved
 */
jQuery(document).ready(function ($) {
	function mycarousel4_initCallback(e){e.buttonNext.hover(function(){e.stopAuto()},function(){e.startAuto()});e.buttonPrev.hover(function(){e.stopAuto()},function(){e.startAuto()});e.clip.hover(function(){e.stopAuto()},function(){e.startAuto()})};
	"use strict";
	jQuery.browser={};(function(){jQuery.browser.msie=false;
	jQuery.browser.version=0;if(navigator.userAgent.match(/MSIE ([0-9]+)\./)){
	jQuery.browser.msie=true;jQuery.browser.version=RegExp.$1;}})();

	// Top Widget Map
	if ($("#map1")[0]) {
		jQuery("#map1").gmap3({
			marker: {address: "2744 Los Angeles USA"},
			map: {options: {zoom: 10}}
		}).height('310');
	}
	// Content Big Map
	if ($("#big-map")[0]) {
		jQuery("#big-map").gmap3({
			marker: {address: "5569 Newyork USA"},
			map: {options: {zoom: 10}}
		}).height('200');
	}
	// Widget Map
	if ($("#map-widget")[0]) {
		jQuery("#map-widget").gmap3({
			marker: {address: "1545 NY USA"},
			map: {options: {zoom: 10}}
		}).height('200');
	}
	// Very Big Map
	if ($("#very-big-map")[0]) {
		jQuery("#very-big-map").gmap3({
			marker: {address: "2222 Chester Drive USA"},
			map: {options: {zoom: 10}}
		}).height('300');
	}
	// Superfish
	if ($(".sf-menu")[0]) {
		$('.sf-menu').superfish({
			delay: 100,
			animation: {
				opacity: 'show', height: 'show'
			},
			speed: 300,
			autoArrows: false
		}).lavaLamp({
			fx: "easeOutExpo", 
			speed: 600,
			setOnClick: false,
			click: function(event, menuItem) {
				return true;
			}
		});
	}
	// ExtraInfo
	if ($(".extrabox")[0]) {
		(function($) {
			$.fn.clickToggle = function(func1, func2) {
				var funcs = [func1, func2];
				this.data('toggleclicked', 0);
				this.click(function() {
					var data = $(this).data();
					var tc = data.toggleclicked;
					$.proxy(funcs[tc], this)();
					data.toggleclicked = (tc + 1) % 2;
				});
				return this;
			};
		}(jQuery));

		var DropHeight = jQuery('.extrabox').height();
		jQuery('.extrabox').css("top","-"+DropHeight+"px");
		jQuery('.arrow-down').clickToggle(function() {
			var DropHeight = jQuery('.extrabox').height();
			jQuery(this).addClass('opened');
			jQuery('.extrabox').animate({'top': 0}, {duration: '800', easing: 'easeInOutExpo'});
			jQuery('.arrow-down i').removeClass('icon-angle-down').addClass('icon-angle-up');
			jQuery('.page-content, .sliderr, .headdown, .head, .breadcrumb, footer').animate({'opacity': 0.5}, {duration: '2000', easing: 'easeInOutExpo'});
		}, function() {
			var DropHeight = jQuery('.extrabox').height();
			jQuery(this).removeClass('opened');
			jQuery('.extrabox').animate({'top': -DropHeight}, {duration: '800', easing: 'easeInOutExpo'});
			jQuery('.arrow-down i').addClass('icon-angle-down').removeClass('icon-angle-up');
			jQuery('.page-content, .sliderr, .headdown, .head, .breadcrumb, footer').animate({'opacity': 1}, {duration: '2000', easing: 'easeInOutExpo'});
		});
	}
	// knob
		if ($(".knob")[0]) {
			$(".knob").knob({
				change : function (value) {
					//console.log("change : " + value);
				},
				release : function (value) {
					//console.log(this.$.attr('value'));
					console.log("release : " + value);
				},
				cancel : function () {
					console.log("cancel : ", this);
				},
				draw : function () {
		
					// "tron" case
					if(this.$.data('skin') == 'tron') {
		
						var a = this.angle(this.cv)  // Angle
						, sa = this.startAngle          // Previous start angle
						, sat = this.startAngle         // Start angle
						, ea                            // Previous end angle
						, eat = sat + a                 // End angle
						, r = 1;
		
						this.g.lineWidth = this.lineWidth;
		
						this.o.cursor
						&& (sat = eat - 0.3)
						&& (eat = eat + 0.3);
		
						if (this.o.displayPrevious) {
							ea = this.startAngle + this.angle(this.v);
							this.o.cursor
							&& (sa = ea - 0.3)
							&& (ea = ea + 0.3);
							this.g.beginPath();
							this.g.strokeStyle = this.pColor;
							this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sa, ea, false);
							this.g.stroke();
						}
		
						this.g.beginPath();
						this.g.strokeStyle = r ? this.o.fgColor : this.fgColor ;
						this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sat, eat, false);
						this.g.stroke();
						
						this.g.lineWidth = 2;
						this.g.beginPath();
						this.g.strokeStyle = this.o.fgColor;
						this.g.arc( this.xy, this.xy, this.radius - this.lineWidth + 1 + this.lineWidth * 2 / 3, 0, 2 * Math.PI, false);
						this.g.stroke();
						
						return false;
					}
				}
			});
			$('.knob').waypoint(function() {
				var $this = $(this);
				var myVal = $this.attr("rel");
				$this.knob();
				$({value: 0}).animate({
					value: myVal
				}, {
					duration: 4000,
					easing: 'easeInOutExpo',
					step: function () {
						$this.val(Math.ceil(this.value)).trigger('change');
					}
				});
			}, {
				triggerOnce: true,
				offset: 'bottom-in-view'
			});
		}
	// Tabs
	var tabs = jQuery('ul.tabs');
	tabs.each(function (i) {
		// get tabs
		var tab = jQuery(this).find('> li > a');
		tab.click(function (e) {
			// get tab's location
			var contentLocation = jQuery(this).attr('href');
			// Let go if not a hashed one
			if (contentLocation.charAt(0) === "#") {
				e.preventDefault();
				// add class active
				tab.removeClass('active');
				jQuery(this).addClass('active');
				// show tab content & add active class
				jQuery(contentLocation).fadeIn(500).addClass('active').siblings().hide().removeClass('active');
			}
		});
	});
	// Accordion
	jQuery("ul.tt-accordion li").each(function () {
		if (jQuery(this).index() > 0) {
			jQuery(this).children(".accordion-content").css('display', 'none');
		} else {
			if ($(".faq")[0]) {
				jQuery(this).addClass('active').find(".accordion-head-sign").append("<i class='icon-ok-sign'></i>");
				jQuery(this).siblings("li").find(".accordion-head-sign").append("<i class='icon-question-sign'></i>");
			} else {
				jQuery(this).addClass('active').find(".accordion-head-sign").append("<i class='icon-minus-sign'></i>");
				jQuery(this).siblings("li").find(".accordion-head-sign").append("<i class='icon-plus-sign'></i>");
			}
		}
		jQuery(this).children(".accordion-head").bind("click", function () {
			jQuery(this).parent().addClass(function () {
				if (jQuery(this).hasClass("active")) {
					return;
				} {
					return "active";
				}
			});
			if ($(".faq")[0]) {
				jQuery(this).siblings(".accordion-content").slideDown();
				jQuery(this).parent().find(".accordion-head-sign i").addClass("icon-ok-sign").removeClass("icon-question-sign");
				jQuery(this).parent().siblings("li").children(".accordion-content").slideUp();
				jQuery(this).parent().siblings("li").removeClass("active");
				jQuery(this).parent().siblings("li").find(".accordion-head-sign i").removeClass("icon-ok-sign").addClass("icon-question-sign");
			} else {
				jQuery(this).siblings(".accordion-content").slideDown();
				jQuery(this).parent().find(".accordion-head-sign i").addClass("icon-minus-sign").removeClass("icon-plus-sign");
				jQuery(this).parent().siblings("li").children(".accordion-content").slideUp();
				jQuery(this).parent().siblings("li").removeClass("active");
				jQuery(this).parent().siblings("li").find(".accordion-head-sign i").removeClass("icon-minus-sign").addClass("icon-plus-sign");
			}
		});
	});
	// Toggle
	jQuery("ul.tt-toggle li").each(function () {
		jQuery(this).children(".toggle-content").css('display', 'none');
		jQuery(this).find(".toggle-head-sign").html("&#43;");
		jQuery(this).children(".toggle-head").bind("click", function () {
			if (jQuery(this).parent().hasClass("active")) {
				jQuery(this).parent().removeClass("active");
			} else {
				jQuery(this).parent().addClass("active");
			}
			jQuery(this).find(".toggle-head-sign").html(function () {
				if (jQuery(this).parent().parent().hasClass("active")) {
					return "&minus;";
				} else {
					return "&#43;";
				}
			});
			jQuery(this).siblings(".toggle-content").slideToggle();
		});
	});
	jQuery("ul.tt-toggle").find(".toggle-content.active").siblings(".toggle-head").trigger('click');
	// Snap
	var snapper;
	function initSnapper() {
		if($(window).innerWidth() <= 959) {
			if(snapper === undefined) {
				snapper = new Snap({
					element: document.getElementById('frame_'),
					transitionSpeed: 0.6,
					disable: 'right'
				});
			} else {
				snapper.enable();
				}
			} else if(snapper !== undefined) {
				snapper.disable();
				snapper.close('left');
		}
	}
	$(window).resize(initSnapper);
	initSnapper();
	$("#header nav").prepend('<div id="open-left"><i class="icon-reorder"></i></div>');
	$("body").prepend('<div class="snap-drawers"><div class="snap-drawer snap-drawer-left"><ul></ul></div></div>');
	var a = $('.sf-menu').html();
	$(".snap-drawer ul").html(a);
	$('#open-left').click(function () {
		if ($('body').hasClass('snapjs-left')) {
			snapper.close('left');
		} else if ($('body:not(.snapjs-left)')) {
			snapper.open('left');
		} else {}
	});

	// ToTop
	jQuery('#toTop').click(function () {
		jQuery('body,html').animate({
			scrollTop: 0
		}, 1000);
	});
	jQuery("#toTop").addClass("hidett");
	jQuery(window).scroll(function () {
		if (jQuery(this).scrollTop() < 400) {
			jQuery("#toTop").addClass("hidett").removeClass("showtt");
		} else {
			jQuery("#toTop").removeClass("hidett").addClass("showtt");
		}
	});
	// Notification
	$(".notification-close").click(function () {
		$(this).parent().slideUp("slow");
		return false;
	});
	// FlexSlider
	if ($(".flex-slide-h")[0]) {
		jQuery('.flex-slide-h').flexslider({
			animation: "slide",
			direction: "horizontal",
			slideshowSpeed: 8000,
			animationSpeed: 1400,
			directionNav: true,
			controlNav: false,
			pauseOnHover: true,
			randomize: false,
			smoothHeight: true,
			keyboardNav: true,
			start: function(slider) {
				$('.flex-active-slide').find('h3').delay(100).addClass('effect').fadeIn(400);
				$('.flex-active-slide').find('p').delay(100).addClass('effectt').fadeIn(400);
			},
			before: function(slider) {
				$('.big-slider h3').removeClass('effect').addClass('Out').fadeOut('slow');
				$('.big-slider p').removeClass('effectt').addClass('Out').fadeOut('slow');
			},
			after: function(slider) {
				$('.flex-active-slide').find('h3').delay(100).addClass('effect').fadeIn(400).removeClass('Out');
				$('.flex-active-slide').find('p').delay(100).addClass('effectt').fadeIn(400).removeClass('Out');
			}
		});
	}
	if ($(".flex-slide-v")[0]) {
		jQuery('.flex-slide-h').flexslider({
			animation: "slide",
			direction: "horizontal",
			slideshowSpeed: 8000,
			animationSpeed: 1400,
			directionNav: true,
			controlNav: false,
			pauseOnHover: true,
			randomize: false,
			smoothHeight: true,
			keyboardNav: true,
			start: function(slider) {
				$('.flex-active-slide').find('h3').delay(100).addClass('effect').fadeIn(400);
				$('.flex-active-slide').find('p').delay(100).addClass('effectt').fadeIn(400);
			},
			before: function(slider) {
				$('.big-slider h3').removeClass('effect').addClass('Out').fadeOut('slow');
				$('.big-slider p').removeClass('effectt').addClass('Out').fadeOut('slow');
			},
			after: function(slider) {
				$('.flex-active-slide').find('h3').delay(100).addClass('effect').fadeIn(400).removeClass('Out');
				$('.flex-active-slide').find('p').delay(100).addClass('effectt').fadeIn(400).removeClass('Out');
			}
		});
	}
	if ($(".flex-slide-fade")[0]) {
		jQuery('.flex-slide-h').flexslider({
			animation: "slide",
			direction: "horizontal",
			slideshowSpeed: 8000,
			animationSpeed: 1400,
			directionNav: true,
			controlNav: false,
			pauseOnHover: true,
			randomize: false,
			smoothHeight: true,
			keyboardNav: true,
			start: function(slider) {
				$('.flex-active-slide').find('h3').delay(100).addClass('effect').fadeIn(400);
				$('.flex-active-slide').find('p').delay(100).addClass('effectt').fadeIn(400);
			},
			before: function(slider) {
				$('.big-slider h3').removeClass('effect').addClass('Out').fadeOut('slow');
				$('.big-slider p').removeClass('effectt').addClass('Out').fadeOut('slow');
			},
			after: function(slider) {
				$('.flex-active-slide').find('h3').delay(100).addClass('effect').fadeIn(400).removeClass('Out');
				$('.flex-active-slide').find('p').delay(100).addClass('effectt').fadeIn(400).removeClass('Out');
			}
		});
	}
	if ($(".projectslider")[0]) {
		jQuery('.projectslider').flexslider({
			animation: "fade",
			direction: "horizontal",
			slideshowSpeed: 8000,
			animationSpeed: 1000,
			directionNav: true,
			controlNav: false,
			pauseOnHover: true,
			initDelay: 0,
			randomize: false,
			smoothHeight: true,
			keyboardNav: false
		});
	}
	if ($("[class^='product_']")[0]) {
		jQuery('[class^="product_"]').flexslider({
			slideshow: false,
			touch: true,
			animation: "slide",
			direction: "horizontal",
			animationSpeed: 1000,
			directionNav: true,
			controlNav: false,
			randomize: false,
			smoothHeight: true
		});
	}
	if ($(".tst")[0]) {
		jQuery('.tst').flexslider({
			animation: "slide",
			direction: "horizontal",
			slideshowSpeed: 8000,
			animationSpeed: 1000,
			directionNav: true,
			controlNav: false,
			pauseOnHover: true,
			initDelay: 0,
			randomize: false,
			smoothHeight: true,
			keyboardNav: false
		});
	}
	if ($(".sec_testimonials")[0]) {
		jQuery('.sec_testimonials').flexslider({
			animation: "slide",
			direction: "horizontal",
			slideshowSpeed: 8000,
			animationSpeed: 1000,
			directionNav: true,
			controlNav: false,
			pauseOnHover: true,
			initDelay: 0,
			randomize: false,
			smoothHeight: true,
			keyboardNav: false
		});
	}
	if ($(".tstFade")[0]) {
		jQuery('.tstFade').flexslider({
			animation: "fade",
			slideshowSpeed: 8000,
			animationSpeed: 800,
			directionNav: true,
			controlNav: false,
			pauseOnHover: true,
			initDelay: 0,
			randomize: false,
			smoothHeight: true,
			keyboardNav: false
		});
	}
	// Nivo Slider
	if ($("#nivo-slider")[0]) {
		$('#nivo-slider').nivoSlider({pauseTime:5000});
	}
	// Cicular Slider
	if ($("#co-slider")[0]) {
		$('#co-slider').circleslider();
	}
	// Modern Slider
	if ($(".modern-slider")[0]) {
		$('.modern-slider').modernSlider({
			effect:'easeInOutElastic',
			pause:3000,
			autoplay:true
		});
		function methodToFixLayout( e ) {
			var widthmodern = $('#layout').width();
			$('.modern-slider, .modern-slider img').css('width', widthmodern + 'px');
		}
		$(window).load(methodToFixLayout);
		$(window).bind("resize", methodToFixLayout);
		$(window).bind("change", methodToFixLayout);
	}
	// iView Show
	if ($("#iview")[0]) {
		jQuery('#iview').iView({
			pauseTime: 7000,
			directionNav: false,
			controlNav: true,
			tooltipY: -15
		});
	}
	// jCarousel
	if ($(".portfolio-carousel")[0]) {
		jQuery(".portfolio-carousel").jCarouselLite({
			btnNext: ".portfolio-carousel .nexte",
			btnPrev: ".portfolio-carousel .preve",
			easing: "easeInOutExpo",
			visible: 4,
			scroll: 1,
			hoverPause: true,
			auto: 2000,
			speed: 800
		});
	}
	if ($(".magazine-carousel")[0]) {
		jQuery(".magazine-carousel").jCarouselLite({
			btnNext: ".magazine-carousel .nexte",
			btnPrev: ".magazine-carousel .preve",
			easing: "easeInOutBack",
			scroll: 1,
			hoverPause: true,
			auto: 3000,
			speed: 700
		});
	}
	if ($(".client-carousel")[0]) {
		jQuery(".client-carousel").jCarouselLite({
			btnNext: ".client-carousel .nexte",
			btnPrev: ".client-carousel .preve",
			easing: "easeInOutBack",
			visible: 4,
			scroll: 1,
			hoverPause: true,
			auto: 4000,
			speed: 600
		});
	}
	if ($(".products_carousel")[0]) {
		jQuery(".products_carousel").jCarouselLite({
			btnNext: ".products_carousel .nexte",
			btnPrev: ".products_carousel .preve",
			easing: "easeInOutExpo",
			visible: 4,
			scroll: 1,
			hoverPause: true,
			auto: 2000,
			speed: 800
		});
	}
	// Flickr, find your id from idgettr.com
	if ($("#flickr-photos")[0]) {
		$('#flickr-photos').jflickrfeed({
			limit: 9,
			qstrings: {
				id: '41813094@N06'
			},
			itemTemplate: '<li>' + '<a href="{{image_b}}" data-gal="lightbox[flickr]"><img src="{{image_s}}" alt="{{title}}" /></a>' + '</li>',
			itemCallback: function (data) {
				$("a[data-gal^='lightbox']").prettyPhoto({theme: 'dark_rounded'});
			}
		});
	}
	if ($("#flickr8")[0]) {
		$('#flickr8').jflickrfeed({
			limit: 8,
			qstrings: {
				id: '41813094@N06'
			},
			itemTemplate: '<li>' + '<a href="{{image_b}}" data-gal="lightbox[flickr]"><img src="{{image_s}}" alt="{{title}}" /></a>' + '</li>',
			itemCallback: function (data) {
				$("a[data-gal^='lightbox']").prettyPhoto({theme: 'dark_rounded'});
			}
		});
	}
	// prettyPhoto
	if ($("a[data-gal^='lightbox']")[0]) {
		$("a[data-gal^='lightbox']").prettyPhoto({
			animation_speed: 'normal',
			theme: 'dark_rounded',
			autoplay_slideshow: false,
			overlay_gallery: false,
			show_title: false
		});
	}
	// quicksand
	if ($(".filter")[0]) {
		var $portfolioClone = $(".portfolio").clone();
		$(".filter a").click(function (e) {
			$(".filter li").removeClass("current");
			var $filterClass = $(this).parent().attr("class");
			if ($filterClass === "all") {
				var $filteredPortfolio = $portfolioClone.find("li");
			} else {
				var $filteredPortfolio = $portfolioClone.find("li[data-type~=" + $filterClass + "]");
			}
			// Call quicksand
			$(".portfolio").quicksand($filteredPortfolio, {
				duration: 800,
				useScaling: 'true',
				easing: 'easeInOutCubic',
				adjustHeight: 'dynamic'
			}, function () {
				$(".portfolio a[data-gal^='lightbox']").prettyPhoto({
					animation_speed: 'normal',
					theme: 'dark_rounded',
					autoplay_slideshow: false,
					overlay_gallery: false,
					show_title: false
				});
			});
			$(this).parent().addClass("current");
			e.preventDefault();
		});
	}
	// ShopCart
	$(".shopping_bag").hover(function() {
		$('.view_cart_mini').fadeIn(400);
			}, function() {
		$('.view_cart_mini').fadeOut(400);
	});
	// Ajax Contact
	if ($("#contactForm")[0]) {
		$('#contactForm').submit(function () {
			$('#contactForm .error').remove();
			$('#contactForm .requiredField').removeClass('fielderror');
			$('#contactForm .requiredField').addClass('fieldtrue');
			$('#contactForm span strong').remove();
			var hasError = false;
			$('#contactForm .requiredField').each(function () {
				if (jQuery.trim($(this).val()) === '') {
					var labelText = $(this).prev('label').text();
					$(this).addClass('fielderror');
					$('#contactForm span').html('<strong>*Please fill out all fields.</strong>');
					hasError = true;
				} else if ($(this).hasClass('email')) {
					var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
					if (!emailReg.test(jQuery.trim($(this).val()))) {
						var labelText = $(this).prev('label').text();
						$(this).addClass('fielderror');
						$('#contactForm span').html('<strong>Is incorrect your email address</strong>');
						hasError = true;
					}
				}
			});
			if (!hasError) {
				$('#contactForm').slideDown('normal', function () {
					$("#contactForm #sendMessage").addClass('load-color');
					$("#contactForm #sendMessage").attr("disabled", "disabled").addClass("btn-success").val('Sending message. Please wait...');
				});
				var formInput = $(this).serialize();
				$.post($(this).attr('action'), formInput, function (data) {
					$('#contactForm').slideUp("normal", function () {
						$(this).before('<div class="notification-box notification-box-success"><p><i class="icon-ok"></i>Thanks!</strong> Your email was successfully sent. We check Our email all the time.</p></div>');
					});
				});
			}
			return false;
		});
	}
	if ($("#contactForm-widget")[0]) {
		$('#contactForm-widget').submit(function () {
			$('#contactForm-widget .error').remove();
			$('#contactForm-widget .requiredField').removeClass('fielderror');
			$('#contactForm-widget .requiredField').addClass('fieldtrue');
			$('#contactForm-widget span strong').remove();
			var hasError = false;
			$('#contactForm-widget .requiredField').each(function () {
				if (jQuery.trim($(this).val()) === '') {
					var labelText = $(this).prev('label').text();
					$(this).addClass('fielderror');
					$('#contactForm-widget span').html('<strong>*Please fill out all fields.</strong>');
					hasError = true;
				} else if ($(this).hasClass('email')) {
					var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
					if (!emailReg.test(jQuery.trim($(this).val()))) {
						var labelText = $(this).prev('label').text();
						$(this).addClass('fielderror');
						$('#contactForm-widget span').html('<strong>Is incorrect your email address</strong>');
						hasError = true;
					}
				}
			});
			if (!hasError) {
				$('#contactForm-widget').slideDown('normal', function () {
					$("#contactForm-widget #sendMessage").addClass('load-color');
					$("#contactForm-widget #sendMessage").attr("disabled", "disabled").val('Sending message. Please wait...');
					$('#contactForm-widget span').html('<i class="icon-spinner icon-spin"></i>');
				});
				var formInput = $(this).serialize();
				$.post($(this).attr('action'), formInput, function (data) {
					$('#contactForm-widget').slideUp("normal", function () {
						$(this).before('<div class="notification-box notification-box-success"><p><i class="icon-ok"></i>Thanks!</strong> Your email was successfully sent. We check Our email all the time, so we should be in touch soon.</p></div>');
					});
				});
			}
			return false;
		});
	}
	// Tipsy
	$('.toptip').tipsy({fade: true,gravity: 's'});
	$('.bottomtip').tipsy({fade: true,gravity: 'n'});
	$('.righttip').tipsy({fade: true,gravity: 'w'});
	$('.lefttip').tipsy({fade: true,gravity: 'e'});
	// Twitter API 1.1
	if ($(".tweet")[0]) {
		jQuery(".tweet").tweet({
			modpath: 'js/twitter/',
			username: 'behzadg1',
			page: 1,
			count: 3,
			loading_text: "<i class='icon-spinner icon-spin mi'></i>Loading Tweets..."
		});
		jQuery(".tweet li").prepend("<i class='icon-twitter'></i>");
	}
	// T20 Custom
	var w_width = $(window).width();
	if (w_width >= 960) {
		if ($(".animated")[0]) {
			jQuery('.animated').css('opacity', '0');
		}
		jQuery('.animt').each(function () {
			var $curr = jQuery(this);
			var $currOffset = $curr.attr('data-gen-offset');
			if ($currOffset === '' || $currOffset === 'undefined' || $currOffset === undefined) {
				$currOffset = 'bottom-in-view';
			}
			$curr.waypoint(function () {
				$curr.trigger('animt');
			}, {
				triggerOnce: true,
				offset: $currOffset
			});
		});
		jQuery('.animated').each(function () {
			var $curr = jQuery(this);
			$curr.bind('animt', function () {
				$curr.css('opacity', '');
				$curr.addClass($curr.data('gen'));
			});
		});
		jQuery('.animated').each(function () {
			var $curr = jQuery(this);
			var $currOffset = $curr.attr('data-gen-offset');
			if ($currOffset === '' || $currOffset === 'undefined' || $currOffset === undefined) {
				$currOffset = 'bottom-in-view';
			}
			$curr.waypoint(function () {
				$curr.trigger('animt');
			}, {
				triggerOnce: true,
				offset: $currOffset
			});
		});
	}
	// Progress Load
	if ($(".progress-bar > span")[0]) {
		$('.progress-bar > span').waypoint(function() {
			$(this).each(function() {
				$(this).animate({
					width: $(this).attr('rel') + "%"
				}, 800);
			});
		}, {
			triggerOnce: true,
			offset: 'bottom-in-view'
		});
	}
	// News Ticker
	if ($("ul#news")[0]) {
		jQuery("ul#news").liScroll({travelocity: 0.08});
	}
	// Sticky
	if ($(".my_sticky")[0]){
		$('.my_sticky').before('<div class="Corpse_Sticky"></div>');
		$(window).scroll(function(){
			var wind_scr = $(window).scrollTop();
			var window_width = $(window).width();
			var head_w = $('.my_sticky').height();
			if (window_width >= 959) {
				if(wind_scr < 200){
					if($('.my_sticky').data('sticky') === true){
						$('.my_sticky').data('sticky', false);
						$('.my_sticky').stop(true).animate({opacity : 0}, 300, function(){
							$('.my_sticky').removeClass('sticky');
							$('.my_sticky').stop(true).animate({opacity : 1}, 300);
							$('.Corpse_Sticky').css('padding-top', '');
						});
					}
				} else {
					if($('.my_sticky').data('sticky') === false || typeof $('.my_sticky').data('sticky') === 'undefined'){
						$('.my_sticky').data('sticky', true);
						$('.my_sticky').stop(true).animate({opacity : 0},300,function(){
							$('.my_sticky').addClass('sticky');
							$('.my_sticky.sticky').stop(true).animate({opacity : 1}, 300);
							$('.Corpse_Sticky').css('padding-top', head_w + 'px');
						});
					}
				}
			}
		});
		$(window).resize(function(){
			var window_width = $(window).width();
			if (window_width <= 959) {
				if($('.my_sticky').hasClass('sticky')){
					$('.my_sticky').removeClass('sticky');
					$('.my_sticky').stop(true).animate({opacity : 0}, 300, function(){
						$('.my_sticky').removeClass('sticky');
						$('.my_sticky').stop(true).animate({opacity : 1}, 300);
						$('.Corpse_Sticky').css('padding-top', '');
					});
				}
			}
		});
	}
	$.stellar({
		horizontalScrolling: false,
		verticalOffset: 0
	});
	// Landing Page
	if ($(".OneNav")[0]){
		$('body').plusAnchor({
			easing: 'easeInOutExpo',
			speed:  1000
		});
		$('.OneNav li').click(function(){
			$('.OneNav li.current').removeClass('current');
			$(this).addClass('current');
		});

		// Bind to scroll
		$(window).scroll(function(){
			var lastId,
				topMenu = $(".OneNav"),
				topMenuHeight = topMenu.outerHeight()+15,
				menuItems = topMenu.find("a"),
			scrollItems = menuItems.map(function(){
				var item = $($(this).attr("href"));
				if (item.length) { return item; }
			});
			var fromTop = $(this).scrollTop()+topMenuHeight;
			var cur = scrollItems.map(function(){
			if ($(this).offset().top < fromTop)
				return this;
			});
			// Get the id of the current element
			cur = cur[cur.length-1];
			var id = cur && cur.length ? cur[0].id : "";
		   
			if (lastId !== id) {
				lastId = id;
				// Set/remove active class
				menuItems
				.parent().removeClass("current")
				.end().filter("[href=#"+id+"]").parent().addClass("current");
			}                   
		});
	}
	// Scrollbars
	$("html").niceScroll({zindex:999,cursorborder:"",cursorborderradius:"2px",cursorcolor:"#191919",cursoropacitymin:.5});
	function initNice() {
		if($(window).innerWidth() <= 1000) {
			$('html').niceScroll().remove();
		} else {
			$("html").niceScroll({zindex:999,cursorborder:"",cursorborderradius:"2px",cursorcolor:"#191919",cursoropacitymin:.5});
		}
	}
	$(window).load(initNice);
	$(window).resize(initNice);
});
/* jQuery Waypoints - Copyright (c) 2011-2013 Caleb Troughton - https://github.com/imakewebthings/jquery-waypoints/blob/master/licenses.txt */
(function(){var t=[].indexOf||function(t){for(var e=0,n=this.length;e<n;e++){if(e in this&&this[e]===t)return e}return-1},e=[].slice;(function(t,e){if(typeof define==="function"&&define.amd){return define("waypoints",["jquery"],function(n){return e(n,t)})}else{return e(t.jQuery,t)}})(this,function(n,r){var i,o,l,s,f,u,a,c,h,d,p,y,v,w,g,m;i=n(r);c=t.call(r,"ontouchstart")>=0;s={horizontal:{},vertical:{}};f=1;a={};u="waypoints-context-id";p="resize.waypoints";y="scroll.waypoints";v=1;w="waypoints-waypoint-ids";g="waypoint";m="waypoints";o=function(){function t(t){var e=this;this.$element=t;this.element=t[0];this.didResize=false;this.didScroll=false;this.id="context"+f++;this.oldScroll={x:t.scrollLeft(),y:t.scrollTop()};this.waypoints={horizontal:{},vertical:{}};t.data(u,this.id);a[this.id]=this;t.bind(y,function(){var t;if(!(e.didScroll||c)){e.didScroll=true;t=function(){e.doScroll();return e.didScroll=false};return r.setTimeout(t,n[m].settings.scrollThrottle)}});t.bind(p,function(){var t;if(!e.didResize){e.didResize=true;t=function(){n[m]("refresh");return e.didResize=false};return r.setTimeout(t,n[m].settings.resizeThrottle)}})}t.prototype.doScroll=function(){var t,e=this;t={horizontal:{newScroll:this.$element.scrollLeft(),oldScroll:this.oldScroll.x,forward:"right",backward:"left"},vertical:{newScroll:this.$element.scrollTop(),oldScroll:this.oldScroll.y,forward:"down",backward:"up"}};if(c&&(!t.vertical.oldScroll||!t.vertical.newScroll)){n[m]("refresh")}n.each(t,function(t,r){var i,o,l;l=[];o=r.newScroll>r.oldScroll;i=o?r.forward:r.backward;n.each(e.waypoints[t],function(t,e){var n,i;if(r.oldScroll<(n=e.offset)&&n<=r.newScroll){return l.push(e)}else if(r.newScroll<(i=e.offset)&&i<=r.oldScroll){return l.push(e)}});l.sort(function(t,e){return t.offset-e.offset});if(!o){l.reverse()}return n.each(l,function(t,e){if(e.options.continuous||t===l.length-1){return e.trigger([i])}})});return this.oldScroll={x:t.horizontal.newScroll,y:t.vertical.newScroll}};t.prototype.refresh=function(){var t,e,r,i=this;r=n.isWindow(this.element);e=this.$element.offset();this.doScroll();t={horizontal:{contextOffset:r?0:e.left,contextScroll:r?0:this.oldScroll.x,contextDimension:this.$element.width(),oldScroll:this.oldScroll.x,forward:"right",backward:"left",offsetProp:"left"},vertical:{contextOffset:r?0:e.top,contextScroll:r?0:this.oldScroll.y,contextDimension:r?n[m]("viewportHeight"):this.$element.height(),oldScroll:this.oldScroll.y,forward:"down",backward:"up",offsetProp:"top"}};return n.each(t,function(t,e){return n.each(i.waypoints[t],function(t,r){var i,o,l,s,f;i=r.options.offset;l=r.offset;o=n.isWindow(r.element)?0:r.$element.offset()[e.offsetProp];if(n.isFunction(i)){i=i.apply(r.element)}else if(typeof i==="string"){i=parseFloat(i);if(r.options.offset.indexOf("%")>-1){i=Math.ceil(e.contextDimension*i/100)}}r.offset=o-e.contextOffset+e.contextScroll-i;if(r.options.onlyOnScroll&&l!=null||!r.enabled){return}if(l!==null&&l<(s=e.oldScroll)&&s<=r.offset){return r.trigger([e.backward])}else if(l!==null&&l>(f=e.oldScroll)&&f>=r.offset){return r.trigger([e.forward])}else if(l===null&&e.oldScroll>=r.offset){return r.trigger([e.forward])}})})};t.prototype.checkEmpty=function(){if(n.isEmptyObject(this.waypoints.horizontal)&&n.isEmptyObject(this.waypoints.vertical)){this.$element.unbind([p,y].join(" "));return delete a[this.id]}};return t}();l=function(){function t(t,e,r){var i,o;r=n.extend({},n.fn[g].defaults,r);if(r.offset==="bottom-in-view"){r.offset=function(){var t;t=n[m]("viewportHeight");if(!n.isWindow(e.element)){t=e.$element.height()}return t-n(this).outerHeight()}}this.$element=t;this.element=t[0];this.axis=r.horizontal?"horizontal":"vertical";this.callback=r.handler;this.context=e;this.enabled=r.enabled;this.id="waypoints"+v++;this.offset=null;this.options=r;e.waypoints[this.axis][this.id]=this;s[this.axis][this.id]=this;i=(o=t.data(w))!=null?o:[];i.push(this.id);t.data(w,i)}t.prototype.trigger=function(t){if(!this.enabled){return}if(this.callback!=null){this.callback.apply(this.element,t)}if(this.options.triggerOnce){return this.destroy()}};t.prototype.disable=function(){return this.enabled=false};t.prototype.enable=function(){this.context.refresh();return this.enabled=true};t.prototype.destroy=function(){delete s[this.axis][this.id];delete this.context.waypoints[this.axis][this.id];return this.context.checkEmpty()};t.getWaypointsByElement=function(t){var e,r;r=n(t).data(w);if(!r){return[]}e=n.extend({},s.horizontal,s.vertical);return n.map(r,function(t){return e[t]})};return t}();d={init:function(t,e){var r;if(e==null){e={}}if((r=e.handler)==null){e.handler=t}this.each(function(){var t,r,i,s;t=n(this);i=(s=e.context)!=null?s:n.fn[g].defaults.context;if(!n.isWindow(i)){i=t.closest(i)}i=n(i);r=a[i.data(u)];if(!r){r=new o(i)}return new l(t,r,e)});n[m]("refresh");return this},disable:function(){return d._invoke(this,"disable")},enable:function(){return d._invoke(this,"enable")},destroy:function(){return d._invoke(this,"destroy")},prev:function(t,e){return d._traverse.call(this,t,e,function(t,e,n){if(e>0){return t.push(n[e-1])}})},next:function(t,e){return d._traverse.call(this,t,e,function(t,e,n){if(e<n.length-1){return t.push(n[e+1])}})},_traverse:function(t,e,i){var o,l;if(t==null){t="vertical"}if(e==null){e=r}l=h.aggregate(e);o=[];this.each(function(){var e;e=n.inArray(this,l[t]);return i(o,e,l[t])});return this.pushStack(o)},_invoke:function(t,e){t.each(function(){var t;t=l.getWaypointsByElement(this);return n.each(t,function(t,n){n[e]();return true})});return this}};n.fn[g]=function(){var t,r;r=arguments[0],t=2<=arguments.length?e.call(arguments,1):[];if(d[r]){return d[r].apply(this,t)}else if(n.isFunction(r)){return d.init.apply(this,arguments)}else if(n.isPlainObject(r)){return d.init.apply(this,[null,r])}else if(!r){return n.error("jQuery Waypoints needs a callback function or handler option.")}else{return n.error("The "+r+" method does not exist in jQuery Waypoints.")}};n.fn[g].defaults={context:r,continuous:true,enabled:true,horizontal:false,offset:0,triggerOnce:false};h={refresh:function(){return n.each(a,function(t,e){return e.refresh()})},viewportHeight:function(){var t;return(t=r.innerHeight)!=null?t:i.height()},aggregate:function(t){var e,r,i;e=s;if(t){e=(i=a[n(t).data(u)])!=null?i.waypoints:void 0}if(!e){return[]}r={horizontal:[],vertical:[]};n.each(r,function(t,i){n.each(e[t],function(t,e){return i.push(e)});i.sort(function(t,e){return t.offset-e.offset});r[t]=n.map(i,function(t){return t.element});return r[t]=n.unique(r[t])});return r},above:function(t){if(t==null){t=r}return h._filter(t,"vertical",function(t,e){return e.offset<=t.oldScroll.y})},below:function(t){if(t==null){t=r}return h._filter(t,"vertical",function(t,e){return e.offset>t.oldScroll.y})},left:function(t){if(t==null){t=r}return h._filter(t,"horizontal",function(t,e){return e.offset<=t.oldScroll.x})},right:function(t){if(t==null){t=r}return h._filter(t,"horizontal",function(t,e){return e.offset>t.oldScroll.x})},enable:function(){return h._invoke("enable")},disable:function(){return h._invoke("disable")},destroy:function(){return h._invoke("destroy")},extendFn:function(t,e){return d[t]=e},_invoke:function(t){var e;e=n.extend({},s.vertical,s.horizontal);return n.each(e,function(e,n){n[t]();return true})},_filter:function(t,e,r){var i,o;i=a[n(t).data(u)];if(!i){return[]}o=[];n.each(i.waypoints[e],function(t,e){if(r(i,e)){return o.push(e)}});o.sort(function(t,e){return t.offset-e.offset});return n.map(o,function(t){return t.element})}};n[m]=function(){var t,n;n=arguments[0],t=2<=arguments.length?e.call(arguments,1):[];if(h[n]){return h[n].apply(null,t)}else{return h.aggregate.call(null,n)}};n[m].settings={resizeThrottle:100,scrollThrottle:30};return i.load(function(){return n[m]("refresh")})})}).call(this);