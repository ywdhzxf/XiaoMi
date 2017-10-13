
	
		// 1.购物车事件
		$('.gwc').mouseover(function(){
			$('.cart').css('display','block')
		})
		$('.gwc').mouseout(function(){
			$('.cart').css('display','none')
		})

		//2手机图片右侧边框处理
		for (var i = $(".goods").length - 1; i >= 0; i--) {
			if((i+1)%4==0){
				$(".goods:eq("+i+")").css('border-right','0')
			}
		};
		// 3 特效一
		$('#tx,.tx1_1').mouseover(function(){
			$('.tx1').css('display','block')
		})
		$('#tx,.tx1_1').mouseout(function(){
			$('.tx1').css('display','none')
		})
		// 下拉框收起隐藏事件
		$(".yinc").click(function(){
			var i = $(this)
			var cur = i.parents('.hh').siblings();
			if(cur.css('display') == 'block'){
				cur.css('display', 'none');
				i.children('img').attr('src','./image_xq/none.png')
			}else{
				cur.css('display', 'block');
				i.children('img').attr('src','./image_xq/block.png')
			}

		});