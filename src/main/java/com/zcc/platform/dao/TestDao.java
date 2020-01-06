package com.zcc.platform.dao;

import com.zcc.platform.Student;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author zcc
 */
@Repository
public interface TestDao {

    /**
     * 查所有
     * @return list
     */
    List<Student> findAll();

    /**
     * 根据id
     * @param id id
     * @return student
     */
    Student findById(int id);
}
