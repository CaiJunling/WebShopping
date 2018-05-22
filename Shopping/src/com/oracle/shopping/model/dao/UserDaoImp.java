package com.oracle.shopping.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.oracle.shopping.model.bean.User;

public class UserDaoImp extends BaseDAOImp implements UserDao {

	@Override
	public boolean add(Object o) {

		User user=(User)o;
		boolean result=false;
		Statement  sta=null;
		try {
			sta=getSta();
			int count=sta.executeUpdate("insert into  users(userID,userName,nickName,password,tel)   values(null,'"+user.getUserName()+"','"+user.getNickName()+"','"+user.getPassword()+"','"+user.getTel()+"')");
			result=(count>0)?true:false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	
	}

	@Override
	public boolean delete(Object id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(Object o) {
		User u=(User)o;
		PreparedStatement  preSta=null;
		int result=0;
		try {
			  preSta=getPreSta("update users set userName=? ,nickName=?,sex=?,birthday=?,imageId=?,tel=? where userID=?");
			  preSta.setString(1, u.getUserName());
			  preSta.setString(2, u.getNickName());
			  preSta.setInt(3, u.getSex());;
			  preSta.setInt(4, u.getBirthday());;
			  preSta.setString(5, u.getImageId());
			  preSta.setString(6, u.getTel());
			  preSta.setInt(7, u.getUserID());
			  result=preSta.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result>0?true:false;
	}

	@Override
	public Object list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User login(String tel, String password) {

		User  user=null;
		PreparedStatement  sta=null;
		ResultSet rs=null;
		try {
			System.out.println(tel+password);
			sta=getPreSta("select *  from users where tel=? and passWord=?");
			sta.setString(1, tel);
			sta.setString(2, password);
			rs=sta.executeQuery();
			if(rs.next()) {
				user=new User();
				user.setUserID(rs.getInt("userID"));
				user.setUserName(rs.getString("userName"));
				user.setNickName(rs.getString("nickName"));
				user.setPassword(rs.getString("password"));
				user.setTel(rs.getString("tel"));
				user.setImageId(rs.getString("imageId"));
				user.setBirthday(rs.getInt("birthday"));
				user.setSex(rs.getInt("sex"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	
	}

	@Override
	public User getUserInfoByUserId(int userid) {
		User  user=null;
		PreparedStatement  sta=null;
		ResultSet rs=null;
		try {
			  sta=getPreSta("select *  from users where userID=?");
			sta.setInt(1, userid);
			rs=sta.executeQuery();
			if(rs.next()) {
				user=new User();
				user.setUserID(rs.getInt("userID"));
				user.setTel(rs.getString("tel"));
				user.setPassword(rs.getString("password"));
				if(rs.getString("imageID")!=null)
				{
					user.setUserName(rs.getString("userName"));
					user.setNickName(rs.getString("nickName"));
					user.setImageId(rs.getString("imageId"));
					user.setBirthday(rs.getInt("birthday"));
					user.setSex(rs.getInt("sex"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;	
	}

}
