<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>说说</title>
<link rel="stylesheet" type="text/css" href="static/css/feel.css">
</head>
<body>
	<span id="inforback"></span>
	<div id="qq">
		<form method="post" action="<%=path%>/publishFeel">
			<p>有什么新鲜事想告诉大家?</p>
			<div class="message" contentEditable='true'></div>
			<textarea hidden class="feelcontent" name="feelcontent"
				required="required"></textarea>
			<div class="But">
				<img src="static/images/bba_thumb.gif" class='bq' /> <span>发表
					<input type="submit" class="submit" value="提交">
				</span>
				<!--face begin-->
				<div class="face">
					<ul>
						<li><img src="static/images/zz2_thumb.gif" title="[织]"></li>
						<li><img src="static/images/horse2_thumb.gif" title="神马]"></li>
						<li><img src="static/images/fuyun_thumb.gif" title="[浮云]"></li>
						<li><img src="static/images/geili_thumb.gif" title="[给力]"></li>
						<li><img src="static/images/wg_thumb.gif" title="[围观]"></li>
						<li><img src="static/images/vw_thumb.gif" title="[威武]"></li>
						<li><img src="static/images/panda_thumb.gif" title="[熊猫]"></li>
						<li><img src="static/images/rabbit_thumb.gif" title="兔子]"></li>
						<li><img src="static/images/otm_thumb.gif" title="[奥特曼]"></li>
						<li><img src="static/images/j_thumb.gif" title="[囧]"></li>
						<li><img src="static/images/hufen_thumb.gif" title="[互粉]"></li>
						<li><img src="static/images/liwu_thumb.gif" title="[礼物]"></li>
						<li><img src="static/images/smilea_thumb.gif" title="呵呵]"></li>
						<li><img src="static/images/tootha_thumb.gif" title="嘻嘻]"></li>
						<li><img src="static/images/laugh.gif" title="[哈哈]"></li>
						<li><img src="static/images/tza_thumb.gif" title="[可爱]"></li>
						<li><img src="static/images/kl_thumb.gif" title="[可怜]"></li>
						<li><img src="static/images/kbsa_thumb.gif" title="[挖鼻屎]"></li>
						<li><img src="static/images/cj_thumb.gif" title="[吃惊]"></li>
						<li><img src="static/images/shamea_thumb.gif" title="[害羞]"></li>
						<li><img src="static/images/zy_thumb.gif" title="[挤眼]"></li>
						<li><img src="static/images/bz_thumb.gif" title="[闭嘴]"></li>
						<li><img src="static/images/bs2_thumb.gif" title="[鄙视]"></li>
						<li><img src="static/images/lovea_thumb.gif" title="[爱你]"></li>
						<li><img src="static/images/sada_thumb.gif" title="[泪]"></li>
						<li><img src="static/images/heia_thumb.gif" title="[偷笑]"></li>
						<li><img src="static/images/qq_thumb.gif" title="[亲亲]"></li>
						<li><img src="static/images/sb_thumb.gif" title="[生病]"></li>
						<li><img src="static/images/mb_thumb.gif" title="[太开心]"></li>
						<li><img src="static/images/ldln_thumb.gif" title="[懒得理你]"></li>
						<li><img src="static/images/yhh_thumb.gif" title="[右哼哼]"></li>
						<li><img src="static/images/zhh_thumb.gif" title="[左哼哼]"></li>
						<li><img src="static/images/x_thumb.gif" title="[嘘]"></li>
						<li><img src="static/images/cry.gif" title="[衰]"></li>
						<li><img src="static/images/wq_thumb.gif" title="[委屈]"></li>
						<li><img src="static/images/t_thumb.gif" title="[吐]"></li>
						<li><img src="static/images/k_thumb.gif" title="[打哈气]"></li>
						<li><img src="static/images/bba_thumb.gif" title="[抱抱]"></li>
						<li><img src="static/images/angrya_thumb.gif" title="[怒]"></li>
						<li><img src="static/images/yw_thumb.gif" title="[疑问]"></li>
						<li><img src="static/images/cza_thumb.gif" title="[馋嘴]"></li>
						<li><img src="static/images/88_thumb.gif" title="[拜拜]"></li>
						<li><img src="static/images/sk_thumb.gif" title="[思考]"></li>
						<li><img src="static/images/sweata_thumb.gif" title="[汗]"></li>
						<li><img src="static/images/sleepya_thumb.gif" title="[困]"></li>
						<li><img src="static/images/sleepa_thumb.gif" title="[睡觉]"></li>
						<li><img src="static/images/money_thumb.gif" title="[钱]"></li>
						<li><img src="static/images/sw_thumb.gif" title="[失望]"></li>
						<li><img src="static/images/cool_thumb.gif" title="[酷]"></li>
						<li><img src="static/images/hsa_thumb.gif" title="[花心]"></li>
						<li><img src="static/images/hatea_thumb.gif" title="[哼]"></li>
						<li><img src="static/images/gza_thumb.gif" title="[鼓掌]"></li>
						<li><img src="static/images/dizzya_thumb.gif" title="[晕]"></li>
						<li><img src="static/images/bs_thumb.gif" title="[悲伤]"></li>
						<li><img src="static/images/crazya_thumb.gif" title="[抓狂]"></li>
						<li><img src="static/images/h_thumb.gif" title="[黑线]"></li>
						<li><img src="static/images/yx_thumb.gif" title="[阴险]"></li>
						<li><img src="static/images/nm_thumb.gif" title="[怒骂]"></li>
						<li><img src="static/images/hearta_thumb.gif" title="[心]"></li>
						<li><img src="static/images/unheart.gif" title="[伤心]"></li>
						<li><img src="static/images/pig.gif" title="[猪头]"></li>
						<li><img src="static/images/ok_thumb.gif" title="[ok]"></li>
						<li><img src="static/images/ye_thumb.gif" title="[耶]"></li>
						<li><img src="static/images/good_thumb.gif" title="[good]"></li>
						<li><img src="static/images/no_thumb.gif" title="[不要]"></li>
						<li><img src="static/images/z2_thumb.gif" title="[赞]"></li>
						<li><img src="static/images/come_thumb.gif" title="[来]"></li>
						<li><img src="static/images/sad_thumb.gif" title="[弱]"></li>
						<li><img src="static/images/lazu_thumb.gif" title="[蜡烛]"></li>
						<li><img src="static/images/clock_thumb.gif" title="[钟]"></li>
						<li><img src="static/images/cake.gif" title="[蛋糕]"></li>
						<li><img src="static/images/m_thumb.gif" title="[话筒]"></li>
						<li><img src="static/images/weijin_thumb.gif" title="[围脖]"></li>
						<li><img src="static/images/lxhzhuanfa_thumb.gif"
							title="[转发]"></li>
						<li><img src="static/images/lxhluguo_thumb.gif"
							title="[路过这儿]"></li>
						<li><img src="static/images/bofubianlian_thumb.gif"
							title="[bofu变脸]"></li>
						<li><img src="static/images/gbzkun_thumb.gif" title="[gbz困]"></li>
						<li><img src="static/images/boboshengmenqi_thumb.gif"
							title="[生闷气]"></li>
						<li><img src="static/images/chn_buyaoya_thumb.gif"
							title="[不要啊]"></li>
						<li><img src="static/images/daxiongleibenxiong_thumb.gif"
							title="[dx泪奔]"></li>
						<li><img src="static/images/cat_yunqizhong_thumb.gif"
							title="[运气中]"></li>
						<li><img src="static/images/youqian_thumb.gif" title="[有钱]"></li>
						<li><img src="static/images/cf_thumb.gif" title="[冲锋]"></li>
						<li><img src="static/images/camera_thumb.gif" title="[照相机]"></li>
					</ul>
				</div>
				<!--face end-->
			</div>
		</form>
	</div>
	<!--qq end-->

	<div class="msgCon">
		<c:forEach items="${requestScope.pager.list}" var="feel"
			varStatus="status">
			<div class='msgBox'>
				<dl>
					<dt>
						<img src="static/headpic/${feel.user.headpic}"
							alt="${feel.user.username }" height="50" width="50">
					</dt>
					<dd>
						${feel.user.username } <span style="font-size: 7px;">${feel.feeltime }</span>
					<%-- 	<c:if test="${host.userid==feel.user.userid }">
							<a
								href="<%=path %>/delFeel?feelid=${feel.feelid} &userid=${feel.user.userid }">
								<span style="font-size: 7px;"
								onclick="return operaconfirm('删除');">删除</span>
							</a>
						</c:if> --%>
					</dd>
				</dl>
				<div class='msgTxt'>
					${feel.feelcontent }<br>
					<c:if test="${!empty feel.pic}">
						<img src="static/img/${feel.pic }" height="50" width="70">
					</c:if>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="comm_content">
		<div class="c_list clf">
			<div id="pl_page">
				<div class="pagelistbox">
					<p>
						<span> 
						<a href="<%=path%>/feelindex1?page=1">首页</a>

							<a
							href="<%=path%>/feelindex1?page=${requestScope.pager.currentPage-1}">上一页</a>

							<a
							href="<%=path%>/feelindex1?page=${requestScope.pager.currentPage+1}">下一页</a>

							<a
							href="<%=path%>/feelindex1?page=${requestScope.pager.totalPage}">尾页</a>
							当前第 ${requestScope.pager.currentPage}页, 总共${requestScope.pager.totalPage}
							页
						</span>
					</p>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="static/js/jquery.js"></script>
	<script type="text/javascript">
		$(function() {

			//点击小图片，显示表情
			$(".bq").click(function(e) {
				$(".face").slideDown();//慢慢向下展开
				e.stopPropagation(); //阻止冒泡事件
			});

			//在桌面任意地方点击，他是关闭
			$(document).click(function() {
				$(".face").slideUp();//慢慢向上收
			});

			//点击小图标时，添加功能
			$(".face ul li").click(function() {
				var simg = $(this).find("img").clone();
				$(".message").append(simg);
			});
			//点击提交按钮把div中的值复制给textarea控件
			$(".submit").click(function() {
				var txt = $(".message").html();
				if (txt == "") {
					$('.message').focus();//自动获取焦点
					return;
				}
				$(".feelcontent").html(txt);
			});
		});
		function operaconfirm(op) {
			question = confirm("你确定要" + op + "么？");
			if (question != "0") {
				return true;
			}
			return false;
		}
	</script>
</body>
</html>
