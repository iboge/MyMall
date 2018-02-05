package com.hwua.admin.service;

import com.hwua.common.po.User;

import java.util.Map;

public interface UserService {

    public int addUser(User user);

    public Map<String,Object> getUser(User user);

    public int changePassword(User user);

}
