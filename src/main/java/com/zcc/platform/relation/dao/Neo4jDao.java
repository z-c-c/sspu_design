package com.zcc.platform.relation.dao;

import net.sf.json.JSONArray;

import java.util.Map;

/**
 * @author zcc
 */
public interface Neo4jDao {

    JSONArray executeCql(String cql, Map<String, Object> params);
}
