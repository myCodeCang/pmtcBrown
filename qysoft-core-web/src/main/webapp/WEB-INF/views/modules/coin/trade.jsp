<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><spring:message code="liulanqi"/></title>
    <meta name="viewport"
          content="width=320, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0 ,user-scalable = no">
    <meta name="keywords" content="DomainQianbao">
    <!-- Bootstrap -->
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="stylesheet" href="${ctxStatic}/coin/css/bootstrap.css">
    <link rel="stylesheet" href="${ctxStatic}/coin/css/base.css">
    <script async="" src="${ctxStatic}/coin/js/analytics.js"></script>
    <script src="${ctxStatic}/coin/js/jquery.min.js"></script>
    <script src="${ctxStatic}/coin/js/jquery.cookie.js"></script>
    <script src="${ctxStatic}/coin/js/bootstrap.min.js"></script>
    <script src="${ctxStatic}/coin/js/l10n.min.js"></script>
    <script src="${ctxStatic}/coin/js/base.js"></script>

</head>
<body>


<!--  navbar -->
<div class="navbar navbar-inverse">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu">
            <img src="${ctxStatic}/coin/images/menu.png">
        </button>
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#search_box">
            <img src="${ctxStatic}/coin/images/search.png">
        </button>
        <a class="navbar-brand hidden-sm qukuai" href="/f/coin/index">
            <img src="${ctxStatic}/coin/images/p_logo.png" id="logo-mini">
            <script>
                </script>
            <spring:message code="qukuai"/></a>
        <!--a class="navbar-brand hidden-sm hidden-xs "
            href="#">图表</a>
        <a class="navbar-brand hidden-sm hidden-xs "
            href="#">API</a>
        <a class="navbar-brand hidden-sm hidden-xs"
            href="https://qianbao.qukuai.com/" target="_blank">快钱包</a>
        <a class="navbar-brand hidden-sm hidden-xs"
            href="javascript:;" id="node">节点分布</a-->
    </div>
    <ul class="nav navbar-nav navbar-right hidden-xs" id="lang">
        <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="javascript:void(0)">Language &nbsp;&nbsp;&nbsp;&nbsp;<b
                    class="caret"></b></a>
            <ul class="dropdown-menu">
                <li><a style="cursor:pointer" onclick="uploadlang('en_US')">English Site</a></li>
                <li><a style="cursor:pointer" onclick="uploadlang('zh_CN')">中文站</a></li>
                <li><a style="cursor:pointer" onclick="uploadlang('zh_HK')">繁體站</a></li>
            </ul>
        </li>
    </ul>


    <div class="navbar-collapse collapse" id="search_box">
        <ul class="nav navbar-nav">
            <li class="search_p">
                <form role="search" action="/search" method="GET">
                    <input name="search" placeholder="<spring:message code="sousuo"/>" id="search_title2" class="form-control phone">
                    <button class="phone_btn" type="submit">
                        <script>
                           </script>
                        搜索
                    </button>
                </form>
            </li>
        </ul>
    </div>
    <div class="navbar-collapse collapse" id="menu">
        <ul class="nav navbar-nav" id="coins">
            <!--li class="active"><a href="./index_files/index.html" class="coin">BTC</a></li>
            <li class=""><a href="http://qukuai.com/ltc" class="coin">LTC</a></li>
            <li class=""><a href="http://qukuai.com/api" class="coin">API</a></li>
            <li class=""><a href="http://qukuai.com/charts" class="coin">图表</a></li>
            <li class="qianbao"><a href="https://domainqianbao/">快钱包</a></li-->

            <li><a onclick="uploadlang('en_US')">English Site</a></li>
            <li><a onclick="uploadlang('zh_CN')">中文站</a></li>
            <li><a onclick="uploadlang('zh_HK')">繁體站</a></li>

        </ul>
    </div>
</div>
<div class="container logo-box hidden-xs">

    <div class="logo">
        <div class="logo-img">
            <a href="/f/coin/index" tppabs="http://PMTCcoin.io/">
                <%--<img src="${ctxStatic}/coin/images/logo.png" tppabs="http://PMTCcoin.io/${ctxStatic}/images/logo.png">--%>
            </a></div>

        <div class="coin-box" id="coins2" style="display:none"></div>
    </div>

    <div class="search-box">

        <form role="search" action="/f/coin/search" tppabs="http://PMTCcoin.io/search?search=" method="GET">
            <button class="search-btn" type="submit">
                <div class="button-y"><img src="${ctxStatic}/coin/images/fdj.png"
                                           tppabs="http://PMTCcoin.io/${ctxStatic}/images/fdj.png"></div>
            </button>
            <input value="trade" name="url" type="hidden">
            <input name="search" placeholder="<spring:message code="sousuo"/>" id="search_title" class="form-control search">
        </form>
    </div>
</div>
<%--<script>--%>
    <%--document.getElementById("search_title").setAttribute("placeholder", l('search_title'));--%>
    <%--document.getElementById("search_title2").setAttribute("placeholder", l('search_title'));--%>
