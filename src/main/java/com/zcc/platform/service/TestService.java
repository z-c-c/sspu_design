package com.zcc.platform.service;

import com.zcc.platform.Student;
import com.zcc.platform.dao.TestDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zcc
 */
@Service
public class TestService {


    private TestDao dao;

    @Autowired
    public void setDao(TestDao dao) {
        this.dao = dao;
    }

    public void test() {
        Student byId = dao.findById(1);
        System.out.println(byId);
        Student byId1 = dao.findById(2);
        System.out.println(byId1);
        List<Student> all = dao.findAll();
        System.out.println(all);
        System.out.println(dao.findAll());
    }
}
