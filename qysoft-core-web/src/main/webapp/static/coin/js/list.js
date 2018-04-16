coin_name = l('Name'), coin_unit = l('Unit'), coin_url = "";

$(document).ready(function(){
    //$.getJSON("http://api.qukuai.com:8000/blocks?"+coin+"=1&start=5&callback=?",function(data) {
	$.getJSON(site_url+"api2/blocks?start=5&callback=?",function(data) {
        if(data.block) {
            for(var i=0;i<data.block.length;i++) {
							console.log(data.block[i].poolurl)
							if(data.block[i].poolurl == ""){
									blockurl = data.block[i].cb
								}else{
									blockurl = '<a href="' + data.block[i].poolurl+'" target="_blank">'+data.block[i].cb+'</a>'
								}
							//$("#block_table").append('<tr><td class="more1"><a href="'+ coin_url +'/block/'+data.block[i].hash+'">'+data.block[i].height+'</a></td><td class="more2">'+data.block[i].count+'</td><td class="more0">'+ getbtcvalue(data.block[i].v,6) + " " + coin_unit+'</td><td class="more3">'+data.block[i].size+'</td><td class="more4"><div class="resp-text-hash">'+blockurl+'</div></td><td class="more5">'+data.block[i].time+'</td><td class="more6">&nbsp;</td></tr>');
							$("#block_table").append('<tr><td class="more6">&nbsp;</td><td class="more1"><a href="'+ coin_url +'/block/'+data.block[i].hash+'">'+data.block[i].height+'</a></td><td class="more2">'+data.block[i].count+'</td><td class="more0">'+ getbtcvalue(data.block[i].v,6) + " " + coin_unit+'</td><td class="more3">'+data.block[i].size+'</td><td class="more5">'+data.block[i].time+'</td><td class="more6">&nbsp;</td></tr>');
            }
        }
    });
});
