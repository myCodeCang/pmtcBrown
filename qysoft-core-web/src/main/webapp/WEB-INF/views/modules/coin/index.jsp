<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
<script>
    function tofindTrade(tradeId) {
        window.location.href = "/f/coin/trade?tradeId="+tradeId;
    }

</script>

<!-- Static navbar -->
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
            <script>document.write(('Block'));</script>
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
                    <input name="address" placeholder="<spring:message code="sousuo"/>" id="address"
                           class="form-control phone">
                    <button class="phone_btn" type="submit">搜索</button>
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
                <%--<img src="${ctxStatic}/coin/images/logo.png" tppabs="http://PMTCcoin.io/static/images/logo.png">--%>
                    <%--${fns:getConfig("coinName")}--%>
            </a></div>

        <div class="coin-box" id="coins2" style="display:none"></div>
    </div>

    <div class="search-box">

        <form role="search" action="/f/coin/search" tppabs="http://PMTCcoin.io/search?search=" method="GET">
            <button class="search-btn" type="submit">
                <div class="button-y"><img src="${ctxStatic}/coin/images/fdj.png"
                                           tppabs="http://${fns:getConfig("coinName")}coin.io/static/images/fdj.png">
                </div>
            </button>
            <input value="index" name="url" type="hidden">
            <input name="search" placeholder="<spring:message code="sousuo"/>" id="conten" class="form-control search">
        </form>
    </div>
