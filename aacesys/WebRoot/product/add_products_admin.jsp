<%@ page language="java" import="com.ascent.bean.*" pageEncoding="GB2312" %>
<%String path = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>AscentWeb��������</title>
		<link rel="stylesheet" href="<%=path%>/css/andreas08(blue).css" type="text/css" media="screen,projection" />
<script>
</script>
<script src="<%=request.getContextPath()%>/js/prototype-1.4.0.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/json.js" type="text/javascript"></script>
<script type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>

<script language="javascript">
	function addProducts(){
	if(form.productId.value == "")
    {
        alert("��Ų���Ϊ�� ��");
        form.productId.focus();
        return false;
    }
    if(form.productname.value == "")
    {
        alert("��Ʒ���Ʋ���Ϊ�� ��");
        form.productname.focus();
        return false;
    }
    if(form.catalogno.value == "")
    {
        alert("catalogno ����Ϊ�� ��");
        form.catalogno.focus();
        return;
    }
    if(form.cas.value == "")
    {
        alert("CAS ����Ϊ�� ��");
        form.cas.focus();
        return false;
    }
    if(form.mdlnumber.value == "")
    {
        alert("MDLNumber ����Ϊ�� ��");
        form.mdlnumber.focus();
        return false;
    }
    if(form.newproduct.value == "")
    {
        alert("�²�Ʒ����ѡ�� ��");
        form.newproduct.focus();
        return false;
    }
   
  
    if(form.formula.value == "")
    {
        alert("formula �������� ��");
        form.formula.focus();
        return false;
    }
    if(form.mw.value == "")
    {
        alert("MW �������� ��");
        form.mw.focus();
        return false;
    }
    if(form.category.value == "")
    {
        alert("category �������룡");
        form.category.focus();
        return false;
    }
    if(form.price1.value == "")
    {
        alert("������۸�1 ��");
        form.price1.focus();
        return false;
    }
    if(form.stock.value == "")
    {
        alert("������ stock ��");
        form.stock.focus();
        return false;
    }
    if(form.price2.value == "")
    {
        alert("������ �۸�2 ��");
        form.price2.focus();
        return false;
    }
    if(form.realstock.value == "")
    {
        alert("������ realstock ��");
        form.realstock.focus();
        return false;
    }
    if(form.upload.value == "")
  {
       alert("��ѡ��ͼƬ ��");
      form.upload.focus();
      return false;
  }
   form.submit();
	}

</script>
</head>

