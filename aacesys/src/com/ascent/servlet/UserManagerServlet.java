package com.ascent.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ascent.bean.Productuser;
import com.ascent.dao.UserManagerDAO;

public class UserManagerServlet extends HttpServlet{
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
	   //��ȡ��¼״̬����¼���˳�ϵͳ����
	   String loginstate= request.getParameter("a");
	   if(loginstate.equals("all"))//Ϊ�˳�ϵͳ����
	   {
	   this.findAllUser(request, response);
	   }
	   if(loginstate.equals("regis"))//Ϊ�˳�ϵͳ����
	   {
	   this.addUser(request, response);
	   }
	   if(loginstate.equals("finduser"))//�����û�
	   {
		   this.findProductUserbyid(request, response);
	   }
	   if(loginstate.equals("update"))//�����û���Ϣ
	   {
		this.updateProductUser(request, response);
	   }
	   if(loginstate.equals("updatesuper"))//�����û���Ϣ
	   {
		this.updateUserSuper(request, response);
	   }
	   if(loginstate.equals("delsuser"))//�����û���Ϣ
	   {
		this.delSoftUser(request, response);
	   }
	   return;
	  }
	  
	 
	  //Clean up resources
	   public void destroy() {
		}
	   //��ѯ�����û�
	   public void findAllUser(HttpServletRequest request, HttpServletResponse response)
	   throws  ServletException, IOException{
		  UserManagerDAO um = new UserManagerDAO();
		   HttpSession mysession = request.getSession(false);
		   List allProductList = um.getAllProductUser();
		   mysession.setAttribute("allproductlist", allProductList);
		   
		   RequestDispatcher rd=sc.getRequestDispatcher("/product/products_showusers.jsp");
		    rd.forward(request,response); 
	   }
	   //�����û���Ȩ��
	   public void updateUserSuper(HttpServletRequest request, HttpServletResponse response)
	   throws  ServletException, IOException{
		   String userid=request.getParameter("uid");
		   String supers = request.getParameter("superuser");
		   int uid= Integer.valueOf(userid);
		   UserManagerDAO um = new UserManagerDAO();
		   um.updateSuperuser(uid, supers);
		   HttpSession mysession = request.getSession(false);
		   List allProductList = um.getAllProductUser();
		   mysession.setAttribute("allproductlist", allProductList);
		 
		   RequestDispatcher rd=sc.getRequestDispatcher("/product/products_showusers.jsp");
		    rd.forward(request,response); 
	   }
	   
