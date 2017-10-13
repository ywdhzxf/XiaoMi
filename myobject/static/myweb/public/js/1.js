


		// 1.购物车事件
		$('.gwc').mouseover(function(){
			$('.cart').css('display','block')
		})
		$('.gwc').mouseout(function(){
			$('.cart').css('display','none')
		})
		// 2 特效一
		$('#tx,.tx1_1').mouseover(function(){
			$('.tx1').css('display','block')
		})
		$('#tx,.tx1_1').mouseout(function(){
			$('.tx1').css('display','none')
		})
		// 3 特效二
		$('.kd').mouseover(function(){
			$('.tx2').css('display','block')
		})
		$('.kd').mouseout(function(){
			$('.tx2').css('display','none')
		})



		$('.mx_2').click(function(){
			$('.mxdp_1').removeClass('hidden').siblings().addClass('hidden')
		})
		
		$('.mx_1').click(function(){
			$('.mxdp_2').removeClass('hidden').siblings().addClass('hidden');
		})

		// $('#mxdp_2').removeClass('hidden');
		// $('.mxdp_1').addClass('hidden');



		