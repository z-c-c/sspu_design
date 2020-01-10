package com.zcc.platform.relation.dao.impl;

import com.zcc.commons.utils.Neo4jConnectionPool;
import com.zcc.platform.relation.dao.Neo4jDao;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.neo4j.driver.*;
import org.neo4j.driver.types.Node;
import org.neo4j.driver.types.Relationship;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zcc
 */
@Component("neo4jDaoImpl")
public class Neo4jDaoImpl implements Neo4jDao {

    @Autowired
    private Neo4jConnectionPool pool;

    @Override
    public JSONArray executeCql(String cql, Map<String, Object> params) {
        Driver driver = null;
        try {
            driver = pool.achieve();
        } catch (Exception e1) {
            e1.printStackTrace();
            return null;
        }
        Session session = driver.session();
        JSONArray resultArr = new JSONArray();
        try {
            if (session == null) {
                return null;
            }
            Transaction tx = session.beginTransaction();
            try {
                Result result = tx.run(cql, params);
                while (result.hasNext()) {
                    Record next = result.next();
                    List<String> keys = next.keys();
                    JSONObject keyJson = new JSONObject();
                    for (String key : keys) {
                        Value value = next.get(key);
                        //如果是关系
                        if (value.type().name().contains("RELATIONSHIP")) {
                            Relationship relationship = value.asRelationship();
                            Map<String, Object> map = new HashMap<>(3);
                            map.put("type", relationship.type());
                            map.put("endNodeId", relationship.endNodeId());
                            map.put("startNodeId", relationship.startNodeId());
                            map.putAll(relationship.asMap());
                            keyJson.element(key, JSONObject.fromObject(map));
                        } else if (value.type().name().contains("NODE")) {
                            Node node = value.asNode();
                            Map<String, Object> map = new HashMap<>();
                            map.put("NodeId", node.id());
                            map.putAll(node.asMap());
                            keyJson.element(key, map);
                        } else {
                            List<Object> objects = value.asList();
                            for (Object object : objects) {
                                Relationship relationship = (Relationship) object;
                                Map<String, Object> map = new HashMap<>(3);
                                map.put("type", relationship.type());
                                map.put("endNodeId", relationship.endNodeId());
                                map.put("startNodeId", relationship.startNodeId());
                                map.putAll(relationship.asMap());
                                keyJson.element(key, JSONObject.fromObject(map));
                            }
                        }
                    }
                    resultArr.add(keyJson);
                }
                tx.commit();
                tx.close();
                session.close();
                return resultArr;
            } catch (Exception e) {
                if (tx != null) {
                    tx.rollback();
                    tx.close();
                }
                e.printStackTrace();
                return null;
            }
        } catch (Exception e) {
            if (driver != null) {
                pool.release(driver);
            }
            e.printStackTrace();
            return null;
        } finally {
            if (driver != null) {
                pool.release(driver);
            }
        }
    }
}
