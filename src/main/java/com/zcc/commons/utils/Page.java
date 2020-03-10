package com.zcc.commons.utils;

import com.zcc.exceptions.MyException;

/**
 * @author zcc
 */
public class Page {

    private Integer page;
    private Integer pageSize;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public static Page setPageAndSize(int page, int pageSize) throws MyException {
        if (page <= 0 || pageSize <= 0) {
            throw new MyException("分页参数错误");
        }
        Page p = new Page();
        p.setPage((page - 1) * pageSize);
        p.setPageSize(pageSize);
        return p;
    }

    public Page() {
    }

    public Page(Integer page, Integer pageSize) throws MyException {
        if (page <= 0 || pageSize <= 0) {
            throw new MyException("分页参数错误");
        }
        this.page = (page - 1) * pageSize;
        this.pageSize = pageSize;
    }
}
