package com.zcc.platform.unit.entity;

import java.util.Date;
import java.io.Serializable;

/**
 * (UnitInfo)实体类
 *
 * @author makejava
 * @since 2020-04-02 11:30:57
 */
public class UnitEntity implements Serializable {
    private static final long serialVersionUID = -11733203836876614L;

    private String unitId;

    private String unitName;

    private String unitLegalPerson;

    private String usccCode;

    private String status;

    private String industry;

    private String addr;

    private String street;

    private Date registerTime;

    private String isdelete;


    public String getUnitId() {
        return unitId;
    }

    public void setUnitId(String unitId) {
        this.unitId = unitId;
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

    public String getUnitLegalPerson() {
        return unitLegalPerson;
    }

    public void setUnitLegalPerson(String unitLegalPerson) {
        this.unitLegalPerson = unitLegalPerson;
    }

    public String getUsccCode() {
        return usccCode;
    }

    public void setUsccCode(String usccCode) {
        this.usccCode = usccCode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public String getIsdelete() {
        return isdelete;
    }

    public void setIsdelete(String isdelete) {
        this.isdelete = isdelete;
    }

}