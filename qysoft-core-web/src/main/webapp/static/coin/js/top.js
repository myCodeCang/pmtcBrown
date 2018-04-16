coin_name = l('Name'), coin_unit = l('Unit'), coin_url = "";

$(document).ready(function(){
    //$.getJSON("http://api.qukuai.com:8000/topaddress?callback=?",function(data) {
	$.getJSON(site_url+"api2/topaddress?callback=?",function(data) {
        $("#tx_info").html('<div class="info-left">'+l('Total')+'</div><div class="info-right fwb">'+ getbtcvalue(data.total) + ' ' + coin_unit + '</div>' );
        if(data.lweek && data.lmonth) {
            if(data.lweek > 0) {
                $("#tx_info").append('<div class="info-left">'+l('Last_Week')+'</div><div class="info-right in fwb">+'+ data.lweek +'%</div>');
            } else {
								$("#tx_info").append('<div class="info-left">'+l('Last_Week')+'</div><div class="info-right out fwb">'+ data.lweek +'%</div>');
            }
            if(data.lmonth > 0) {
								$("#tx_info").append('<div class="info-left">'+l('Last_Month')+'</div><div class="info-right in fwb">+'+ data.lmonth +'%</div>');
            } else {
								$("#tx_info").append('<div class="info-left">'+l('Last_Month')+'</div><div class="info-right out fwb">'+ data.lmonth +'%</div>');
            }
        }
				var tbody= '';
				
        if(data.a) {
            for(var i=0;i<data.a.length;i++) {
							var td = '';
							if(i == 0){
								tbody = '<tr class="first">';
								td = "in"
							}else{
								tbody = '<tr>';
							}
							$("#a_table").append(tbody + '<td class="td1">'+(i+1)+'</td><td class="td2"><a href="/address/'+data.a[i].a+'">'+data.a[i].a+'</a></td><td class="td3 '+td+'">'+getbtcvalue(data.a[i].b,6)+ ' ' + coin_unit + '</td><td class="td4">'+data.a[i].l+'</td><td class="td5">&nbsp;</td></tr>');
            }
        }
    });
});
