
// 计算总价

	function jisuan(){
		var ids = [];
		// 总数量
		var sum = 0;
		// 选择商品量
		var one = 0;
		// 总价
		var num = 0;
		var inps = document.getElementsByName('xuan');

	    var x = document.getElementsByName('xiaoji');

	    for (var i = x.length - 1; i >= 0; i--) {
	        console.log($(x[i]).text());
	        if(inps[i].checked){
	        num = num +  parseInt($(x[i]).text());
	        console.log($(inps[i]).attr('gid'));
	        ids.push($(inps[i]).attr('gid'));
	        one += 1;
	        }
	        sum +=1;
	        
	    };
	    $('.zj').html(num);
	    $('.spzsl').html(sum);
	    $('.xzspl').html(one);
	    return ids;
	}




// 选择
	function func(a){
		//获取元素
		var inps = document.getElementsByName('xuan');
    	var x = document.getElementsByName('zj');
    	var sum = 0;

		//遍历
		for (var i = 0; i < inps.length; i++) {
		
			switch(a){
				case 1:
					inps[i].checked = true;
    				jisuan();
					break;
				case 2:
					inps[i].checked = false;
					$('.zj').html(0);
					break;
				case 3:
					inps[i].checked = !inps[i].checked;
					jisuan();
					break;
			}
		};

		
	}
