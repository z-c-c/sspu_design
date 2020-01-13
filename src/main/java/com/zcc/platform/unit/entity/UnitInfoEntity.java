package com.zcc.platform.unit.entity;

import java.util.Date;

/**
 * @author zcc
 */
public class UnitInfoEntity {

    private String unitId;
    private String unitName;
    private String unitLegalPerson;
    /**
     * 统一社会信用码
     */
    private String usccCode;

    private String status;
    /**
     * 行业
     */
    private String industry;

    private String addr;

    private String street;

    private Date registerTime;

    private String isDelete;


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

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }
}
