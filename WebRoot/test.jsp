<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>XX图书馆首页</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- css -->
<link rel="stylesheet" type="text/css" href="/Library/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/Library/css/common.css" />
<link rel="stylesheet" type="text/css" href="/Library/css/index.css" />
<!-- js -->
<script src="/Library/js/jquery-3.4.1.min.js"></script>
<script src="/Library/js/bootstrap.min.js"></script>


</head>

<body onload="time();">

	<table align="center" class="bizform" width="526" height="80%" cellpadding="0" cellspacing="0">
		<tbody>
			<tr>
				<td class="bizformheader" width="100%" colspan="4" nowrap="">书目详细信息</td>

			</tr>
			<tr>
				<td class="bizformdataheader" width="20%" height="25" nowrap="">CIP核准号</td>
				<td class="bizformdatacell" width="30%">2014099714</td>
				<td class="bizformdataheader" width="20%" height="25" nowrap="">ISBN</td>
				<td class="bizformdatacell" width="30%">978-7-04-039662-1</td>
			</tr>
			<tr>
				<td class="bizformdataheader" height="25" nowrap="">正书名</td>
				<td class="bizformdatacell" colspan="3">高等数学</td>
			</tr>
			<tr>
				<td class="bizformdataheader" height="25" nowrap="">丛书名</td>
				<td class="bizformdatacell" colspan="3"></td>
			</tr>
			<tr>
				<td class="bizformdataheader" height="25" nowrap="">出版单位</td>
				<td class="bizformdatacell" colspan="3">高等教育出版社</td>
			</tr>
			<tr>
				<td class="bizformdataheader" height="25" nowrap="">出版地</td>
				<td class="bizformdatacell">北京</td>
				<td class="bizformdataheader" height="25" nowrap="">出版时间</td>
				<td class="bizformdatacell">2014.5</td>
			</tr>
			<!--
		<tr>
				<td class="bizformdataheader"  height="25" nowrap>第一责任者</td>					
				<td class="bizformdatacell"    colspan="3" >同济大学数学系, 编</script></td>
				
		</tr>
		-->
			<tr>
				<td class="bizformdataheader" height="25" nowrap="">版次</td>
				<td class="bizformdatacell">7版</td>
				<td class="bizformdataheader" height="25" nowrap="">印次</td>
				<td class="bizformdatacell">1</td>
			</tr>
			<tr>
				<td class="bizformdataheader" height="25" nowrap="">定价(元)</td>
				<td class="bizformdatacell">27.7</td>
				<td class="bizformdataheader" height="25" nowrap="">正文语种</td>
				<td class="bizformdatacell"></td>
			</tr>
			<tr>
				<td class="bizformdataheader" height="25" nowrap="">开本或尺寸</td>
				<td class="bizformdatacell">23 × 17</td>
				<td class="bizformdataheader" height="25" nowrap="">装帧方式</td>
				<td class="bizformdatacell">平装</td>
			</tr>
			<!--
			<tr>
				<td class="bizformdataheader"  height="25" nowrap>页数</td>					
				<td class="bizformdatacell"    >0</td>
				<td class="bizformdataheader"  height="25" nowrap>印数（册）</td>					
				<td class="bizformdatacell"    >200000</td>
		</tr>
		-->
			<tr>
				<td class="bizformdataheader" height="25" nowrap="">中图法分类</td>
				<td class="bizformdatacell" colspan="3">O13</td>
			</tr>
			<tr>
				<td class="bizformdataheader" height="25" nowrap="">主题词</td>
				<td class="bizformdatacell" colspan="3">高等数学－高等学校－教材</td>
			</tr>
			<tr>
				<td class="bizformdataheader" height="25" nowrap="">内容提要</td>
				<td class="bizformdatacell" colspan="3">《高等数学》第7版是“十二五”普通高等教育本科国家级规划教材，在第6版的基础上作了进一步的修订。新版教材在保留原教材结构严谨，逻辑清晰、叙述详细、通俗易懂、例题较多、便于自学等优点的基础上，对教材深广度进行了适度的调整，使其更适合当前教学的需要；同时吸收了国外优秀教材的优点，对习题作了较多调整和充实；对全书内容作了进一步的锤炼和适当的调整， 使其能更好满足高等教育进入大众化的新要求。本书下册的主要内容包括空间解析几何与向量代数、多元函数微分法及其应用、重积分、曲线积分与曲面积分、无穷级数等内容，主要供高等工科院校各专业本科生使用，也可供科技工作者阅读。</td>
			</tr>
		</tbody>
	</table>
</body>
</html>

<script>
$.post("xxxx.jsp", { username: "xxxxx", mobile: "xxxx", fengge: "xxxx"})
</script>
