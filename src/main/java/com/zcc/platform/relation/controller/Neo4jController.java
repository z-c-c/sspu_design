package com.zcc.platform.relation.controller;

import com.zcc.platform.relation.dao.Neo4jDao;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * @author zcc
 */
@Controller
@RequestMapping("/neo4j")
public class Neo4jController {

    @Resource(name = "neo4jDaoImpl")
    private Neo4jDao dao;


    @RequestMapping(value = "/test", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    @ResponseBody
    public String test() {
        String cql = "match (p1:person{id:1})-[r*]-(p2:person{id:2}) return p1,p2,r";
        Map<String, Object> params = new HashMap<>(6);
        JSONArray jsonArray = dao.executeCql(cql, params);
        String s = jsonArray.toString();
        System.out.println(s);
        for (Object o : jsonArray) {
            JSONObject jsonObject = JSONObject.fromObject(o);
            JSONObject p1 = (JSONObject) jsonObject.get("p1");
            JSONObject p2 = (JSONObject) jsonObject.get("p2");
            JSONObject r = (JSONObject) jsonObject.get("r");
        }

        return s;
    }
}
