<%@ page language="java" pageEncoding="GB2312" %>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>AscentWeb��������</title>

<meta http-equiv="content-type" content="text/html; charset=GB2312" />
<meta name="description" content="Your website description goes here" />
<meta name="keywords" content="your,keywords,goes,here" />
<link rel="stylesheet"  id="styles" href="<%=path %>/css/andreas08(blue).css" type="text/css" media="screen,projection" />
<script type="text/javascript" src="<%=path %>/js/acesys.js"></script>
</head>
<body>
<div id="container" >
<div id="header";>

</div>
<div id="navigation">
<ul>
						<li class="selected"></li>
						<li>
							<a href="<%=path%>/index.jsp">��ҳ</a>
						</li>
						<li>
							<a href="<%=path%>/product/itservice.jsp">IT����</a>
						</li>
						<li>
							<a href="<%=path%>/product/products.jsp">��������ϵͳ</a>
						</li>
						<li>
							<a href="<%=path%>/product/employee.jsp">Ա����Ƹ</a>
						</li>
						<li>
							<a href="<%=path%>/product/ContactUs.jsp">��������</a>
						</li>
						
					</ul><br>
</div>
<div id="content">
<h2>Welcome To Ascent Technologies</h2>

<div class="splitcontentleft">
  <div class="box">
<h3><img src="images/lxrycyy.gif" alt="" width="184" height="124" /></h3>
</div>
</div>
<div class="splitcontentright">
  <p>��˼������Ƽ����޹�˾�����   &quot;��˼�ɿƼ�&quot;�������ɺ�����ITרҵ������ʿ���йش庣����ѧ����ҵ԰�����������˾�ܲ�λ�ڱ������ڼ��ô��������ձ������ڵ�ʯ��ׯ���������ػʵ������֣��ȷ��ȵ����зֲ���ƾ����׿Խ�ļ���ˮƽ������ḻ�Ĺ����Ŷӣ�ǿ�����Դ���������͡����š����š����¡�׿Խ���ľ�Ӫ�����˼�ɿƼ��춨�˹�˾�ڱ��غͺ���IT�����г������Ƶ�λ������˿ͻ���һ���Ͽɺͺ���������ͻ������˳��ڵ�ս�Ժ�������ϵ����˾�������й�IT����ʵ���ص㣬���ù����Ƚ�����ļ����;��飬�ṩ�߶����ʵ�IT����,��������߶���ѵ�����������ά�����������������Ʒ�з��ͱ��ػ��ȡ�   ��˾����ͻ���ļ������ƣ��������߱���������Ӧ��ƽ̨������ͨ�������йش�Ƽ�԰�߿Ƽ���Ʒ��֤����˾������ͻ�����˲����ƣ�ӵ������MBA,   ŦԼ�����ּ����ô�֤ȯ����������֤����ר�ң��Լ��������ô�IT��������ͺ�����ѧ��Ա�� </p>

  <p><strong>Good luck with your new design!</strong></p>
</div>
</div>

<div id="subcontent">
<form name="form" method="post" action="<%=request.getContextPath()%>/login?a=login">
  <div class="small box">
    <table width="150" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="30%" valign="middle"><img src="images\username.jpg" width="61" height="17" align="bottom" />
            <input name="username" id="username" type="text" size="7"/>
        </td>
      </tr>
      <tr>
        <td valign="middle"><img src="images\password.jpg" width="61" height="17" />
            <input name="password" id="password" type="password" size="6" /></td>
      </tr>
      <tr>
        <td height="30" valign="bottom"><input name="image" type="image" onclick="return checkLogin(form);" src="images\login_1_7.jpg" alt="��¼" width="44" height="17" border="0"/>
          &nbsp;&nbsp;
          <select name="sel" onchange="changeStyle(this)">
            <option value="andreas08(blue).css" selected="selected">Ĭ�Ϸ��</option>
			<option value="andreas08(orange).css">��ɫ</option>
			<option value="andreas08(green).css">��ɫ</option>
          </select></td>
      </tr>
    </table>
  </div>
  </form>
  <h2>������Ʒ�б�</h2>
  <ul class="menublock"><li><a href="#">��Ŀʵս����</a><a href="#"><img src="images/buy.gif" width="20" height="16" border="0"/></a></li>
  <li><a href="#">java���ļ���</a><a href="#"><img src="images/buy.gif" width="20" height="16" border="0"/></a></li>
  </ul>

<h2>��������</h2>
<ul class="menublock">
  <li><a href="http://www.ascenttech.cn" target="_blank">��˼����Ƶ����</a></li>
  <li><a href="http://www.ascenttech.com.cn/" target="_blank">��˼�ɹ�˾��ҳ</a></li>
  </ul>

</div>

<div id="footer">
<p><a href="http://www.ascenttech.com.cn/" target="_blank">��Ȩ���У�������˼������Ƽ����޹�˾ &copy;2004-2008|��ICP��05005681</a></p>
</div>

</div>
</body>
</html>