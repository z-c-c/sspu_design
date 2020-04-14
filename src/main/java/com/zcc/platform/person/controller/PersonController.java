package com.zcc.platform.person.controller;

import com.zcc.commons.utils.FileUtil;
import com.zcc.commons.utils.Page;
import com.zcc.commons.utils.ResultBean;
import com.zcc.commons.utils.StringUtil;
import com.zcc.exceptions.MyException;
import com.zcc.log.annotation.Log;
import com.zcc.platform.person.entity.PersonEntity;
import com.zcc.platform.person.service.PersonService;
import com.zcc.platform.warning.entity.WarningEntity;
import com.zcc.platform.warning.service.WarningService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zcc
 */
@RestController
@RequestMapping("/persons")
public class PersonController {

    private final PersonService personService;

    @Autowired
    private WarningService warningService;
    @Autowired
    public PersonController(PersonService personService) {
        this.personService = personService;
    }

    @Log(name = "保存人员")
    @PostMapping("/save")
    public ResultBean save(PersonEntity personEntity, String tags) {
        String personId = personService.save(personEntity, tags);
        WarningEntity warning = warningService.findWarningByNoticeObjectIdAndType(personId, WarningEntity.WARNING_PERSON);
        if (warning != null) {
            warningService.saveWarning(warning);
        }
        return ResultBean.success(personId);
    }

    @Log(name = "上传照片")
    @PostMapping("/upImage")
    public ResultBean uploadImage(HttpServletRequest request, String attrName, String personId) {
        String fileName = FileUtil.upLoadImage(request, attrName, personId);
        PersonEntity byId = personService.findById(personId);
        byId.setPersonImage(fileName);
        personService.save(byId);
        return ResultBean.success();
    }

    @Log(name = "删除人员")
    @DeleteMapping("/del/{id}")
    public ResultBean del(@PathVariable("id") String personId) {
        personService.del(personId);
        return ResultBean.success();
    }

    @Log(name = "查找人员")
    @GetMapping("/{id}")
    public ResultBean findById(@PathVariable("id") String personId) {
        return ResultBean.success(personService.findById(personId));
    }

    @Log(name = "人员性别统计")
    @GetMapping("/gender")
    public ResultBean genderCount() {
        Map<String, Object> map = new HashMap<>(2);
        map.put("men", personService.findByGender("男").size());
        map.put("women", personService.findByGender("女").size());
        return ResultBean.success(map);
    }

    @Log(name = "查找人员")
    @PostMapping("/find")
    public ResultBean find(String param, String tags, int page, int pageSize) throws MyException {
        Map<String, Object> map = new HashMap<>(2);
        if (StringUtil.isValidStr(tags)) {
            int all = personService.find(param, tags).size();
            List<PersonEntity> persons = personService.find(param, Page.setPageAndSize(page, pageSize), tags);
            map.put("total", all);
            map.put("data", persons);
            return ResultBean.success(map);
        } else {
            int all = personService.find(param).size();
            List<PersonEntity> persons = personService.find(param, Page.setPageAndSize(page, pageSize));
            map.put("total", all);
            map.put("data", persons);
            return ResultBean.success(map);
        }

    }

    @Log(name = "查找全部人员")
    @GetMapping("/findAll")
    public ResultBean findAll() {
        return ResultBean.success(personService.findAll());
    }

    @Log(name = "单个人物的数据聚合")
    @PostMapping("/dataTogether")
    public ResultBean dataTogether(String personId, int page, int pageSize) throws MyException {
        Map<String, Object> result = new HashMap<>(2);
        result.put("total", personService.dateTogether(personId).size());
        result.put("data", personService.dateTogether(personId, Page.setPageAndSize(page, pageSize)));
        return ResultBean.success(result);
    }

    @Log(name = "所有人物的数据聚合")
    @PostMapping("/dataTogether/all")
    public ResultBean dataTogether(int page, int pageSize) throws MyException {
        Map<String, Object> result = new HashMap<>(2);
        result.put("total", personService.dateTogetherAll().size());
        result.put("data", personService.dateTogetherAll(Page.setPageAndSize(page, pageSize)));
        return ResultBean.success(result);
    }

}
