package com.oracle.shopping.model.dao;

import com.oracle.shopping.model.bean.User;

public interface UserDao extends BaseDAO {
	public User  login(String tel,String password);
	public  User getUserInfoByUserId(int userid);

}
