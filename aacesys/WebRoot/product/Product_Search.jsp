<%@ page language="java"  pageEncoding="GB2312" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/andreas08(blue).css" type="text/css" media="screen,projection" />
	
<title>AscentWeb��������</title>
<link href="<%=path%>/css/index.css" rel="stylesheet" type="text/css" />

<script language="javascript">
	function check(){
		if(form.searchValue.value == "")
	    {
	        alert("�������ѯ������");
	        form.searchValue.focus();
	        return false;
	    }
	return true;
	}

</script>





</head>

<body>
<form name="form" method="post" action="<%=request.getContextPath()%>/product?a=search">
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
						<tr><td height="4" colspan="2" align="left" valign="bottom"></td>
						</tr>
						<tr>
							<td height="15" align="left" valign="top">&nbsp;</td>
							<td height="15" align="left" valign="top" class="12">
								<table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
								 <tr>
									<td height="20"><div class="right_proaducts">�ҵ�λ��&gt;&gt;�����������&gt;&gt;��Ʒ��ѯ</div></td>
								 </tr>
							   </table>
							   <br />
								<table width="680" border="0" cellpadding="0" cellspacing="0">
									<tbody>
										<tr>
											<td width="439" bgcolor="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;
												<a href="javascript:history.back()">&lt;&lt;&lt; ����</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										   </td>
										</tr>
									</tbody>
								</table>
								<div class="table_wz">
								
								<table width="680" height="100" border="0" cellpadding="0" cellspacing="0">
									<tbody>
										<tr>
										<td width="184" height="20" class="table_hui"><div align="right"></td>
										<td width="204"></td>
										</tr>
										<tr>
										<td class="table_hui"> <div align="right">��ѡ��:</div></td>
										<td class="table_hui">
										  <select name="searchName">
										    <option  value="catalogno" selected="selected">CatalogNo</option>
										    <option value="cas">CAS</option>
										    <option value="productname">����</option>
										    <option value="mdlnumber">MDLNumber</option> 
											<option value="formula">Formula</option> 
										  </select></td>
										 <td><input type=text name="searchValue"/></td>
										</tr>
										
										<tr>
										<td height="30" class="table_hui">
										    ��		 </td>
										<td height="30" class="table_hui"><input type="submit" name="Submit" value="��ѯ"  onclick="return check();"/></td>
										<td height="30" class="table_hui"><input type="reset"  name="Reset" value="ȡ��" /></td>
								
										</tr>
										
									</tbody>
								</table>
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
</form>	
</body>
</html>