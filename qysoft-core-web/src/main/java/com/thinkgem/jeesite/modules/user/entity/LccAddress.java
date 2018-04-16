package com.thinkgem.jeesite.modules.user.entity;

import java.util.Date;
import java.util.List;

public class LccAddress {
    private String address;
    private String tradenum;
    private String rollIn;
    private String money;
    private String sort;
    private String tradeCode;
    private String adds;
    private List<String> addressLift;
    private List<String> addressRight;

    private Date createDate;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTradenum() {
        return tradenum;
    }

    public void setTradenum(String tradenum) {
        this.tradenum = tradenum;
    }

    public String getRollIn() {
        return rollIn;
    }

    public void setRollIn(String rollIn) {
        this.rollIn = rollIn;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getTradeCode() {
        return tradeCode;
    }

    public void setTradeCode(String tradeCode) {
        this.tradeCode = tradeCode;
    }

    public String getAdds() {
        return adds;
    }

    public void setAdds(String adds) {
        this.adds = adds;
    }

    public List<String> getAddressLift() {
        return addressLift;
    }

    public void setAddressLift(List<String> addressLift) {
        this.addressLift = addressLift;
    }

    public List<String> getAddressRight() {
        return addressRight;
    }

    public void setAddressRight(List<String> addressRight) {
        this.addressRight = addressRight;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
