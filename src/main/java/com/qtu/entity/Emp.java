package com.qtu.entity;

import java.util.Date;

public class Emp {
    private Integer userId;

    private String userName;

    private String userRealname;

    private String userPwd;

    private String userSex;

    private String phonenumber;

    private Date userBorn;
    
    private String userBorn2;

    private String userAddress;

    private String userHobby;

    private String userEmail;

    private String selfassessment;

    private String headpic;
    

    public String getUserBorn2() {
		return userBorn2;
	}

	public void setUserBorn2(String userBorn2) {
		this.userBorn2 = userBorn2;
	}

	public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserRealname() {
        return userRealname;
    }

    public void setUserRealname(String userRealname) {
        this.userRealname = userRealname;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public Date getUserBorn() {
        return userBorn;
    }

    public void setUserBorn(Date userBorn) {
        this.userBorn = userBorn;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserHobby() {
        return userHobby;
    }

    public void setUserHobby(String userHobby) {
        this.userHobby = userHobby;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getSelfassessment() {
        return selfassessment;
    }

    public void setSelfassessment(String selfassessment) {
        this.selfassessment = selfassessment;
    }

    public String getHeadpic() {
        return headpic;
    }

    public void setHeadpic(String headpic) {
        this.headpic = headpic;
    }

	@Override
	public String toString() {
		return "Emp [userId=" + userId + ", userName=" + userName + ", userRealname=" + userRealname + ", userPwd="
				+ userPwd + ", userSex=" + userSex + ", phonenumber=" + phonenumber + ", userBorn=" + userBorn
				+ ", userAddress=" + userAddress + ", userHobby=" + userHobby + ", userEmail=" + userEmail
				+ ", selfassessment=" + selfassessment + ", headpic=" + headpic + "]";
	}
    
}