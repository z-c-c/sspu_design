package com.zcc.manager.tagmanager.entity;

import java.io.Serializable;

/**
 * @author zcc
 */
public class TagBaseInfoEntity implements Serializable {

    private String tagId;
    private String tagName;
    private String tagExplain;
    private String tagLabelType;
    private String tagCssCode;
    private String isDelete;

    public String getTagId() {
        return tagId;
    }

    public void setTagId(String tagId) {
        this.tagId = tagId;
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public String getTagExplain() {
        return tagExplain;
    }

    public void setTagExplain(String tagExplain) {
        this.tagExplain = tagExplain;
    }

    public String getTagLabelType() {
        return tagLabelType;
    }

    public void setTagLabelType(String tagLabelType) {
        this.tagLabelType = tagLabelType;
    }

    public String getTagCssCode() {
        return tagCssCode;
    }

    public void setTagCssCode(String tagCssCode) {
        this.tagCssCode = tagCssCode;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }
}
