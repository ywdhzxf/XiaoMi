		// 1.购物车事件
		$('.gwc').mouseover(function(){
			$('.cart').css('display','block')
		})
		$('.gwc').mouseout(function(){
			$('.cart').css('display','none')
		})

		// 2介绍条事件
		$(window).scroll(function(){
			if ($(document).scrollTop() >= 180){
		 		$('#jst').children().addClass('navbar-fixed-top')
		 	}else{
		 		$('#jst').children().removeClass('navbar-fixed-top')
		 	}

		})
		// 3 特效一
		$('#tx,.tx1_1').mouseover(function(){
			$('.tx1').css('display','block')
		})
		$('#tx,.tx1_1').mouseout(function(){
			$('.tx1').css('display','none')
		})
		// 4加减
		$('.jia').click(funcion(){
		 	$('input[name='m']'').attr("value",int(value)+1);
		 })


		