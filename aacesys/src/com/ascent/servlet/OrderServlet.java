package com.ascent.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ascent.bean.Productuser;

import com.ascent.dao.OrderDAO;
import com.ascent.dao.UserManagerDAO;
import com.ascent.util.ShopCart;

public class OrderServlet extends HttpServlet {
	private static final String CONTENT_TYPE = "text/html; charset=GBK";
	private ServletContext sc = null;

	public void init() throws ServletException {
		super.init();
		sc = this.getServletContext();
	}

	// Process the HTTP Post request
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String state = request.getParameter("a");
		if (state.equals("checkout"))// 结帐的请求
		{
			this.saveOrders(request, response);
		}
		if (state.equals("all"))// 查询所有订单的请求（管理员用户查看所有订单）
		{
			this.findOrderAll(request, response);
		}
		if (state.equals("finditem"))// 按用户查找订单（普通用户查看自己的订单）
		{
			this.findOrderitem(request, response);
		}
		if (state.equals("delitem"))// 删除订单里的产品
		{
			this.delOrderitem(request, response);
		}
		if (state.equals("delorder"))// 删除订单
		{
			this.delOrder(request, response);
		}
		if (state.equals("lookuse"))// 查看用户信息
		{
			this.lookUser(request, response);
		}
		return;
	}

	// Clean up resources
	public void destroy() {
	}

	// 定义一些业务处理方法
	// 查询所有订单方法
	public void findOrderAll(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		OrderDAO Pd = new OrderDAO();
		HttpSession mysession = request.getSession(false);
		Productuser pu = (Productuser) mysession.getAttribute("productuser");
		List orderlist = null;
		if (pu.getSuperuser().equals("3")) {
			try {
				orderlist = Pd.findOrderAllList();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			mysession.setAttribute("orderlist", orderlist);
			
			RequestDispatcher rd = sc.getRequestDispatcher("/product/admin_ordershow.jsp");
			rd.forward(request, response);
		} else {
			try {
				orderlist = Pd.findOrderList(pu.getUid());
			} catch (SQLException e) {
				e.printStackTrace();
			}
			mysession.setAttribute("orderlist", orderlist);
			
			RequestDispatcher rd = sc.getRequestDispatcher("/product/ordershow.jsp");
			rd.forward(request, response);
		}
	}

	// 查询用户信息方法
	public void lookUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("uid");
		int uid = Integer.valueOf(userid);
		UserManagerDAO um = new UserManagerDAO();
		HttpSession mysession = request.getSession(false);
		Productuser ProductUser = um.getProductUserByid(uid);

		mysession.setAttribute("Orderuser", ProductUser);
		
		RequestDispatcher rd = sc.getRequestDispatcher("/product/admin_orderuser.jsp");
		rd.forward(request, response);
	}

	// 查询所有订单对应购物车的产品方法
	public void findOrderitem(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String orderid = request.getParameter("oid");
		int oid = Integer.valueOf(orderid);
		OrderDAO Pd = new OrderDAO();
		HttpSession mysession = request.getSession(false);
		List productlist = new ArrayList();
		try {
			productlist = Pd.findOrderItem(oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mysession.setAttribute("orderitemlist", productlist);
		mysession.setAttribute("orderid", orderid);
		
		RequestDispatcher rd = sc.getRequestDispatcher("/product/orderitem_show.jsp");
		rd.forward(request, response);
	}

	// 删除订单对应购物车的产品方法（管理员所用）
	public void delOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String orderid = request.getParameter("oid");
		int oid = Integer.valueOf(orderid);
		OrderDAO Pd = new OrderDAO();
		HttpSession mysession = request.getSession(false);
		List orderlist = null;
		try {
			Pd.delOrder(oid);
			orderlist = Pd.findOrderAllList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mysession.setAttribute("orderlist", orderlist);
		
		RequestDispatcher rd = sc.getRequestDispatcher("/product/admin_ordershow.jsp");
		rd.forward(request, response);
	}

	// 删除订单对应购物车的产品方法
	public void delOrderitem(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String orderid = request.getParameter("oid");
		String productid = request.getParameter("pid");
		int oid = Integer.valueOf(orderid);
		int pid = Integer.valueOf(productid);
		OrderDAO Pd = new OrderDAO();
		HttpSession mysession = request.getSession(false);
		List productlist = new ArrayList();
		try {
			Pd.delOrderItem(pid, oid);
			productlist = Pd.findOrderItem(oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mysession.setAttribute("orderitemlist", productlist);
		mysession.setAttribute("orderid", orderid);
		
		RequestDispatcher rd = sc.getRequestDispatcher("/product/orderitem_show.jsp");
		rd.forward(request, response);
	}

	public void saveOrders(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		OrderDAO Pd = new OrderDAO();
		// MailDAO md= new MailDAO();
		String content = "";// 产品内容
		String message = "";// 最终发送message
		HttpSession mysession = request.getSession(false);
		String name = request.getParameter("username");
		String tele = request.getParameter("tel");
		String emails = request.getParameter("email");
		String company = request.getParameter("companyname");
		String companyadd = request.getParameter("companyaddress");
		Productuser pu = (Productuser) mysession.getAttribute("productuser");
		Collection con = (Collection) mysession.getAttribute("shopcartlist");// 获取购物车内容
		if (pu == null)// 为游客
		{
			pu = new Productuser();
			pu.setUid(0);
			pu.setUsername(name);
			pu.setTel(tele);
			pu.setEmail(emails);
			pu.setCompanyname(company);
			pu.setCompanyaddress(companyadd);
			try {
				content = Pd.saveOrder(con, pu);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}// 保存订单信息
		} else// 为注册用户
		{
			// 如果用户在页面上做修改，已修改信息为准
			pu.setFullname(name);
			pu.setTel(tele);
			pu.setEmail(emails);
			pu.setCompanyname(company);
			pu.setCompanyaddress(companyadd);
			try {
				content = Pd.saveOrder(con, pu);// 保存订单信息
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		
		message = "<html><center></br></br><body style='background:silver'><table width='550' border='0' cellspacing='0'><tr> <td height='18' colspan='7' bgcolor='#1B83D8'><div align='center' class='table_cc'><div align='left'>产品信息</div> </div></td></tr> <tr> <td width='71' height='26' bgcolor='#FFFFFF' class='table_hui'>　catalogno </td> <td width='100' bgcolor='#FFFFFF' class='table_hui'>名称 </td><td width='107' bgcolor='#FFFFFF' class='table_hui'> cas </td><td width='64' bgcolor='#FFFFFF' class='table_hui'>formula</td><td width='82' bgcolor='#FFFFFF' class='table_hui'>价格</td><td width='59' height='26' bgcolor='#FFFFFF' class='table_hui'>数量 </td></tr><br>"
				+ content
				+ " </table>     <table width='550' border='0'><tr> <td height='1' colspan='4' bgcolor='#8CC6FF'></td></tr><tr> <td height='17' colspan='4'  bgcolor='#1B83D8' class='table_cc'>用户信息 </td></tr><tr><td width='78' height='30' bgcolor='#FFFFFF' class='table_hui'>&nbsp;</td><td width='91'class='table_hui'>用户名： </td><td width='365' bgcolor='#FFFFFF' class='table_hui'>"
				+ pu.getUsername()
				+ "</td></tr><tr><td width='78' height='23' bgcolor='#FFFFFF' class='table_hui'>&nbsp;</td>  <td width='91' height='23' class='table_hui'>电话：</td><td width='365' bgcolor='#FFFFFF' class='table_hui'>"
				+ pu.getTel()
				+ "</td></tr><tr><td width='78' height='23' bgcolor='#FFFFFF' class='table_hui'>&nbsp;</td> <td width='91' height='23' class='table_hui'>Email:</td> <td width='365' class='table_hui'>"
				+ pu.getEmail()
				+ "</td></tr><tr> <td width='78' height='23' bgcolor='#FFFFFF' class='table_hui'>&nbsp;</td> <td width='91' height='23' class='table_hui'>公司名称:</td> <td width='365' class='table_hui'>"
				+ pu.getCompanyname()
				+ "</td></tr></table>  </div></div></body></center></html>";
		
		RequestDispatcher rd=sc.getRequestDispatcher("/product/success.jsp");
	     rd.forward(request,response);

		// 清除购物车
		ShopCart shopCart = (ShopCart) mysession.getAttribute("shopcart");
		shopCart.emptyCart();
	}

}