<%--</script>--%>
<input id="message" type="hidden"  value="${message}">
<input id="messages" type="hidden"  value="<spring:message code="message"/>">
<%--<script>--%>
    <%--if ($("#message").val() != "") {--%>
        <%--alert($("#messages").val());--%>
        <%--$("#message").val("");--%>
    <%--}--%>
<%--</script>--%>
<div class="container main ">
    <div class="row">

        <div class="all" id="all">
            <div class="all-title-box">
                <div class="all-title">
                    <script>/*document.write*/
                    </script>
                    <spring:message code="jiaoyi"/>
                </div>
                <%--<div class="details"><a href="javascript:;" id="det">交易细节</a></div>--%>
            </div>
            <div class="tx-info  tx-bgimg-btc " id="tx_info">
                <div class="info-left"><spring:message code="haxizhi"/></div>
                <div class="info-right ddd">${hashCode}</div>
                <div class="info-left"><spring:message code="zhuanchuzong"/></div>
                <div class="info-right fwb">${trade.rollOut} ${fns:getConfig("coinName")}</div>
                <div class="info-left"><spring:message code="shouxufei"/></div>
                <div class="info-right fwb">0.01 ${fns:getConfig("coinName")}</div>
                <div class="info-left"><spring:message code="baohanqukuai"/></div>
                <div class="info-right">${trade.blockId}

                </div>
                <div class="info-left"><spring:message code="jieshoushijian"/></div>
                <div class="info-right"><fmt:formatDate value="${trade.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
                <div class="info-left"><spring:message code="querencishu"/></div>
                <div class="info-right fwb">
                    <div class="ok_num">${trade.confirmNum}</div>
                    <img src="${ctxStatic}/coin/images/tx_ok.png" class="ok_img"></div>
            </div>
            <div class="clearfix"></div>
            <div class="addrs">
                <div class="addrs-left" id="left">
                    <div class="left-top" style="height: 100px;">
                        <div class="center-l" id="left_info" style="margin-top: -10px;">
                                <div class="tx-addr">
                                    <div class="subaddr"><a href="/f/coin/address?address=${trade.hashCodeLeft=="新区块奖励" || trade.hashCodeLeft=="新區塊獎勵" || trade.hashCodeLeft=="Newly Generated Coins" ? trade.hashCodeRight : trade.hashCodeLeft}">${trade.hashCodeLeft}</a>
                                    </div>
                                    <span class="details-word" style="display: none;">（<span class="in"><a class="in"
                                                                                                           href=""><spring:message code="zhuanru"/></a></span>）</span>
                                </div>
                                <div class="tx-num">${trade.rollOut} ${fns:getConfig("coinName")}</div>
                        </div>
                    </div>
                    <div class="tx-mord-box" id="left_more"></div>
                </div>
                <div class="addrs-img"><img src="${ctxStatic}/coin/images/tx_jt.png"></div>
                <div class="addrs-right" id="right">
                    <div class="right-top" style="height: 100px;">
                        <div class="center-r" id="right_info" style="margin-top: -20px;">
                                <div class="tx-addr">
                                    <div class="subaddr"><a href="/f/coin/address?address=${trade.hashCodeRight}">${trade.hashCodeRight}</a>
                                    </div>
                                    <span class="details-word" style="display: none;">（<span class="out"><a class="out"
                                                                                                            href=""><spring:message code="zhuanchu"/></a></span>）</span>
                                </div>
                                <div class="tx-num fwb in">${trade.rollOut} ${fns:getConfig("coinName")}</div>
                        </div>
                    </div>
                    <div class="tx-mord-box" id="right_more"></div>
                </div>
            </div>
            <div class="clearfix mb100"></div>
        </div>

    </div>

</div>
<div class="container footer">
    <div class="foot">© 2016 <span>Powered By <script>
    </script></span> All rights reserved
        &nbsp;&nbsp;
    </div>
</div>

<!--[if lt IE 9]>
<script src="${ctxStatic}/js/html5shiv.min.js-v=bc0679a1f805567fd478cbc0c845c075"
        tppabs="http://PMTCcoin.io/${ctxStatic}/js/html5shiv.min.js?v=bc0679a1f805567fd478cbc0c845c075"></script>
<script src="${ctxStatic}/js/respond.min.js-v=44ccd9c8f8438737612f35923c12135c"
        tppabs="http://PMTCcoin.io/${ctxStatic}/js/respond.min.js?v=44ccd9c8f8438737612f35923c12135c"></script>
<![endif]-->



<%--<script src="${ctxStatic}/js/bootstrap-dialog.min.js"--%>
        <%--tppabs="http://PMTCcoin.io/${ctxStatic}/js/bootstrap-dialog.min.js"></script>--%>
<%--<script src="${ctxStatic}/coin/js/index.js" tppabs="http://PMTCcoin.io/${ctxStatic}/js/index.js"></script>--%>
</body>
</html>