</div>
<div class="container main ">
    <div class="row">

        <div class="left">
            <div class="column-box">
                <div class="column">
                    <script>/*document.write*/
                    (('Block'));</script>
                    <spring:message code="qukuai"/>
                </div>
                <div class="vice">
                    <script>/*document.write*/
                    (('NewBlock'));</script>
                    <spring:message code="zuixinqukuai"/>
                </div>
                <div class="more">
                    <a >
                        <img src=""></a></div>
            </div>
            <div class="table-responsive">
                <table class="table" id="blk_tb">
                    <thead>
                    <tr>
                        <th class="t0">&nbsp;</th>
                        <th class="t1">
                            <script>/*document.write*/
                            (('Height'));</script>
                            <spring:message code="gaodu"/>
                        </th>
                        <th class="t2">
                            <script>/*document.write*/
                            (('baohangjiaoyishu'));</script>
                            <spring:message code="baohanjiaoyi"/>
                        </th>
                        <th class="t6">
                            <script>/*document.write*/
                            (('zongfasong'));</script>
                            <spring:message code="zongfasong"/>
                        </th>
                        <th class="t3">
                            <script>/*document.write*/
                            (('shujuliang'));</script>
                            <spring:message code="shujuliang"/> (kB)
                        </th>
                        <!--th class="t4">挖出方</th-->
                        <th class="t5">
                            <script>/*document.write*/
                            (('shengchengtime'));</script>
                            <spring:message code="shengchengshijian"/>
                        </th>
                        <th class="t0">&nbsp;</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${blockList}" var="lccBlock">
                        <tr>
                            <td class="t0">&nbsp;</td>
                            <td class="t1" style="color: dodgerblue">${lccBlock.id}
                            </td>
                            <td class="t2">${lccBlock.tradeNum}</td>
                            <td class="t6">${lccBlock.allSend} ${fns:getConfig("coinName")}</td>
                            <td class="t3">${lccBlock.dataSize}</td>
                            <!--td class="t4"><div class="resp-text-hash"><div></td-->
                            <td class="t5"><fmt:formatDate value="${lccBlock.createDate}"
                                                           pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td class="t0">&nbsp;</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="clearfix"></div>
            <div class="index-line"></div>
            <div class="column-box">
                <div class="column">
                    <script>/*document.write*/
                    </script>
                    <spring:message code="jiaoyi"/>

                </div>
                <div class="vice">/
                    <script>/*document.write*/
                    </script>
                    <spring:message code="zuixinjiaoyi"/>
                </div>
            </div>
            <div class="tx-box">
                <div class="table-responsive">
                    <table class="table table-hover" id="tab-tx">
                        <tbody>
                        <c:forEach items="${tradeList}" var="trade">
                            <tr>
                                <td class="t0">&nbsp;</td>
                                <td class="t7" onclick="tofindTrade('${trade.id}')">
                                    <div class="resp-text-hash">${trade.hashCodeLeft}</div>
                                </td>
                                <td class="t8"><img src="${ctxStatic}/coin/images/in.png"></td>
                                <td class="t7-1" onclick="tofindTrade('${trade.id}')">
                                    <div class="resp-text-hash">${trade.hashCodeRight}</div>
                                </td>
                                <td class="t9">&lt;
                                        ${trade.timeOut}
                                       分钟
                                </td>
                                <td class="t10">${trade.rollOut}</td>
                                <td class="t11"><a
                                        href="javascript:void (0)"
                                        onclick="tofindTrade('${trade.id}')"><spring:message
                                        code="xiangqing"/></a>
                                </td>
                                <td class="t00">&nbsp;</td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="right">
            <div class="data">
                <script>/*document.write*/
                (('shuju'));</script>
                <spring:message code="shuju"/>
            </div>
            <div id="data">
                <div class="data-l"><spring:message code="daiqueren"/></div>
                <div class="data-r" id="poollength">${waiteTradeNum}</div>
                <div class="data-l"><spring:message code="nanduxishu"/></div>
                <div class="data-r">${difficult}</div>
                <div class="data-l"><spring:message code="zongshizhi"/></div>
                <div class="data-r">¥ --</div>
            </div>
            <div class="title-box">
                <div class="title-img"><img src="${ctxStatic}/coin/images/sc.png?v=61356ba3427a3c0b1d00f71b74fd93cf">
                </div>
                <div class="title-word">
                    <script>/*document.write*/
                    (('shichangjiage'));</script>
                    <spring:message code="shichangjiage"/>
                </div>
            </div>
            <div id="price">
                <div class="data-l"><a href="#" target="_blank"></a></div>
                <div class="data-r">¥ --</div>
            </div>
            <!--div class="title-box">
            <div class="title-img"><img src="/static/images/sl.png?v=a3ef746a558d3b2cace6ff61a2c14260"></div>
            <div class="title-word">算力排行</div>
            <div class="title-more"><a href="/pools" id="stress_more">更多</a></div>
            </div>
            <div id="stress_top">
            </div>
            <div class="clearfix"></div-->
            <div class="title-box">
                <div class="title-img"><img src="${ctxStatic}/coin/images/ye.png?v=b413c1cdd1305431f2a2cebe4aaa1973">
                </div>
                <div class="title-word">
                    <script>/*document.write*/
                    (('yuepaihang'));</script>
                    <spring:message code="yuepaihang"/>
                </div>
                <div class="title-more"><a href="/f/coin/top" id="balance_more">
                    <script>/*document.write*/
                    (('More'));</script>
                    <spring:message code="gengduo"/></a></div>
            </div>
            <div id="balance">
                <c:forEach items="${userList}" var="user" varStatus="index">
                   <c:if test="${index.index<5}">
                       <div class="data-l bl resp-top-addr">${user.remarks}
                       </div>
                       <div class="data-r br">${user.money2} ${fns:getConfig("coinName")}</div>
                   </c:if>
                </c:forEach>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
</div>
<div class="container footer">
    <div class="foot">© 2016 <span>Powered By <script>/*document.write*/
    (('Name'))</script></span> All rights reserved
        &nbsp;&nbsp;
    </div>
</div>
<input id="message" type="hidden" value="${message}">
<input id="messages" type="hidden" value="<spring:message code="message"/>">
<%--<script>--%>
    <%--if ($("#message").val() != "") {--%>
        <%--alert($("#messages").val());--%>
        <%--$("#message").val("");--%>
    <%--}--%>
<%--</script>--%>
<!--[if lt IE 9]>
<script src="static/js/html5shiv.min.js-v=bc0679a1f805567fd478cbc0c845c075"
        tppabs="http://PMTCcoin.io/static/js/html5shiv.min.js?v=bc0679a1f805567fd478cbc0c845c075"></script>
<script src="static/js/respond.min.js-v=44ccd9c8f8438737612f35923c12135c"
        tppabs="http://PMTCcoin.io/static/js/respond.min.js?v=44ccd9c8f8438737612f35923c12135c"></script>
<![endif]-->

</body>
</html>
