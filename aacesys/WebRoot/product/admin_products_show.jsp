<%@ page language="java" import="java.util.*,com.ascent.bean.*" pageEncoding="GB2312" %>
<%String path = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>AscentWeb��������</title>
<link rel="stylesheet" href="<%=path%>/css/andreas08(blue).css" type="text/css" media="screen,projection" />

</head>
<body>
 <form name="form" method="post" action="">
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
							<td height="4" colspan="2" align="left" valign="bottom"></td>
						</tr>
						<tr>
							<td height="15" align="left" valign="top">&nbsp;
							</td>
							<td height="15" align="left" valign="top" class="12">
							 <table width="100%" height="20" border="0" cellpadding="0"cellspacing="0">
								<tr><td height="20">
								<div class="right_proaducts">�ҵ�λ��&gt;&gt;�����������&gt;��Ʒ�б�</div>
								<br />
														<%
															Productuser p = (Productuser)session.getAttribute("productuser");
															if(p!=null&&p.getSuperuser().equals("3")){
														%>
									<table width="100%">
										<tbody>
										<tr>
											<td height="20" width="30%" >
											<div class="table_t">|&nbsp;&nbsp;��ӭ,<%=p.getUsername()%>&nbsp;&nbsp;|&nbsp;&nbsp;
												<a href="<%=path%>/login?a=out" class="table_t">ע��</a>&nbsp;&nbsp;|</div>
											</td>
											<td width="70%">
											<div><a href="<%=path%>/user?a=all"><img src="<%=path%>/images/userlist.jpg" border="0" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											     <a href="<%=path%>/product?a=all"><img src="<%=path%>/images/productslist.jpg" border="0" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												 <a href="<%=path%>/order?a=all"><img src="<%=path%>/images/ShowOrders.jpg" border="0" /></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												 <a href="<%=path%>/product/add_products_admin.jsp"><img src="<%=path%>/images/addProduct.jpg" border="0" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</div>
											</td>
										</tr>
																<!-- ��Ʒ�б� -->
									  </tbody>
									</table>
									<table class="mars" cellspacing="1" cellpadding="0" width="100%" border="0">
									  <tbody>
										<tr bgcolor="#fba661" height="30">
										   <td><div align="center">���</div></td>
										   <td><div align="center">����</div></td>
										    <td><div align="center">catalogno</div></td>
										    <td><div align="center">MDLNumber</div></td>
										    <td><div align="center">�۸�</div></td>
											<td><div align="center">���</div></td>
											<td><div align="center">ͼƬ</div>
											</td><td><div align="center">�޸�</div></td>
											<td><div align="center">ɾ��</div></td>
										</tr>		
							         <% 	List list= (ArrayList)session.getAttribute("productlist");
										    Iterator its= list.iterator();
										    while(its.hasNext())
										    {
										       Product pu = new Product();
										       pu= (Product)its.next();
										       int id= pu.getPid();
									%>
										    <tr bgcolor="#f3f3f3" height="25"> 
										    <td width="10%"><div align="center"><%=pu.getProductId()%></div></td>
										    <td width="13%"><div align="center"><%=pu.getProductname()%></div></td>
										    <td width="12%"><div align="center"><%=pu.getCatalogno()%></div></td>
										    <td width="13%"><div align="center"><%=pu.getMdlnumber()%></div></td>
										    <td width="10%"><div align="center"><%=pu.getPrice1()%></div></td>
										    <td width="13%"><div align="center"><%=pu.getStock()%></div></td>
										    <%if(pu.getStructure()==null||pu.getStructure().equals(""))
										    {
										    %>
										     <td width="12%"><div align="center"><img src="<%=request.getContextPath()+"/upload/23007.gif"%>" width="60" height="30" hspace="0" border="0"/></div></td>
										    <%
										    }else
										    { 
										     %>
										     <td width="12%"><div align="center"><img src="<%=request.getContextPath()+"/upload/"+pu.getStructure()%>" width="60" height="30" hspace="0" border="0"/></div></td>
										    <%
										    }%>
										    <td><div align="center"><a href="<%=request.getContextPath()%>/product?a=updateProduct&pid=<%=id%>"><img src="<%=request.getContextPath()%>\images\update1.gif" width="20" height="20" border="0" alt="�޸�"/></a></div></td>
										    <td><div align="center"><a href="<%=request.getContextPath()%>/product?a=del&pid=<%=id%>" onclick="return confirm_oper();"><img src="<%=request.getContextPath()%>\images\sz_tu02.gif" border="0" alt="ɾ��"/></a></div></td>
										  </tr>
										 <%}%>				
																			  </tbody>
							        </table>
														<%
															} else {	//�������if��else
														%>
																<br/><br/><br/><br/><br/><br/>
																<center><h3>�Բ�����û��Ȩ�޲鿴������</h3></center>
																<br/><br/><br/><br/><br/><br/>
																<br/><br/><br/><br/><br/><br/>
														<%
															}
														%>    
													
											
										</td>
									</tr>
								</table>
								<br />
								<div class="table_wz"></div>
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