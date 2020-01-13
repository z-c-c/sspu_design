package com.zcc.commons.utils;

import com.zcc.manager.tagmanager.entity.TagBaseInfoEntity;
import com.zcc.manager.tagmanager.service.TagBaseInfoService;
import com.zcc.manager.tagmanager.service.impl.TagBaseInfoServiceImpl;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * @author zcc
 */
public class TagTld extends BodyTagSupport {

    private static TagBaseInfoService service;
    private String id;
    private String style;
    private String clazz;

    static {
        WebApplicationContext currentWebApplicationContext = ContextLoader.getCurrentWebApplicationContext();
        service = Objects.requireNonNull(currentWebApplicationContext).getBean(TagBaseInfoServiceImpl.class);
    }

    @Override
    public int doStartTag() throws JspException {
        return super.doStartTag();
    }


    @Override
    public int doEndTag() throws JspException {
        System.out.println(this.getClazz());
        try {
            pageContext.getOut().write("");
        } catch (IOException e) {
            e.printStackTrace();
        }
        Map<String, List<TagBaseInfoEntity>> objectTag = getObjectTag();
        List<TagBaseInfoEntity> personTag = objectTag.get(ConstUtil.PERSON_TAG);
        List<TagBaseInfoEntity> eventTag = objectTag.get(ConstUtil.EVENT_TAG);
        List<TagBaseInfoEntity> unitTag = objectTag.get(ConstUtil.UNIT_TAG);

        StringBuffer tagString = new StringBuffer();
        tagString.append(" <div id=\"" + this.getId() + "\" style=\"" + this.getStyle() + "\" class=\"" + this.getClazz() + "\">\n" +
                "                            <div class=\"active\">对象标签</div>\n" +
                "                        </div>\n" +
                "                        <div class=\"tabCon\">\n" +
                "                            <div class=\"  tabConSon2\">\n" +
                "                                <div>");
        if (personTag != null) {
            tagString.append("<div class=\"tabConItem\">\n" +
                    "                                        <strong>人员标签</strong>\n" +
                    "                                        <div class=\"everyTab \">");
            for (TagBaseInfoEntity tagBaseInfoEntity : personTag) {
                tagString.append(" <span class=\"span\" id=\"" + tagBaseInfoEntity.getTagId() + "\">" + tagBaseInfoEntity.getTagName() + "</span>");
            }
            tagString.append("</div></div>");
        }
        if (unitTag != null) {
            tagString.append("<div class=\"tabConItem\">\n" +
                    "                                        <strong>单位标签</strong>\n" +
                    "                                        <div class=\"everyTab \">");
            for (TagBaseInfoEntity tagBaseInfoEntity : unitTag) {
                tagString.append(" <span class=\"span\" id=\"" + tagBaseInfoEntity.getTagId() + "\">" + tagBaseInfoEntity.getTagName() + "</span>");
            }
            tagString.append("    </div></div>");
        }
        if (eventTag != null) {
            tagString.append(" <div class=\"tabConItem\">\n" +
                    "                                        <strong class=\"\" code=\"TAG_LABEL_EVENT_MSBZ\">事件标签</strong>\n" +
                    "                                        <div class=\"everyTab \">");
            for (TagBaseInfoEntity tagBaseInfoEntity : eventTag) {
                tagString.append(" <span class=\"span\" id=\"" + tagBaseInfoEntity.getTagId() + "\">" + tagBaseInfoEntity.getTagName() + "</span>");
            }
            tagString.append("    </div></div>");
        }
        tagString.append("    </div></div></div>");
        try {
            pageContext.getOut().write(tagString.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return super.doEndTag();
    }

    private static Map<String, List<TagBaseInfoEntity>> getObjectTag() {
        Map<String, List<TagBaseInfoEntity>> map = new HashMap<>(3);
        TagBaseInfoEntity tag = new TagBaseInfoEntity();
        tag.setTagLabelType(ConstUtil.PERSON_TAG);
        List<TagBaseInfoEntity> personTag = service.find(tag);
        tag.setTagLabelType(ConstUtil.EVENT_TAG);
        List<TagBaseInfoEntity> eventTag = service.find(tag);
        tag.setTagLabelType(ConstUtil.UNIT_TAG);
        List<TagBaseInfoEntity> unitTag = service.find(tag);
        map.put(ConstUtil.PERSON_TAG, personTag);
        map.put(ConstUtil.EVENT_TAG, eventTag);
        map.put(ConstUtil.UNIT_TAG, unitTag);
        return map;
    }

    @Override
    public String getId() {
        return id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public String getClazz() {
        return clazz;
    }

    public void setClazz(String clazz) {
        this.clazz = clazz;
    }

}
