<%@ page language="java"
	import="java.util.*,com.ascent.bean.Productuser" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>AscentWeb��������</title>
		<link rel="stylesheet" href="<%=path%>/css/andreas08(blue).css" type="text/css" media="screen,projection" />
	</head>

	<body>
		<form name="form" method="post" action="">
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
				<%
					Productuser p = (Productuser) session.getAttribute("productuser");
					if (p != null && p.getSuperuser().equals("3")) {
				%>
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
											<div class="table_t">
												|&nbsp;&nbsp;��ӭ,
												<%=p.getUsername()%>
												&nbsp;&nbsp;|&nbsp;&nbsp;
												<a href="<%=path%>/login?a=out" class="table_t">ע��</a>&nbsp;&nbsp;|
											</div>
										</td>
										<td>
										<div>
										<a href="<%=path%>/user?a=all"><img src="<%=path%>/images/userlist.jpg" border="0" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="<%=path%>/product?a=all"><img src="<%=path%>/images/productslist.jpg" border="0" /> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="<%=path%>/product/mailmanager.jsp"><img src="<%=path%>/images/mailmanager.jpg" border="0" /> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									    </div>
										</td>
									</tr>
								</table>
								<br />
								
								<table width="100%" border="0" cellspacing="1" cellpadding="0"
									class="mars">
									<tr bgcolor="#fba661" height="25">
										<td width="10%" bgcolor="#fba661">
											<div align="center">
												�û���
											</div>
										</td>
										<td width="13%" bgcolor="#fba661">
											<div align="center">
												Email
											</div>
										</td>
										<td width="12%" bgcolor="#fba661">
											<div align="center">
												�绰
											</div>
										</td>
										<td width="13%" bgcolor="#fba661">
											<div align="center">
												��˾����
											</div>
										</td>
										<td width="13%" bgcolor="#fba661">
											<div align="center">
												��ɫ
											</div>
										</td>
										<td width="9%" bgcolor="#fba661">
											<div align="center">
												�޸�
											</div>
										</td>
										<td width="10%" bgcolor="#fba661">
											<div align="center">
												��ɫ�޸�
											</div>
										</td>
										<td width="10%" bgcolor="#fba661">
											<div align="center">
												״̬
											</div>
										</td>
									</tr>
									<%
											////PageBean pBean = (PageBean)session.getAttribute("productuser_page_list");
											List list = (ArrayList) session.getAttribute("allproductlist");
											Iterator its = list.iterator();
											while (its.hasNext()) {
												Productuser pu = new Productuser();
												pu = (Productuser) its.next();
												String state = pu.getSuperuser();
												String del = String.valueOf(pu.getDelFlag().intValue());
									%>
												<tr bgcolor="#f3f3f3" height="25">
													<td width="10%">
														<div align="center">
															<%=pu.getUsername()%>
														</div>
													</td>
													<td width="13%">
														<div align="center">
															<%=pu.getEmail()%>
														</div>
													</td>
													<td width="12%">
														<div align="center">
															<%=pu.getTel()%>
														</div>
													</td>
													<td width="13%">
														<div align="center">
															<%=pu.getCompanyname()%>
														</div>
													</td>
													<%
														if (state.equals("3")) {
													%>
															<td width="13%">
																<div align="center">
																	����Ա
																</div>
															</td>
													<%
														} else {
													%>
															<td width="13%">
																<div align="center">
																	��ͨ�û�
																</div>
															</td>
													<%
													}
													%>
													<td width="9%">
														<div align="center">
															<a href="user?a=finduser&uid=<%=pu.getUid()%>"><img
																	src="<%=path%>/images/update1.gif"
																	width="20" height="20" border="0" alt="�޸�" />
															</a>
														</div>
													</td>
													<td width="10%">
														<div align="center">
															<a
																href="<%=path%>/product/changesuperuser.jsp?uid=<%=pu.getUid()%>&superuser=<%=state%>"><img
																	src="<%=path%>/images/Changeuser.gif"
																	width="20" height="20" border="0" alt="��ɫ�޸�" />
															</a>
														</div>
													</td>
													<%
														if (state.equals("3")) {
													%>
															<td>
																<div align="center">
																	�޲���
																</div>
															</td>
													<%
														} else if (del.equals("1")) {
													%>
															<td>
																<div align="center">
																	<a href="user?a=delsuser&uid=<%=pu.getUid()%>&value=0"
																		onclick="return confirm_oper();"><img
																			src="<%=path%>/images/sz_tu01.gif"
																			border="0" alt="ɾ��" />
																	</a>
																</div>
															</td>
													<%
														} else {
													%>
															<td>
																<div align="center">
																	<a href="user?a=delsuser&uid=<%=pu.getUid()%>&value=1"
																		onclick="return confirm_oper();"><img
																			src="<%=path%>/images/sz_tu02.gif"
																			border="0" alt="�ָ�" />
																	</a>
																</div>
															</td>
													<%
														}
													%>
												</tr>
									<%
										}
									%>
								</table>
								<table width="100%" height="100" border="0" cellpadding="0"
									cellspacing="0">
									<tr>
										<td valign="top" class="12">
											&nbsp;
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
				<%
					} else {//�������if��else 
				%>
						<center>
							<h3>
								�Բ�����û��Ȩ�޲鿴������
							</h3>
						</center>
				<%
					}
				%>
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