//	 ��ɾ���û�
	   public void delSoftUser(HttpServletRequest request, HttpServletResponse response)
	   throws  ServletException, IOException{
		   String userid=request.getParameter("uid");
		   String valuea=request.getParameter("value");
		   int a = Integer.valueOf(valuea);
		   int uid= Integer.valueOf(userid);
		   UserManagerDAO um = new UserManagerDAO();
		   um.delSoftuser(uid,a);
		   HttpSession mysession = request.getSession(false);
		   List allProductList = um.getAllProductUser();
		   mysession.setAttribute("allproductlist", allProductList);
		   
		   RequestDispatcher rd=sc.getRequestDispatcher("/product/products_showusers.jsp");
		   rd.forward(request,response); 
	   }
	   public void findProductUserbyid(HttpServletRequest request, HttpServletResponse response)
	   throws  ServletException, IOException{
		   String userid=request.getParameter("uid");
		   int uid= Integer.valueOf(userid);
		   UserManagerDAO um = new UserManagerDAO();
		   HttpSession mysession = request.getSession(false);
		   Productuser allProductuser = um.getProductUserByid(uid);
		   mysession.setAttribute("UID_Productuser", allProductuser);
		   
		   RequestDispatcher rd=sc.getRequestDispatcher("/product/updateproductuser.jsp");
		    rd.forward(request,response); 
	   }
	   
	   public void updateProductUser(HttpServletRequest request, HttpServletResponse response)
	   throws  ServletException, IOException{
		  String uids = request.getParameter("uid");
		  String citys =request.getParameter("city");
		  String usernames =request.getParameter("username");
		  String fullnames =request.getParameter("fullname");
		  String titles =request.getParameter("title");
		  String tels =request.getParameter("tel");
		  String passwords =request.getParameter("password");
		  String zips =request.getParameter("zip");
		  String jobs =request.getParameter("job");
		  String emails =request.getParameter("email");
		  String countrys =request.getParameter("country");
		  String companynames =request.getParameter("companyname");
		  String companyaddresss= request.getParameter("companyaddress");
		  String notes =request.getParameter("note");
		  Productuser productuser = new Productuser();
		  productuser.setUid(Integer.valueOf(uids));
		  productuser.setCity(citys);
		  productuser.setUsername(usernames);
		  productuser.setFullname(fullnames);
		  productuser.setTitle(titles);
		  productuser.setTel(tels);
		  productuser.setPassword(passwords);
		  productuser.setZip(zips);
		  productuser.setJob(jobs);
		  productuser.setEmail(emails);
		  productuser.setCountry(countrys);
		  productuser.setCompanyname(companynames);
		  productuser.setCompanyaddress(companyaddresss);
		  productuser.setNote(notes);
		  UserManagerDAO um = new UserManagerDAO();
		  um.updateProductuser(productuser);
		  HttpSession mysession = request.getSession(false);
		  List allProductList = um.getAllProductUser();
		  mysession.setAttribute("allproductlist", allProductList);
		  
		  RequestDispatcher rd=sc.getRequestDispatcher("/product/products_showusers.jsp");
		    rd.forward(request,response); 
		  
	   }
	   public void addUser(HttpServletRequest request, HttpServletResponse response)
	   throws  ServletException, IOException{
		   HttpSession session = request.getSession(false);
		   UserManagerDAO um = new UserManagerDAO();
//		 ��session��ȡ��֤��
		      String code_temp = (String)session.getAttribute("CODE");
		      //��ȡҳ��form�������ֵ
		      String codes =request.getParameter("code");
		      String usernames =request.getParameter("username");
			  String passwords =request.getParameter("password");
			  String companynames =request.getParameter("companyname");
			  String companyaddresss= request.getParameter("companyaddress");
			  String countrys =request.getParameter("country");
			  String citys =request.getParameter("city");
			  String jobs =request.getParameter("job");
			  String tels =request.getParameter("tel");
			  String zips =request.getParameter("zip");
			  String emails =request.getParameter("email");
			  
			//��session����֤��ǿ����գ�����ȫ
		   session.setAttribute("CODE", null);
		   if(!code_temp.equalsIgnoreCase(codes.trim())){
			   //"���������֤�벻ƥ�䣬������ע��"
			    request.setAttribute("error","regist_tip.code.error");
				RequestDispatcher rd=sc.getRequestDispatcher("/product/register.jsp");
			    rd.forward(request,response);
			}else{
				Productuser pu= um.findProductUserByusername(usernames);
				if(pu!=null){
					//"��ʹ�õ��û����Ѿ���ռ���ˣ�������ע��"
					request.setAttribute("error","regist_tip.username.used");
					RequestDispatcher rd=sc.getRequestDispatcher("/product/register.jsp");
				    rd.forward(request,response);
				}else
				{
				  Productuser productuser = new Productuser();
				  productuser.setCity(citys);
				  productuser.setUsername(usernames);
				  productuser.setTel(tels);
				  productuser.setPassword(passwords);
				  productuser.setZip(zips);
				  productuser.setJob(jobs);
				  productuser.setEmail(emails);
				  productuser.setCountry(countrys);
				  productuser.setCompanyname(companynames);
				  productuser.setCompanyaddress(companyaddresss);
				  productuser.setSuperuser("1");
				  um.addProductUser(productuser);
				 
				  RequestDispatcher rd=sc.getRequestDispatcher("/product/regist_succ.jsp");
				    rd.forward(request,response);
				}
	   }
	   }
	
}
