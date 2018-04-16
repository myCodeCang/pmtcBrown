var ws;
coin_name = ('Name'), coin_unit = ('Unit'), coin_url = "";

function datasort(ticker){
	var arrayObj = new Array();

	for(i in ticker) {
		if(i == 'HuoBi'){
			if(String.locale == "en_US"){
				arrayObj[2] = ticker[i];
			}else{
				arrayObj[0] = ticker[i];
			}
		}else if(i == 'OKCoin'){

			if(String.locale == "en_US"){
				arrayObj[3] = ticker[i];
			}else{
				arrayObj[1] = ticker[i];
			}
		}else if(i == 'BtcChina'){
			if(String.locale == "en_US"){
				arrayObj[4] = ticker[i];
			}else{
				arrayObj[2] = ticker[i];
			}
		}else if(i == 'btc-e'){
			if(String.locale == "en_US"){
				arrayObj[0] = ticker[i];
			}else{
				arrayObj[3] = ticker[i];
			}
		}else if(i == 'Bitstamp'){
			if(String.locale == "en_US"){
				arrayObj[1] = ticker[i];
			}else{
				arrayObj[4] = ticker[i];
			}
		}else if(i == 'abwang'){//add by gabin
			if(String.locale == "en_US"){
				arrayObj[1] = ticker[i];
			}else{
				arrayObj[4] = ticker[i];
			}
		}
		
	}
	return arrayObj;
}

//gabin：这个函数是用于首页的数据刷新的
function ws_init(bh)
{
	ws = new WebSocket("ws://api.qukuai.com:8000/ws");
	if(ws)
	{
		ws.onmessage = function(data){
			var data = JSON.parse(data.data);
			if(null!=data)
			{
				//info
				
				if(null!=data.info)
				{
					$("#poollength").text(data.info.poollength);
					$("#map_poollength").text(data.info.poollength);
					
					if(data.info.ticker != "")
					{
						var ticker = '';
						var arrayObj = new Array();
						arrayObj = datasort(data.info.ticker)
						for(k=0;k<arrayObj.length;k++){
							if(typeof(arrayObj[k]) == 'undefined'){
								continue;
							}
							if(String.locale == "en_US"){
								var mname = arrayObj[k][3];
								var mp = arrayObj[k][4];
								//price = price + parseInt(data.ticker[i][1]);
								var totalr = mp* data.moneysupply/1000000;
							}else{
								var mname = arrayObj[k][0];
								if(mname == 'btc-e' || mname == 'Bitstamp'){
									var mp = arrayObj[k][1] + " ($" + arrayObj[k][4] + ")";
								}else{
									var mp = arrayObj[k][1];
								}
								//price = price + parseInt(data.ticker[i][1]);
								var totalr = mp* data.moneysupply/10000;
							}
							ticker = ticker +'<div class="data-l"><a href="' + arrayObj[k][2] + '" target="_blank">' + mname + '</a></div><div class="data-r">'+l("Symbol")+" "+ mp + '</div>';
						}
						$("#price").html(ticker);
					}
				}
				
				//block

				if(null != data.block && data.block != "")
				{
					if(typeof(data.block.poolurl) == "undefined" || data.block.poolurl == ""){
						blockurl = data.block.cb
					}else{
						blockurl = '<a href="' + data.block.poolurl +'" target="_blank">'+data.block.cb+'</a>'
					}
					$('<tr><td class="t0"><div>&nbsp;</div></td><td class="t1"><div><a href="'+ coin_url +'/block/'+data.block.hash+'">'+data.block.height+'</a></div></td><td class="t2"><div>'+data.block.count+'</div></td><td class="t6"><div>'+getbtcvalue(data.block.v,6)+ ' '+ coin_unit +'</div></td><td class="t3"><div>'+data.block.size+'</div></td><td class="t4"><div class="resp-text-hash">'+blockurl+'</div></td><td class="t5"><div>'+data.block.time+'</div></td><td class="t6"><div>&nbsp;</div></td></tr>').insertBefore($("#blk_tb tbody tr:first")).find("div").hide().slideDown("slow");
					//$('<tr><td><div><a href="'+ coin_url +'/block/'+data.block.hash+'">'+data.block.height+'</a></div></td><td><div>'+data.block.count+'</div></td><td><div>'+data.block.time+'</div></td><td class="resp-block-size"><div>'+data.block.size+'</div></td><td><div>'+data.block.cb+'</div></td></tr>').insertAfter($("#blk_tb tr:first")).find("div").hide().slideDown("slow");
					$("#blk_tb tbody tr:last-child").remove();
					$('#blk_tb tr:last-child td').css("border","none");
				}
				//tx

				if(null != data.tx && data.tx.length >0 )
				{
					_do = true;
					for(i in data.tx)
					{
						if(parseInt(data.tx[i].r) >= 2 && _do)
						{
							for(var j=0; j<$('#tx_tb').find('tr').length-2; j++)
							{
								var val = parseInt($('#tx_tb tr:eq('+j+') td:eq(1)').text().substring(1,2))+1;
								$('#tab-tx tr:eq('+j+') td:eq(1)').text("<"+val+l('Minute'));
							}
							_do = false;
						}
						$('<tr><td class="t0"><div>&nbsp;</div></td><td class="t7"><div class="resp-text-hash">'+data.tx[i].vin_a+'</div></td><td class="t8"><div><img src="/static/images/in.png"></div></td><td class="t7-1"><div class="resp-text-hash">'+data.tx[i].vout_a+'</div></td><td class="t9"><div>&lt;'+data.tx[i].r+l('Minute')+'</div></td><td class="t10"><div>'+getbtcvalue(data.tx[i].v)+ ' '+ coin_unit +'</div></td><td class="t11"><div><a href="'+ coin_url +'/tx/' + data.tx[i].id + '">'+l('Details')+'</a></div></td><td class="t00"><div>&nbsp;</div></td></tr>').insertBefore($("#tab-tx tr:first")).find("div").hide().slideDown("slow").click(function(){
							var href = $(this).parent().parent().find('a').attr('href');
							window.location.href = href;
							});
						//$('<tr><td><div class="resp-text-hash"><a href="'+ coin_url +'/tx/' + data.tx[i].id + '">' +data.tx[i].id+ '</a></div></td><td class="resp-block-size">&lt;'+data.tx[i].r+'分钟</td><td><div>'+getbtcvalue(data.tx[i].v)+ ' '+ coin_unit +'</td></div></tr>').insertBefore($("#tx_tb tr:first")).find("div").hide().slideDown("slow");
						$('#tab-tx tr:last-child').remove();
						$('#tab-tx tr:last-child td').css("border","none");
					}
				}
			}
		};
		ws.onopen = function () {
			ws.send('{"bh":"'+bh+'"}');
		}
	}

}


