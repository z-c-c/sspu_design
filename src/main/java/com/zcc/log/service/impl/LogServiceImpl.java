package com.zcc.log.service.impl;

import cn.hutool.core.map.MapUtil;
import com.zcc.commons.utils.DateFormat;
import com.zcc.commons.utils.MapSortUtil;
import com.zcc.commons.utils.StringUtil;
import com.zcc.commons.utils.TimeUtil;
import com.zcc.log.dao.LogDao;
import com.zcc.log.entity.LogEntity;
import com.zcc.log.service.LogService;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zcc
 */
@Service("logService")
public class LogServiceImpl implements LogService {

    private final LogDao logDao;

    public LogServiceImpl(LogDao logDao) {
        this.logDao = logDao;
    }

    @Override
    public void save(LogEntity logEntity) {
        logDao.save(logEntity);
    }

    @Override
    public void update(LogEntity logEntity) {
        System.out.println(logEntity.getException());
    }


    @Override
    public List<LogEntity> find(Date begin, Date end) {
        return logDao.find(DateFormat.dataFormat(begin, DateFormat.YYYY_MM_DD), DateFormat.dataFormat(end, DateFormat.YYYY_MM_DD));
    }

    @Override
    public Map<String, Object> countByDay(Date begin, Date end) {
        List<Map> maps = logDao.countByDay(DateFormat.dataFormat(begin, DateFormat.YYYY_MM_DD), DateFormat.dataFormat(end, DateFormat.YYYY_MM_DD));
        List<String> dayBeforeFormat = TimeUtil.getDayBeforeFormat(7, "yyyy-MM-dd");
        Map<String, Object> result = new HashMap<>(8);
        for (Map map : maps) {
            result.put(StringUtil.safeToString(map.get("date")), map.get("count"));
        }
        for (String s : dayBeforeFormat) {
            result.putIfAbsent(s, "0");
        }
        return MapSortUtil.sortByKeyAsc(result);
    }
}
