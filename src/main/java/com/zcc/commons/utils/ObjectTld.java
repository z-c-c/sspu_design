package com.zcc.commons.utils;

import com.zcc.manager.govunitmanager.service.impl.GovUnitServiceImpl;
import com.zcc.platform.event.entity.EventRelationEntity;
import com.zcc.platform.person.entity.PersonEntity;
import com.zcc.platform.person.service.PersonService;
import com.zcc.platform.person.service.impl.PersonServiceImpl;
import com.zcc.platform.unit.entity.UnitEntity;
import com.zcc.platform.unit.service.UnitService;
import com.zcc.platform.unit.service.impl.UnitServiceImpl;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

/**
 * @author zcc
 */
public class ObjectTld extends BodyTagSupport {
    private String id;
    private String style;
    private String clazz;
    private String type;
    private static PersonService personService;
    private static UnitService unitService;

    static {
        WebApplicationContext currentWebApplicationContext = ContextLoader.getCurrentWebApplicationContext();
        personService = Objects.requireNonNull(currentWebApplicationContext).getBean(PersonServiceImpl.class);
        unitService = Objects.requireNonNull(currentWebApplicationContext).getBean(UnitServiceImpl.class);
    }

    @Override
    public int doStartTag() throws JspException {
        return super.doStartTag();
    }

    @Override
    public int doEndTag() throws JspException {
        try {
            if (EventRelationEntity.OBJECT_TYPE_PERSON.equals(this.type)) {
                pageContext.getOut().write(getPerson());
            } else if (EventRelationEntity.OBJECT_TYPE_UNIT.equals(this.type)) {
                pageContext.getOut().write(getUnit());
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
        return super.doEndTag();
    }

    private String getPerson() {
        List<PersonEntity> personEntities = personService.find(null);
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("<select class=\"").append(this.getClazz()).append("\" style=\"").append(this.getStyle()).append("\" id=\"").append(this.getId()).append("\"").append("  multiple=\"multiple\">");
        for (PersonEntity personEntity : personEntities) {
            stringBuilder.append(" <option value=\"").append(personEntity.getPersonId()).append("\">").append(personEntity.getPersonName()).append("</option>");
        }
        stringBuilder.append("</select>");
        return stringBuilder.toString();
    }

    private String getUnit() {
        List<UnitEntity> unitEntities = unitService.find(null, null);
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("<select class=\"").append(this.getClazz()).append("\" style=\"").append(this.getStyle()).append("\" id=\"").append(this.getId()).append("\"").append("  multiple=\"multiple\">");
        for (UnitEntity unitEntity : unitEntities) {
            stringBuilder.append(" <option value=\"").append(unitEntity.getUnitId()).append("\">").append(unitEntity.getUnitName()).append("</option>");
        }
        stringBuilder.append("</select>");
        return stringBuilder.toString();
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
