package com.ascent.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ascent.bean.Product;
import com.ascent.util.DataAccess;

public class ProductDAO {

	public List getAllProduct()
	{
		 List list=new ArrayList();
		 Connection con = DataAccess.getConnection();
		 String sql="select * from product p  order by p.pid ";
		 Statement stmt;
			try {
				stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
		         while (rs.next()){
		         Product pu= new Product();
		         pu.setPid(rs.getInt("pid"));
		         pu.setProductId(rs.getString("product_id"));
		         pu.setProductname(rs.getString("productname"));
		         pu.setCatalogno(rs.getString("catalogno"));
		         pu.setCas(rs.getString("cas"));
		         pu.setFormula(rs.getString("formula"));
		         pu.setMdlnumber(rs.getString("mdlnumber"));
		         pu.setMw(rs.getString("mw"));
		         pu.setNewproduct(rs.getString("newproduct"));
		         pu.setStructure(rs.getString("structure"));
		         pu.setRealstock(rs.getString("realstock"));
		         pu.setPrice1(rs.getString("price1"));
		         pu.setPrice2(rs.getString("price2"));
		         pu.setCategory(rs.getString("category"));
		         pu.setStock(rs.getString("stock"));
		         pu.setRealstock(rs.getString("realstock"));
		         pu.setNote(rs.getString("note"));
		         pu.setDelFlag(rs.getInt("del_flag"));
		         list.add(pu);
		         }
		         rs.close();
		         stmt.close();
		         con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		
	
	}
	//	根据商品编号查询商品
	public List getByProductId(String productid)
	{
		 Connection con = DataAccess.getConnection();
		 String sql="select * from product p where p.product_id='"+productid+"' order by p.pid ";
		 Statement stmt;
		  List list = new ArrayList();
			try {
				stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
		         while (rs.next()){
		        	 Product pu= new Product();
		         pu.setPid(rs.getInt("pid"));
		         pu.setProductId(rs.getString("product_id"));
		         pu.setProductname(rs.getString("productname"));
		         pu.setCatalogno(rs.getString("catalogno"));
		         pu.setCas(rs.getString("cas"));
		         pu.setFormula(rs.getString("formula"));
		         pu.setMdlnumber(rs.getString("mdlnumber"));
		         pu.setMw(rs.getString("mw"));
		         pu.setNewproduct(rs.getString("newproduct"));
		         pu.setStructure(rs.getString("structure"));
		         pu.setRealstock(rs.getString("realstock"));
		         pu.setPrice1(rs.getString("price1"));
		         pu.setPrice2(rs.getString("price2"));
		         pu.setCategory(rs.getString("category"));
		         pu.setStock(rs.getString("stock"));
		         pu.setRealstock(rs.getString("realstock"));
		         pu.setNote(rs.getString("note"));
		         pu.setDelFlag(rs.getInt("del_flag"));
		         list.add(pu);
		         }
		         rs.close();
		         stmt.close();
		         con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		
	}
	
	//根据pid主键查询商品
	public Product getProductByPid(int pid)
	{
		 Connection con = DataAccess.getConnection();
		 String sql="select * from product p where p.pid="+pid+" order by p.pid ";
		 Statement stmt;
		  Product pu= new Product();
			try {
				stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
		         while (rs.next()){
		             pu.setPid(rs.getInt("pid"));
			         pu.setProductId(rs.getString("product_id"));
			         pu.setProductname(rs.getString("productname"));
			         pu.setCatalogno(rs.getString("catalogno"));
			         pu.setCas(rs.getString("cas"));
			         pu.setFormula(rs.getString("formula"));
			         pu.setMdlnumber(rs.getString("mdlnumber"));
			         pu.setMw(rs.getString("mw"));
			         pu.setNewproduct(rs.getString("newproduct"));
			         pu.setStructure(rs.getString("structure"));
			         pu.setRealstock(rs.getString("realstock"));
			         pu.setPrice1(rs.getString("price1"));
			         pu.setPrice2(rs.getString("price2"));
			         pu.setCategory(rs.getString("category"));
			        
			         pu.setStock(rs.getString("stock"));
			         pu.setRealstock(rs.getString("realstock"));
			         pu.setNote(rs.getString("note"));
			         pu.setDelFlag(rs.getInt("del_flag"));
		         }
		         rs.close();
		         stmt.close();
		         con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return pu;
		
	}
	//删除商品
//	根据pid主键查询商品
	public void delProductByPid(int pid)
	{
		 Connection con = DataAccess.getConnection();
		 String sql="delete from product where pid="+pid;
		 Statement stmt;
		 
				try {
					stmt = con.createStatement();
					stmt.executeUpdate(sql);
				    stmt.close();
			        con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			
			
		
	}

	
	//保存产品信息
	public void saveProduct(Product pdt)throws SQLException
	{
		 Connection con = DataAccess.getConnection();
		    String sqlStr = "insert into product (product_id,productname,catalogno,cas,price1,price2,mdlnumber,newproduct,formula," 
		    		+"mw,category,structure,stock,realstock,note,del_flag) "
		                    + "  values ('" + pdt.getProductId()+"',"
		                                  + "'"+pdt.getProductname()+"',"
		                                  + "'"+pdt.getCatalogno()+"',"
		                                  + "'"+pdt.getCas()+"',"
		                                  + "'"+pdt.getPrice1()+"',"
		                                  + "'"+pdt.getPrice2()+"',"
		                                  + "'"+pdt.getMdlnumber()+"',"
		                                  + "'"+pdt.getNewproduct()+"',"
		                                  + "'"+pdt.getFormula()+"',"
		                                  + "'"+pdt.getMw()+"',"
		                                  + "'"+pdt.getCategory()+"',"
		                                  + "'"+pdt.getStructure()+"',"
		                                  + "'"+pdt.getStock()+"',"
		                                  + "'"+pdt.getRealstock()+"',"
		                                  + "'"+pdt.getNote()+"',"
		                                  + "1"
		                                  +" )";
		    Statement stmt;
			stmt = con.createStatement();
			stmt.executeUpdate(sqlStr);
			stmt.close();
			con.close();   
		   
	}
	//修改产品信息
	public void updateProduct(Product pdt)throws SQLException
	{
		 Connection con = DataAccess.getConnection();
		    String sqlStr = "update product  set  product_id='"+pdt.getProductId()+"',"
		    +"productname='"+pdt.getProductname()+"',catalogno='"+pdt.getCatalogno()+"',"
		    +"cas='"+pdt.getCas()+"',price1='"+pdt.getPrice1()+"',price2='"+pdt.getPrice2()+"'," 
		    +"mdlnumber='"+pdt.getMdlnumber()+"',newproduct='"+pdt.getNewproduct()+"'," 
		    +"formula='"+pdt.getFormula()+"',mw='"+pdt.getMw()+"',"
		    +"category='"+pdt.getCategory()+"',"
		    +"stock='"+pdt.getStock()+"',realstock='"+pdt.getRealstock()+"',"
		    +"note='"+pdt.getNote()+"'";
		    if (pdt.getStructure()!=null&&!pdt.getStructure().equals(""))
		    {
		    	sqlStr = sqlStr+",structure='"+pdt.getStructure()+"'";
		    }
		    sqlStr = sqlStr+" where pid="+pdt.getPid(); 
		    Statement stmt;
			stmt = con.createStatement();
			stmt.executeUpdate(sqlStr);
			stmt.close();
			con.close();   
		   
	}
	
//	根据pid主键查询商品
	public List searchProcuct(String searchName, String searchValue)
	{
		 Connection con = DataAccess.getConnection();
		 String sql="select * from product p where p."+searchName+" like '%%"+searchValue+"%' and p.del_flag=1 ";
		 Statement stmt;
		 List productlist = new ArrayList();
			try {
				 stmt = con.createStatement();
				 ResultSet rs = stmt.executeQuery(sql);
		         while (rs.next()){
		         Product pu= new Product();
		         pu.setPid(rs.getInt("pid"));
		         pu.setProductId(rs.getString("product_id"));
		         pu.setProductname(rs.getString("productname"));
		         pu.setCatalogno(rs.getString("catalogno"));
		         pu.setCas(rs.getString("cas"));
		         pu.setFormula(rs.getString("formula"));
		         pu.setMdlnumber(rs.getString("mdlnumber"));
		         pu.setMw(rs.getString("mw"));
		         pu.setNewproduct(rs.getString("newproduct"));
		         pu.setStructure(rs.getString("structure"));
		         pu.setRealstock(rs.getString("realstock"));
		         pu.setPrice1(rs.getString("price1"));
		         pu.setPrice2(rs.getString("price2"));
		         pu.setCategory(rs.getString("category"));
		         pu.setNote(rs.getString("note"));
		         pu.setStock(rs.getString("stock"));
		         pu.setDelFlag(rs.getInt("del_flag"));
		         productlist.add(pu);
		         }
		         rs.close();
		         stmt.close();
		         con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return productlist;
		
	}

}
