<%@ page language="java" import="com.ascent.bean.Productuser" contentType="text/html;charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>ascent</title>
<meta http-equiv="content-type" content="text/html; charset=GB2312" />
<meta name="description" content="Your website description goes here" />
<meta name="keywords" content="your,keywords,goes,here" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/andreas08(blue).css" type="text/css" media="screen,projection" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/acesys.js"></script>
</head>

<body>
<div id="container" >
<div id="header">
</div>
<div id="navigation">
<ul>
<li class="selected"></li>
<li><a href="<%=request.getContextPath()%>/index.jsp">��ҳ</a></li>
<li><a href="<%=request.getContextPath()%>/product/itservice.jsp">IT����</a></li>
<li><a href="<%=request.getContextPath()%>/product/products.jsp">��������ϵͳ</a></li>
<li><a href="<%=request.getContextPath()%>/product/employee.jsp">Ա����Ƹ</a></li>
<li><a href="<%=request.getContextPath()%>/product/ContactUs.jsp">��������</a></li>
<li></li>
</ul>
</div>

<div id="content"> 
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>�ҵ�λ�� &gt;&gt; �����������</td>
    </tr>
    <tr>
      <td><hr noshade="noshade" /></td>
    </tr>
    <tr>
      <td>��Ʒ��Ϣ</td>
    </tr>
  </table>
  <br />
  <div class="md_wenzi"> astaTech�� Inc.�ṩȫ������ҩ������Ƽ���agroche micalҩ���о�&amp;��չ���Ƚ�����ӱ���м��塣
    ���ǵı�Ŀ��������1500��ҩ�����Ʒ�� ������ʮ���µĻ�����ÿ�������ӵ���Ʒ�����������Ƚ����м���Ŀ������ͣ�
    ������ľ����ӱ�İ���������İ������Ȼ�İ����ᡢͪ����ȩ��heterocycles��isatoic����boroinc�������
    ���м�����ܼ�������ҩ���о����̡�AstaTechҲ�ṩ�����м���(10����)������м���(�Զ�)��ʹԭ���Ϻ����ǵ�
    �м����������������ļ۸������Ʒ�ʡ� 
    ��ι�<a href="<%=request.getContextPath()%>/product?a=all">�����Ʒҳ</a>��<br />
    ��Ŀ���������ϱ��ۿ�������<a href="<%=request.getContextPath()%>/product/Product_Search.jsp">��ѯ��Ʒ�����Ʒ</a> ����ϲ�������Ͻ������ǵı�Ŀ��(��PDF��SD��ʽ)��������ʼ�����. </div>
  <p>&nbsp;</p>
</div><div id="subcontent">
<form name="form" method="post" action="<%=request.getContextPath()%>/login?a=login">
  <div class="small box">
  	<%
			Productuser p =(Productuser)session.getAttribute("productuser");
			if(p==null){
		%>
    <table width="150" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="30%" colspan="2" valign="middle"><img src="<%=request.getContextPath()%>/images/username.jpg" width="61" height="17" align="bottom" />
            <input name="username" type="text" size="7"/>        </td>
      </tr>
      <tr>
        <td colspan="2" valign="middle"><img src="<%=request.getContextPath()%>/images/password.jpg" width="61" height="17" />
            <input name="password" type="password" size="6" /></td>
      </tr>
      <tr>
        <td height="30" valign="bottom">�������<a href="<%=request.getContextPath()%>/product/register.jsp">ע��</a></td>
        <td align="left" valign="bottom"><a href="#">
          <input name="image" type="image" onclick="return checkLogin(form);" src="<%=request.getContextPath()%>/images/login_1_7.jpg" alt="��¼" width="44" height="17" border="0"/>
        </a></td>
      </tr>
      <tr>
        <td colspan="2" valign="bottom">&nbsp;</td>
      </tr>
    </table>
    <%
			}
			else{
		%>
	 <table width="150" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="30%" colspan="2" valign="middle">��ӭ����<%=p.getUsername()%></td>
      </tr>
      <tr>
        <td colspan="2" valign="middle">���䣺<%=p.getEmail()%></td>
      </tr>
      <tr>
        <td height="30" valign="bottom"><span class="big_k">
          <a href="<%=request.getContextPath()%>/login?a=out">ע��</a>
        </span></td>
        <% if(p.getSuperuser().equals("3")){%>
		 <td align="left" valign="bottom"></td>
		<%}}%>
       
      </tr>
      <tr>
        <td colspan="2" valign="bottom">&nbsp;</td>
      </tr>
    </table>	
		
  </div>
</form>
  <h2>������Ʒ�б�</h2>
  <ul class="menublock">
    <li><a href="#">��Ŀʵս����</a><a href="#"><img src="<%=request.getContextPath()%>/images/buy.gif" width="20" height="16" border="0"/></a></li>
    <li><a href="#">java���ļ���</a><a href="#"><img src="<%=request.getContextPath()%>/images/buy.gif" width="20" height="16" border="0"/></a></li>
    </ul>
  </div>
<div id="footer">
<p><a href="http://www.ascenttech.com.cn/" target="_blank">��Ȩ���У�������˼������Ƽ����޹�˾ &copy;2004-2008|��ICP��05005681</a><a href="#"></a></p>
</div>
</div>
<body>
</html>
