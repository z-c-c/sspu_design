package com.zcc.platform.person.entity;

/**
 * @author zcc
 */
public class PersonEntity {

    private String personId;
    private String personName;
    private String age;
    private String personUsedName;
    private String gender;
    private String personIdentityNo;
    private String personImage;
    /**
     * 国籍
     */
    private String nationality;
    /**
     * 籍贯
     */
    private String nativePlace;
    private String phoneNo;
    /**
     * 居住地
     */
    private String liveAddr;

    private String isDelete;

    public String getPersonId() {
        return personId;
    }

    public void setPersonId(String personId) {
        this.personId = personId;
    }

    public String getPersonName() {
        return personName;
    }

    public void setPersonName(String personName) {
        this.personName = personName;
    }

    public String getPersonUsedName() {
        return personUsedName;
    }

    public void setPersonUsedName(String personUsedName) {
        this.personUsedName = personUsedName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPersonIdentityNo() {
        return personIdentityNo;
    }

    public void setPersonIdentityNo(String personIdentityNo) {
        this.personIdentityNo = personIdentityNo;
    }

    public String getPersonImage() {
        return personImage;
    }

    public void setPersonImage(String personImage) {
        this.personImage = personImage;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getNativePlace() {
        return nativePlace;
    }

    public void setNativePlace(String nativePlace) {
        this.nativePlace = nativePlace;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getLiveAddr() {
        return liveAddr;
    }

    public void setLiveAddr(String liveAddr) {
        this.liveAddr = liveAddr;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }
}