<body>
<form name="form" method="post" action="<%=request.getContextPath()%>/product?a=save" encType="multipart/form-data"/>
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
							<td width="15" height="18" align="left" valign="top"></td>
							<td width="385" align="left" valign="bottom" class="12">&nbsp;</td>
						</tr>
						<tr>
							<td height="4" colspan="2" align="left" valign="bottom"></td>
						</tr>
						<tr>
							<td height="15" align="left" valign="top">&nbsp;</td>
							<td height="15" align="left" valign="top" class="12">
						     <table width="100%" height="20" border="0" cellpadding="0" cellspacing="0">
						  	 <tr>
								<td height="20"><div class="right_proaducts">�ҵ�λ��&gt;&gt;�����������&gt;&gt;�û���Ϣ</div></td>
							 </tr>
						    </table>
						 <br/>		
							
														<%
															Productuser p = (Productuser)session.getAttribute("productuser");
															
														%>
							<table width="100%">
								<tbody>
										<tr>
											<td height="20">
											<div class="table_t">|&nbsp;&nbsp;��ӭ,<%=p.getUsername()%>&nbsp;&nbsp;|&nbsp;&nbsp;
												<a href="<%=path%>/login?a=out" class="table_t">ע��</a>&nbsp;&nbsp;|</div>
											</td>
											<td>
											<div><a href="<%=path%>/user?a=all"><img src="<%=path%>/images/userlist.jpg" border="0" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											     <a href="<%=path%>/product?a=all"><img src="<%=path%>/images/productslist.jpg" border="0" /></a>&nbsp;&nbsp;&nbsp;&nbsp;
												 <a href="<%=path%>/order?a=all"><img src="<%=path%>/images/ShowOrders.jpg" border="0" /></a> &nbsp;&nbsp;&nbsp;&nbsp;
												 <a href="<%=path%>/product/add_products_admin.jsp"><img src="<%=path%>/images/addProduct.jpg" border="0" /></a>&nbsp;&nbsp;&nbsp;&nbsp;
											</div>
											</td>
										</tr>
																<!-- ��Ʒ�б� -->
									</tbody>
							</table>
							<table width="680" border="0" cellpadding="0" cellspacing="0">
									<tbody>
										<tr><td bgcolor="#467AA7" colspan="2" height="5"></td></tr>
										<tr><td colspan="2" height="7"></td></tr>
										<tr><td width="110" height="20" class="table_c">��Ʒ��Ϣ</td>
											<td width="439" bgcolor="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;
												<a href="javascript:history.back()">&lt;&lt;&lt; ����</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</td>
										</tr>
									</tbody>
							</table>
	<table width="500" border="0" cellspacing="0" bordercolor="#9EA7AB" bgcolor="#f3f3f3">
  	 <tr>
      <td height="10" colspan="4"><s:property value="tip"/></td>
	 </tr>
	   <tr>
      <td width="122" height="15" class="table_c"><div align="right">���:</div></td>
	  <td width="122"><input name="productId" type="text"/>
	  <div id="productIdCheckDiv" class="warning"></div> </td>
	  <td width="85" class="table_c"><div align="right">��Ʒ����:</div></td>
	  <td width="163" height="15"><input name="productname" type="text" /></td>
  	 </tr>
	 <tr>
      <td width="122" height="15" class="table_c"><div align="right">CatalogNo:</div></td>
	  <td width="122"><input name="catalogno" type="text" /></td>
	  <td width="85" class="table_c"><div align="right">CAS:</div></td>
	  <td width="163" height="15"><input name="cas" type="text" /></td>
  	 </tr>
	
	 <tr>
      <td width="122" height="15" class="table_c"><div align="right">MDL Number:</div></td>
	  <td width="122">
       <input name="mdlnumber" type="text" /></td>
	  <td width="85" class="table_c"><div align="right">�²�Ʒ:</div></td>
	 <!--  <td width="163" height="35"><input name="newproduct" type="text" /></td> -->
	 <td height="15" class="table_c">
	 ��:  <input type="radio" name="newproduct" value="1" />
	 ��:   <input type="radio" name="newproduct" value="0" checked/>
	 </td>
  	 </tr>
  	  <tr>
      <td width="122" height="15" class="table_c"><div align="right">Formula:</div></td>
	  <td width="122">
       <input name="formula" type="text" /></td>
	  <td width="85" class="table_c"><div align="right">MW:</div></td>
	  <td width="163" height="15"><input name="mw" type="text" /></td>
  	 </tr>
  	 
	 <tr>
    <td width="122" height="15" class="table_c"><div align="right">Category:</div></td>
	  <td width="122">
      <input name="category" type="text" /></td>
	  <td width="85" class="table_c"><div align="right">��ע:</div></td>
	  <td width="163" height="30"><input name="note" type="text" /></td>
  	 </tr> 
  	 <tr>
      <td width="122" height="15" class="table_c"><div align="right">�۸�1:</div></td>
	  <td width="122">
      <input name="price1" type="text" /></td>
	  <td width="85" class="table_c"><div align="right">Stock:</div></td>
	  <td width="163" height="15"><input name="stock" type="text" /></td>
  	 </tr>
	  <tr>
      <td width="122" height="15" class="table_c"><div align="right">�۸�2:</div></td>
	  <td width="122"><input name="price2" type="text" /></td>
	  <td width="85" class="table_c"><div align="right">Real Stock:</div></td>
	  <td width="163" height="15"><input name="realstock" type="text" /></td>
  	 </tr>
  	 <tr>
	  <td width="85" class="table_c"><div align="right">ͼƬ:</div></td>
	  <td width="163" height="15">
	  <input type="file" name="upload" />
      </td>      
  	 </tr>
	 <tr>
      <td height="15" colspan="4"><div align="center">
        
        <div class="loading_ll"><input type="button" value="�ύ" onclick="addProducts()"/>
        <!--  input type="submit"  src="<%=request.getContextPath()%>\images\Add.jpg" onclick="return addproducts();"  border="0"/--></div>
      </div></td>
	 </tr>
 </table>
								</td>
									</tr>
								</table>
								<br />
								<div class="table_wz"></div>
						
					
				
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
