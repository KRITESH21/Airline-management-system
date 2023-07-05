package com.app.service;

import java.util.List;

import com.app.pojos.Admin;
import com.app.pojos.Packages;
import com.app.pojos.Users;
import com.sun.xml.bind.v2.schemagen.episode.Package;

public interface LoginServiceInterface {

	Admin checkAdminAvailablity();

	void registerAdmin(Admin admin1);

	Users verifyUser(String email, String password);

	Admin verifyAdmin(String email, String password);

	boolean checkEmailAvailable(String email);

	String registerUser(Users user);

	String changePassword(String email, String password);

	List<Packages> flightSearch(String to);

}
