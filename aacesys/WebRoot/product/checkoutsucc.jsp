<%@ page language="java" import="com.ascent.bean.*" contentType="text/html;charset=gb2312"%>
<%String path = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>AscentWeb��������</title>
		<link rel="stylesheet" href="<%=path%>/css/andreas08(blue).css" type="text/css" media="screen,projection" />

<script language="javascript">
 
</script>
</head>

<body>
<div class="head">
<div id="container">
               <div id="header"></div>
                 <div id="navigation">
					<ul>
						<li class="selected"></li>
						<li><a href="<%=request.getContextPath()%>/index.jsp">��ҳ</a></li>
						<li><a href="<%=request.getContextPath()%>/product/itservice.jsp">IT����</a></li>
						<li><a href="<%=request.getContextPath()%>/product/products.jsp">��������ϵͳ</a></li>
						<li><a href="<%=request.getContextPath()%>/product/employee.jsp">Ա����Ƹ</a></li>
						<li><a href="<%=request.getContextPath()%>/product/ContactUs.jsp">��������</a></li>	
					</ul>
				  </div>

				<div id="content2">
					<table width="100%" height="41" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="15" height="18" align="left" valign="top"><div align="left"></div></td>
							<td width="385" align="left" valign="bottom" class="12">&nbsp;</td>
						</tr>
						<tr>
							<td height="4" colspan="2" align="left" valign="bottom"></td>
						</tr>
						<tr>
							<td height="15" align="left" valign="top">&nbsp;
							</td>
							<td height="15" align="left" valign="top" class="12">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr> 
<%
	Productuser p = (Productuser)session.getAttribute("productuser");
	if(p!=null&&p.getSuperuser().equals("3")){  //����Ա
%>
<td width="30%"><div align="left">|&nbsp;&nbsp;��ӭ,<%=p.getUsername() %>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/login?a=out" class="table_t">ע��</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:history.go(-1)"><<< ����</a></div></td>
<td width="20%"><div align="center"><a href="<%=request.getContextPath()%>/product/a=all"><img src="<%=request.getContextPath()%>\images\productslist.jpg" width="75" height="17" border="0"/></a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/order?a=all">��������</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/product/a=all">��������</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/product/checkout.jsp">��������</a></div></td>
<%}
	else if(p==null){  //δע���û�
 %>
 <td width="30%"><div align="left">|&nbsp;&nbsp;��ӭ,�ο�&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/product/register.jsp" class="table_t">ע��</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:history.go(-1)"><<< ����</a></div></td>
<td width="20%"><div align="center">&nbsp;</div></td>
<td width="15%"><div align="center">&nbsp;</div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/product?a=all">��������</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/product/checkout.jsp">��������</a></div></td>

<%}
	else {  //��ע���û�
 %>
 <td width="30%"><div align="left">|&nbsp;&nbsp;��ӭ,<%=p.getUsername() %>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/login?a=out" class="table_t">ע��</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:history.go(-1)"><<< ����</a></div></td>
<td width="20%"><div align="center">&nbsp;</div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/order?a=all">�鿴����</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/product?a=all">��������</a></div></td>
<td width="15%"><div align="center"><a href="<%=request.getContextPath()%>/product/checkout.jsp">��������</a></div></td>
<%}%>
</tr>
</table>
<br><br>	

<center><h3>
<%
 String tishi=(String)request.getAttribute("error");
 if(tishi!=null)
 {
 %>
 <%=tishi%>
 <%
 }else{
 %>
 ���Ͷ������̳����ˣ�
<%}%>
</h3></center>
	</td>
						</tr>
					</table>
				  </div>
				  
				 <div id="footer">
					<p>
						<a href="http://www.ascenttech.com.cn/" target="_blank">��Ȩ���У�������˼������Ƽ����޹�˾
							&copy;2004-2008|��ICP��05005681</a>
					</p>
				</div>
  

</div>

</body>
</html>
