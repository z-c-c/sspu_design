package com.zcc.platform.person.controller;

import com.zcc.commons.utils.Page;
import com.zcc.commons.utils.ResultBean;
import com.zcc.exceptions.MyException;
import com.zcc.log.annotation.Log;
import com.zcc.platform.person.entity.PersonEntity;
import com.zcc.platform.person.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
    public PersonController(PersonService personService) {
        this.personService = personService;
    }

    @Log(name = "保存人员")
    @PostMapping("/save")
    public ResultBean save(PersonEntity personEntity, String tags) {
        return ResultBean.success(personService.save(personEntity, tags));
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

    @Log(name = "查找人员")
    @PostMapping("/find")
    public ResultBean find(String param, int page, int pageSize) throws MyException {
        Map<String, Object> map = new HashMap<>(2);
        int all = personService.find(param).size();
        List<PersonEntity> persons = personService.find(param, Page.setPageAndSize(page, pageSize));
        map.put("total", all);
        map.put("data", persons);
        return ResultBean.success(map);
    }

    @Log(name = "查找人员")
    @PostMapping(value = "/find/tags")
    public ResultBean find(String param, String tags, int page, int pageSize) throws MyException {
        return ResultBean.success(personService.find(param, Page.setPageAndSize(page, pageSize), tags));
    }
}
