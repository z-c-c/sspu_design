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

    /**
     * 单位名称
     */
    private String unitName;
    /**
     * 单位描述
     */
    private String unitDetail;

    /**
     * 单位法人
     */
    private String unitLegalPerson;
    /**
     * 统一社会信用码
     */
    private String usccCode;

    /**
     * 是否经营
     */
    private String status;

    /**
     * 行业
     */
    private String industry;

    /***
     * 单位地址
     */
    private String addr;

    /**
     * 单位组册时间
     */
    private Date registerTime;

    /**
     * 删除标志
     */
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

    public String getUnitDetail() {
        return unitDetail;
    }

    public void setUnitDetail(String unitDetail) {
        this.unitDetail = unitDetail;
    }
}