<%@ page language="java"  contentType="text/html;charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<title>ע��ҳ��</title>
<link rel="stylesheet" href="<%=path%>/css/andreas08(blue).css" type="text/css" media="screen,projection" />
	<style type="text/css">
/* ҳ��������ʽ */
body, td, input {
    font-family:Arial;
    font-size:12px;
}
/* ��������ʽ */
table.default {
    border-collapse:collapse;
    width:350px;
}
/* ���Ԫ����ʽ */
table.default td {
    border:1px solid black;
    padding:3px;
}
/* ��ͷ��ʽ */
table.default td.item {
    background:#0e59c0;
    color:#fff;
}
/* ������Ϣ��ʽ */
div.ok {
    color:#006600;
}
/* ������Ϣ��ʽ */
div.warning {
    color:#FF0000;
}
</style>
<script src="js/prototype-1.4.0.js" type="text/javascript"></script>
<script src="js/json.js" type="text/javascript"></script>
<script  language="javascript"  >
	function refresh(){
		//���»�ȡ��֤��ͼƬ��src����
		document.getElementById("authImg").src='authImg?now='+new Date();
	}

	function checkUserName(){
		//����ĵ�ַ
		var url="registCheckAction.action";
		var params=Form.Element.serialize('username');
		//����Ajax.Request���󣬶�Ӧ�ڷ�������
				var myAjax = new Ajax.Request(
				url,
				{
					//����ʽ��POST
					method:'post',
					//�������
					parameters:params,
					//ָ���ص�����
					onComplete: processResponse,
					//�Ƿ��첽��������
					asynchronous:true
				});
	}
	
	
	function processResponse(request)
			{
				var action = request.responseText.parseJSON();
				$("usernameCheckDiv").innerHTML = action.tip;
			}	

	function check(){
	if(form.username.value == "")
    {
       alert("�û�������Ϊ�գ�"); 
       form.username.focus();
        return false;
    }
   if(form.password.value == "")
    {
        alert("���������� ��");
        form.password.focus();
         return false;
    }
     if(form.password2.value == "")
    {
        alert("���ٴ��������� ��");
       form.password2.focus();
         return false;
    }
    if(form.password.value!=form.password2.value){
    
       alert("������������벻һ�� ��");
        form.password2.focus();
         return false;
    }
    if(form.email.value == "")
    {
        alert("�������ʼ� ��");
        form.email.focus();
         return false;
    }
    
 var regm = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;//��֤Mail��������ʽ,^[a-zA-Z0-9_-]:��ͷ����Ϊ��ĸ,�»���,����,
  if (form.email.value!="" && !form.email.value.match(regm) )
   		 {
     		alert("�ʼ���ʽ���ԣ������������룡");
	     	form.email.focus();
             return false;
   		 }  
   if(form.code.value==""){
   		alert("��������֤�룡");
        form.code.focus();
         return false;
   }
  else 
    return true;
}

</script>
</head>
<body> 
<form name="form" method="post"  action="<%=request.getContextPath()%>/user?a=regis" />
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
							 <table width="100%" height="20" border="0" cellpadding="0"cellspacing="0">
								<tr><td height="20"><div class="right_proaducts"><font color="red">ע����Ϣ:</font>
												<br />
											</div>
										<DIV class=padding>
										<DIV id=middlebody>
														<%
															 String error = (String)request.getAttribute("error");
																 if(error!=null)
																 {
																  request.removeAttribute("error");
																 %>
																 <%=error %>
																 <%
																 }
 
														%>
							
									<table width="70%" class="mars" cellspacing="1" cellpadding="0" width="100%" border="0">
									  <tbody>
<tr>

    <td class="item" width="41%"><div align="right">�û���:</div></td>
    <td  width="7%"></td>
    <td width="52%">

        <input type="text" name="username" id="username">&nbsp;&nbsp;<font color="red">*</font>

        <div id="usernameCheckDiv" class="warning"></div>    </td>
</tr>

<tr>

    <td class="item"><div align="right">����: </div></td>
     <td  width="7%"></td>
    <td><input type="password" name="password" id="password" >&nbsp;&nbsp;<font color="red">*</font>
      </td>
</tr>

<tr>

    <td class="item"><div align="right">����ȷ��:</div></td>
     <td  width="7%"></td>
    <td>

        <input type="password" name="password2" id="password2" >&nbsp;&nbsp;<font color="red">*</font>
   </td>
</tr>

<tr>

    <td class="item"><div align="right">��˾����:</div></td>
 <td  width="7%"></td>
    <td>

        <input type="text" name="companyname" id="companyname" /></td>
</tr>
<tr>

    <td class="item"><div align="right">��˾��ַ:</div></td>
 <td  width="7%"></td>
    <td>

        <input type="text" name="companyaddress" id="companyaddress" /></td>
</tr>
<tr>

    <td class="item"><div align="right">����:</div></td>
 <td  width="7%"></td>
    <td>

        <input type="text" name="country" id="country" /></td>
</tr>
<tr>

    <td class="item"><div align="right">����:</div></td>
 <td  width="7%"></td>
    <td>

        <input type="text" name="city" id="city" /></td>
</tr>
<tr>

    <td class="item"><div align="right">����:</div></td>
 <td  width="7%"></td>
    <td>

        <input type="text" name="job" id="job" /></td>
</tr>
<tr>

    <td class="item"><div align="right">�绰:</div></td>
 <td  width="7%"></td>
    <td>

        <input type="text" name="tel" id="tel" /></td>
</tr>
<tr>

    <td class="item"><div align="right">Zip:</div></td>
 <td  width="7%"></td>
    <td>

        <input type="text" name="zip" id="zip"/></td>
</tr>
<tr>

    <td class="item"><div align="right">Email:</div></td>
 <td  width="7%"></td>
    <td>

        <input type="text" name="email" id="email" >&nbsp;&nbsp;<font color="red">*</font>
</td>
</tr>
<tr>
 <td class="item"><div align="right">��֤��:</div></td>
 <td  width="7%"></td>
    <td>

        <input type="text" name="code" id="code" >&nbsp;&nbsp;<font color="red">*</font>

        <div id="codeCheckDiv" class="warning"><img src="authImg" id="authImg"/><a href="product/register.jsp#" onClick="refresh()">��һ��</a></div></td>
    
</tr>

<tr>
<td colspan="2" align="center"><input type="submit" value="ע��" onClick="return check();" /> <input type="Reset" value="ȡ��"  /></td>
</tr>
</table>
										
										
										
										
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
