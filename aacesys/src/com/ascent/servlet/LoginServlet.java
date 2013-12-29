package com.ascent.servlet;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ascent.bean.Productuser;
import com.ascent.dao.LoginDAO;


public class LoginServlet extends HttpServlet {

	 private static final String CONTENT_TYPE = "text/html; charset=GBK";
	 private   ServletContext sc=null;
	 public void init() throws ServletException {
		 super.init();
		 sc=this.getServletContext();
	 }
	 
	 
//	Process the HTTP Post request
	  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	    doGet(request, response);
	  }
	  public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
	   //获取登录状态（登录或退出系统）；
	   String loginstate= request.getParameter("a");
	   if(loginstate.equals("out"))//为退出系统动作
	   {
	     this.loginOut(request, response);
	   }
	   if(loginstate.equals("login"))//为系统登录动作
	   {
	      this.userLogin(request, response);
	   }
	   return;
	  }
	  //Clean up resources
	   public void destroy() {
		}
	   
	   public void userLogin(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
	   {
		   String name= request.getParameter("username");
		   String password=request.getParameter("password");
		   LoginDAO Ld = new LoginDAO();
		   Productuser puser= Ld.logIn(name, password);
		   if(puser==null)
		   {
			   
			   request.setAttribute("error","productuserL_tip.login.fail");
			   RequestDispatcher rd=sc.getRequestDispatcher("/product/products.jsp");
			   rd.forward(request,response);
		   }
		   else
		   {// 用户登录成功  这里开始判断权限 将用户保存到session
				
			   String superuser = puser.getSuperuser();
			   HttpSession mysession = request.getSession(false);
			   mysession.setAttribute("productuser", puser);
				if(superuser.equals("1")){//普通注册用户
					
					 RequestDispatcher rd=sc.getRequestDispatcher("/product/products.jsp");
					 rd.forward(request,response);
				}else if(superuser.equals("2")){//分配了能看到某些药品价格的用户
					 
					 RequestDispatcher rd=sc.getRequestDispatcher("/product/products.jsp");
					 rd.forward(request,response);
				}else if(superuser.equals("3")){//admin 因为第一次来此页面 设置页数为1 
					List allProductList = Ld.getAllUser();
					mysession.setAttribute("allproductlist", allProductList);
					
					 RequestDispatcher rd=sc.getRequestDispatcher("/product/products_showusers.jsp");
					 rd.forward(request,response);
				}
		   }
		   
	   }
	   public void loginOut(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException
	   {
		   HttpSession session = request.getSession(false);
		   //清空所有session；
		   session.invalidate();
		   //返回首页
		   
		   RequestDispatcher rd = sc.getRequestDispatcher("/index.jsp");
		   rd.forward(request,response);
	   }
	   
}
