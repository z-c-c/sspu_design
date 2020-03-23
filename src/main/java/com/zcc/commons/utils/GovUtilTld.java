package com.zcc.commons.utils;

import com.zcc.manager.govunitmanager.entity.GovUnitEntity;
import com.zcc.manager.govunitmanager.service.GovUnitService;
import com.zcc.manager.govunitmanager.service.impl.GovUnitServiceImpl;
import com.zcc.manager.tagmanager.entity.TagBaseInfoEntity;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

/**
 * @author zcc
 * 自定义govUtilTag对应类 返回GovUtil列表
 */
public class GovUtilTld extends BodyTagSupport {

    private static GovUnitService govUnitService;
    private String id;
    private String style;
    private String clazz;

    {
        WebApplicationContext currentWebApplicationContext = ContextLoader.getCurrentWebApplicationContext();
        govUnitService = Objects.requireNonNull(currentWebApplicationContext).getBean(GovUnitServiceImpl.class);
    }

    @Override
    public int doStartTag() throws JspException {

        try {
            pageContext.getOut().write(getGovUnit());

        } catch (IOException e) {
            e.printStackTrace();
        }
        return super.doStartTag();
    }

    @Override
    public int doEndTag() throws JspException {
        return super.doEndTag();
    }

    private String getGovUnit() {
        List<GovUnitEntity> govUnitServiceAll = govUnitService.findAll();
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("<select class=\"" + this.getClazz() + "\" style=\"" + this.getStyle() + "\" id=\"" + this.getId() + "\"" +
                "                                    >");
        for (GovUnitEntity govUnitEntity : govUnitServiceAll) {
            stringBuffer.append(" <option value=\"" + govUnitEntity.getId() + "\">" + govUnitEntity.getName() + "</option>");
        }
        stringBuffer.append("</select>");
        return stringBuffer.toString();
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
