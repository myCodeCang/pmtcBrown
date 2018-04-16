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
    <script src="${ctxStatic}/coin/js/jquery.base64.js"></script>

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
                <form role="search" action="/f/coin/search" method="GET">
                    <input name="search" placeholder="<spring:message code="sousuo"/>" id="search_title2"
                           class="form-control phone">
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
            <input value="address" name="url" type="hidden">
            <input name="search" placeholder="<spring:message code="sousuo"/>" id="search_title"
                   class="form-control search">
        </form>
    </div>
</div>
<%--<script>--%>
    <%--document.getElementById("search_title").setAttribute("placeholder", l('search_title'));--%>
    <%--document.getElementById("search_title2").setAttribute("placeholder", l('search_title'));--%>
<%--</script>--%>
<input id="message" type="hidden" value="${message}">
<input id="messages" type="hidden" value="<spring:message code="message"/>">
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
                <div class="all-title" id="addr-title">
                    <script>/*document.write*/
                    </script>
                    <spring:message code="dizhi"/>
                </div>
            </div>
            <div class="tx-info addr-bgimg-btc min-h mb22" id="tx_info">
                <div class="info-left"><spring:message code="dizhi"/></div>
                <div class="info-right fwb ddd" id="addr">${address}</div>
                <div class="info-left"><spring:message code="jiaoyicishu"/></div>
                <div class="info-right">${num}</div>
                <div class="info-left"><spring:message code="zhuanruzonge"/></div>
                <div class="info-right">${allMoney} PMTC</div>
                <div class="info-left"><spring:message code="yue"/></div>
                <div class="info-right in fwb">${money} PMTC</div>
                <div class="info-left"><spring:message code="yuepaiming"/></div>
                <div class="info-right">-- <span></span></div>
                <div class="qr" id="code">
                    <canvas width="150" height="150"></canvas>
                </div>
            </div>
            <div class="clearfix"></div>
            <c:forEach items="${lccTrades}" var="trade" varStatus="sta">
                <div class="addrs mt20">
                    <div class="tx-boxs">
                        <div class="tx-hash">
                            <div class="hash-left"><span id="r${sta.index}"></span>
                            </div>
                            <script>
                                $("#r${sta.index}").html($.base64.encode('${trade.hashCodeLeft}'));
                            </script>
                            <div class="tx-time hidden-xs"><fmt:formatDate value="${trade.createDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></div>
                        </div>
                        <div class="addr-box">
                            <div class="addr-addrs">
                                <div class="addrs-left">
                                    <div class="left-top addr-left" style="height: 20px;">
                                        <div class="center-l" style="margin-top: 0px;">
                                            <div class="tx-addr"><a href="/f/coin/address?address=${trade.hashCodeLeft}">${trade.hashCodeLeft}</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="addrs-img addr-img"><img src="${ctxStatic}/coin/images/tx_jt.png"></div>
                                <div class="addrs-right addr-right">
                                    <div class="addr-num topx">
                                        <div class="fwb in">${trade.rollOut} BBP</div>
                                    </div>
                                    <div class="right-top" style="height: 40px;">
                                        <div class="center-r" style="margin-top: 0px;">
                                            <div class="tx-addr">
                                                <div class="subaddr-p"><a
                                                        href="/f/coin/address?address=${trade.hashCodeRight}">${trade.hashCodeRight}</a>
                                                </div>
                                            </div>
                                            <%--<div class="tx-addr">--%>
                                                <%--<div class="subaddr-p">5ACFs1ixf9bWf6bq367eDu5SGxsEhtjrZb</div>--%>
                                            <%--</div>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tx-time-p visible-xs"><fmt:formatDate value="${trade.createDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </c:forEach>
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


<div class="map-box" id="map_box" style="display:none;">
    <div id="mainMap" class="mainMap"><img src="${ctxStatic}/coin/images/loading.gif"
                                           tppabs="http://PMTCcoin.io/${ctxStatic}/coin/images/loading.gif"></div>
    <div class="map-tis-count"><a href="javascript:;" id="map_all"></a></div>
    <div class="map-tis-box">
        <div class="map-tis-title"><span id="nowtime"></span> &nbsp;&nbsp;&nbsp;全球比特币交易数</div>
        <div class="map-tis-num" id="map_tx"></div>
        <div class="map-tis-un">未确认交易：<b id="map_poollength">61913</b></div>
    </div>
    <div class="map-tis-info">总算力:<b id="map_hash">1082174 TH/s</b>&nbsp;&nbsp;&nbsp;总市值:<b id="map_market">¥ 399亿</b>&nbsp;&nbsp;&nbsp;难度系数:<b
            id="map_diff">165496835118</b></div>
    <div class="map-tis-logo"><img src="${ctxStatic}/coin/images/map_logo.png"
                                   tppabs="http://PMTCcoin.io/${ctxStatic}/coin/images/map_logo.png"></div>
</div>
<%--<script src="${ctxStatic}/js/bootstrap-dialog.min.js"--%>
        <%--tppabs="http://PMTCcoin.io/${ctxStatic}/js/bootstrap-dialog.min.js"></script>--%>
</body>
</html>
