<%@ page language="java" import="java.util.*,com.ascent.bean.*" contentType="text/html;charset=gb2312"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>AscentWeb��������</title>
		<link rel="stylesheet" href="<%=path%>/css/andreas08(blue).css"
			type="text/css" media="screen,projection" />
		<script language="javascript">
 
</script>
	</head>

	<body>

		<div id="container">

			<div id="header">

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
						<li></li>
					</ul>
			</div>

			<div id="content2">
				<table width="100%" height="41" border="0" align="center"
					cellpadding="0" cellspacing="0">
					<tr>
						<td width="15" height="18" align="left" valign="top">
							<div align="left"></div>
						</td>
						<td width="385" align="left" valign="bottom" class="12">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td height="4" colspan="2" align="left" valign="bottom"></td>
					</tr>

					<tr>
						<td height="15" align="left" valign="top">
							&nbsp;
						</td>
						<td height="15" align="left" valign="top" class="12">
							<table width="100%" height="20" border="0" cellpadding="0"
								cellspacing="0">
								<tr>
									<td height="20">


										<table cellspacing="0" cellpadding="0" width="100%" border="0">
											<tbody>
												<tr>
													<%
														Productuser p = (Productuser)session.getAttribute("productuser");
														if(p!=null&&p.getSuperuser().equals("3")){  //����Ա
													%>
															<td>
																<div align="left">
																	|&nbsp;&nbsp;��ӭ,<%=p.getUsername() %>&nbsp;&nbsp;|&nbsp;&nbsp;
																	<a href="<%=request.getContextPath()%>/login?a=out" class="table_t">ע��</a>&nbsp;&nbsp;|
																</div>
															</td>
															<td>
																<div align="center">
																	<a href="<%=request.getContextPath()%>/product?a=all"><img src="<%=request.getContextPath()%>/images/productslist.jpg" width="75" height="17" border="0"/></a>
																</div>
															</td>
															<td>
																<div align="center">
																	<a href="<%=request.getContextPath()%>/order?a=all">��������</a>
																</div>
															</td>
															<td>
																<div align="center">
																	&nbsp;
																</div>
															</td>
															<td>
																<div align="center">
																	&nbsp;
																</div>
															</td>
													<%
														} else if(p!=null&&p.getSuperuser().equals("1")){  //ע���û�
													%>
															<td>
																<div align="left">
																	|&nbsp;&nbsp;��ӭ,<%=p.getUsername() %>&nbsp;&nbsp;|&nbsp;&nbsp;
																	<a href="<%=request.getContextPath()%>/logina=out" class="table_t">ע��</a>&nbsp;&nbsp;|
																</div>
															</td>
															<td>
																<div align="center">
																	&nbsp;
																</div>
															</td>
															<td>
																<div align="center">
																	<a href="<%=request.getContextPath()%>/order?a=all">�鿴����</a>
																</div>
															</td>
															<td>
																<div align="center">
																	<a href="<%=request.getContextPath()%>/product?a=all">��������</a>
																</div>
															</td>
															<td>
																<div align="center">
																	<a href="<%=request.getContextPath()%>/product/checkout.jsp">��������</a>
																</div>
															</td>
													<%
														} else if(p==null){  //δע���û�
													%>
															<td>
																<div align="left">
																	|&nbsp;&nbsp;��ӭ,�ο�&nbsp;&nbsp;|&nbsp;&nbsp;
																	<a href="<%=request.getContextPath()%>/product/register.jsp" class="table_t">ע��</a>&nbsp;&nbsp;|
																</div>
															</td>
															<td>
																<div align="center">
																	&nbsp;
																</div>
															</td>
															<td>
																<div align="center">
																	&nbsp;
																</div>
															</td>
															<td>
																<div align="center">
																	<a href="<%=request.getContextPath()%>/product?a=all">��������</a>
																</div>
															</td>
															<td>
																<div align="center">
																	<a href="<%=request.getContextPath()%>/product/checkout.jsp">��������</a>
																</div>
															</td>
													<%
														}
													%>
												</tr>
											</tbody>
										</table>
										<%
											List orderList = (List)session.getAttribute("orderlist");
											if(orderList==null||orderList.size()<1){
										%>
												<center><h3>�Բ�������û�ж�����</h3></center>
										<%
											} else { 
										%>
												<table class="mars" cellspacing="1" cellpadding="0"
													width="100%" border="0">
													<tbody>
														<tr bgcolor="#fba661">
															<td>
																<div align="center">
																	���
																</div>
															</td>
															<td>
																<div align="center">
																	�鿴
																</div>
															</td>
														</tr>
														<%
															Iterator its= orderList.iterator();
														    while(its.hasNext()){
															    Orders pu = new Orders();
															    pu= (Orders)its.next();
															    int orderid= pu.getOrderid();
													    %>
																<tr>
																	<td bgcolor="#f3f3f3">
																		<div align="center">
																			<%=orderid%>
																		</div>
																	</td>
																	<td bgcolor="#f3f3f3">
																		<div align="center">
																			<a href="<%=request.getContextPath()%>/order?a=finditem&oid=<%=orderid %>" >�鿴</a>
																		</div>
																	</td>
																</tr>
														<%
															}
														%>
													</tbody>
												</table>
										<%
											}
										%>
										<br />
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
	</body>
</html>