$(document).ready(function(){
	$(".tag").mouseover(function(){
		$(this).find("img").attr('src','/static/images/jia1.png')
	}).mouseout(function(){
		$(this).find('img').attr('src','/static/images/jia.png')
	})
	var bh = 0;
	$(".more").mousemove(function(){
		$(this).find('img').attr('src','/static/images/jtr2.png')
	}).mouseout(function(){
		$(this).find('img').attr('src','/static/images/jtr.png')
	})
	$('.search').focus(function(){
		$('.search-error').remove()
	})
    //$.getJSON("http://api.qukuai.com:8000/info?"+coin+"=1&callback=?",function(data) {
    // $.getJSON(site_url+"api2/info?callback=?",function(data) {
		// 	var ticker = '';
		// 	var price = 0;
		// 	var arrayObj = new Array();
		// 	arrayObj = datasort(data.ticker)
		// 	for(k=0;k<arrayObj.length;k++){
		// 		if(typeof(arrayObj[k]) == 'undefined'){
		// 			continue;
		// 		}
		// 		if(String.locale == "en_US"){
		// 			var mname = arrayObj[k][3];
		// 			var mp = arrayObj[k][4];
		// 			//price = price + parseInt(data.ticker[i][1]);
		// 			var totalr = mp* data.moneysupply/1000000;
		// 		}else{
		// 			var mname = arrayObj[k][0];
		// 			if(mname == 'btc-e' || mname == 'Bitstamp'){
		// 				var mp = arrayObj[k][1] + " ($" + arrayObj[k][4] + ")";
		// 			}else{
		// 				var mp = arrayObj[k][1];
		// 			}
		// 			//price = price + parseInt(data.ticker[i][1]);
		// 			var totalr = mp* data.moneysupply/10000;
		// 		}
		// 		ticker = ticker +'<div class="data-l"><a href="' + arrayObj[k][2] + '" target="_blank">' + mname + '</a></div><div class="data-r">'+l("Symbol")+" "+ mp + '</div>';
		// 	}
    //
		// 	$("#data").append('<div class="data-l">'+l('Un_Tx')+'</div><div class="data-r" id="poollength">'+ data.poollength +'</div>');
		// 	$("#data").append('<div class="data-l">'+l('Difficulty')+'</div><div class="data-r">'+ data.difficulty +'</div>');
		// 	//$("#data").append('<div class="data-l">'+l('Total')+'</div><div class="data-r">'+ data.moneysupply + ' ' + coin_unit + '</div>');
		// 	$("#data").append('<div class="data-l">'+l('Total_market')+'</div><div class="data-r">'+l("Symbol")+" "+ Math.round(totalr) +l("Number")+'</div>');
		// 	$("#map_hash").text(Math.round(data.hashps/1024/1024)+" MH/s")
		// 	$("#map_market").text(l("Symbol")+" "+ Math.round(totalr) +l("Number"))
		// 	$("#map_diff").text(data.difficulty)
		// 	$("#price").html(ticker)
		// 	var miner_pool = '';
		// 	for(i in data.pools)
		// 	{
		// 		for(key in data.pools[i])
		// 			if(data.pools[i][key]["poolurl"] == ""){
		// 				blockurl = key
		// 			}else{
		// 				blockurl = '<a href="' + data.pools[i][key]["poolurl"]+'" target="_blank">'+key+'</a>'
		// 			}
		// 			miner_pool = miner_pool + '<div class="data-l">'+blockurl+'</div><div class="data-r">' + data.pools[i][key]["scale"]+'%</div>';
		// 	}
		// 	$("#stress_top").html(miner_pool)
		// 	//console.log(data.top)
		// 	var balance = '';
		// 	for(i in data.top)
		// 	{
		// 			balance = balance + '<div class="data-l bl resp-top-addr"><a href="'+ coin_url +'/address/'+data.top[i].a+'">'+data.top[i].a+'</a></div><div class="data-r br">'+getbtcvalue(data.top[i].b,6)+ ' '+ coin_unit +'</div>';
		// 	}
		// 	$("#balance").html(balance)
    //
    // });
	//$.getJSON("http://api.qukuai.com:8000/blocks?"+coin+"=1&callback=?",function(data) {
	$.getJSON(site_url+"api2/blocks?callback=?",function(data) {    
    if(data.block) {
			bh = data.block[0].height;
            for(var i=0;i<data.block.length;i++) {
								if(data.block[i]["poolurl"] == ""){
									blockurl = data.block[i].cb
								}else{
									blockurl = '<a href="' + data.block[i]["poolurl"]+'" target="_blank">'+data.block[i].cb+'</a>'
								}
								$("#blk_tb").append('<tr><td class="t0">&nbsp;</td><td class="t1"><a href="'+ coin_url +'/block/'+data.block[i].hash+'">'+data.block[i].height+'</a></td><td class="t2">'+data.block[i].count+'</td><td class="t6">'+getbtcvalue(data.block[i].v,6)+ ' '+ coin_unit +'</td><td class="t3">'+data.block[i].size+'</td><!--td class="t4"><div class="resp-text-hash">'+blockurl+'<div></td--><td class="t5">'+data.block[i].time+'</td><td class="t0">&nbsp;</td></tr>');
            }
        }
		$('#blk_tb tr:last-child td').css("border","none");
		$("#blk_hd").css('display', 'block');
	//ws_init(bh);//bug:暂时注释掉.这个函数同时刷新最新区块和最新交易，刷区块的方法是提交本地的最大区块高度，以求取+1的高度的那个区块。
    });
	setTimeout(function () {
		//$.getJSON("http://api.qukuai.com:8000/txs?"+coin+"=1&callback=?", function(data){
		$.getJSON(site_url+"api2/txs?callback=?", function(data){

			if(data.tx)
			{
				last_tx_time = data.tx[0].r;
				for(i in data.tx)
				{
					if(data.tx[i].vout_a == "unrecognize" && data.tx[i].v == 0) vout_a = l('Unrecognize'); else vout_a = data.tx[i].vout_a;
					var tx_info = $('<tr><td class="t0">&nbsp;</td><td class="t7"><div class="resp-text-hash">'+(data.tx[i].vin_a=='新区块奖励'?l('BlockReward'):data.tx[i].vin_a)+'</div></td><td class="t8"><img src="/static/images/in.png"></td><td class="t7-1"><div class="resp-text-hash">'+vout_a+'</div></td><td class="t9">&lt;'+data.tx[i].r+l('Minute')+'</td><td class="t10">'+getbtcvalue(data.tx[i].v)+ ' '+ coin_unit +'</td><td class="t11"><a href="'+ coin_url +'/tx/' + data.tx[i].id + '">'+l('Details')+'</a></td><td class="t00">&nbsp;</td></tr>').click(function(){
						var href = $(this).find('a').attr('href');
						window.location.href = href;
					})
					$("#tab-tx").append(tx_info);
					//$("#tab-tx").append('<tr><td><div class="resp-text-hash"><a href="'+ coin_url +'/tx/' + data.tx[i].id + '">' +data.tx[i].id+ '</a></div></td><td">&lt;'+data.tx[i].r+'分钟</td><td><div>'+getbtcvalue(data.tx[i].v)+ ' '+ coin_unit +'</td></div></tr>');
				}
			}
			//$("#tx_hd").css('display', 'block');
		});
	}, 5);
});
