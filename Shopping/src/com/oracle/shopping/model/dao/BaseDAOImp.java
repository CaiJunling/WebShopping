package com.oracle.shopping.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public abstract class BaseDAOImp implements BaseDAO {
	private Connection con;
	private Statement sta;

	public Connection getCon() {
		try {
			try {
				Class.forName(dirverClass);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			con = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	public Statement getSta() {
		try {
			sta = getCon().createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sta;
	}
	/*
	public BaseDAOImp() {
		try {
			con = DriverManager.getConnection(url, username, password);
			sta = con.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}*/

	public void disposeResource(Statement sta, ResultSet rs) {// dispose释放，关闭资源
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (sta != null) {
			try {
				sta.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void disposeResource(Statement sta, ResultSet rs, Connection con) {// dispose释放，关闭资源
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (sta != null) {
			try {
				sta.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	

}
