package com.zcc.commons.utils;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.mail.Multipart;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.UUID;

/**
 * @author zcc
 * 文件工具类
 */
public class FileUtil {
    /**
     * 上传文件
     *
     * @param request
     * @param attrName    标签的name属性
     * @param handleLogId 文件的id
     */
    public static String upLoad(HttpServletRequest request, String attrName, String handleLogId) {
        MultipartHttpServletRequest request1 = (MultipartHttpServletRequest) request;
        MultipartFile mFile = request1.getFile(attrName);
        //文件上传的位置
        String path = request.getSession().getServletContext().getRealPath("/uploads/");
        //判断该路径是否存在
        File file = new File(path);
        if (!file.exists()) {
            // 创建文件夹
            file.mkdirs();
        }
        String outPath = null;
        String fileName = mFile.getOriginalFilename();
        if (StringUtil.isValidStr(fileName)) {
            fileName = handleLogId + "ZCC" + fileName;
            //获取当前系统下的文件分隔符
            String property = System.getProperty("file.separator");
            outPath = path + property + fileName;
            try (OutputStream outputStream = new FileOutputStream(outPath);
                 InputStream inputStream = mFile.getInputStream();) {
                byte[] buffer = new byte[4096];
                int length = 0;
                while ((length = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, length);
                }
            } catch (IOException ioe) {
                ioe.printStackTrace();
                return null;
            }
        }
        return fileName;
    }

    /**
     * 文件下载
     *
     * @param response
     * @param FileName 文件路径
     * @return
     */
    public static void downLoad(HttpServletResponse response, HttpServletRequest request, String FileName) {
        if (FileName != null) {


            String path = request.getSession().getServletContext().getRealPath("/uploads/");
            //获取当前系统下的文件分隔符
            String property = System.getProperty("file.separator");
            path = path + property + FileName;
            //设置文件路径
            File file = new File(path);
            //文件名
            String name = FileName;
            if (FileName.contains("@@@@")) {
                name = FileName.substring(FileName.substring(0, FileName.indexOf("@")).length() + 4, FileName.length());
            }
            if (file.exists()) {
                response.setHeader("content-type", "application/octet-stream");
                response.setContentType("application/octet-stream");
                try {
                    response.setHeader("Content-Disposition", "attachment;filename=" + new String(name.split("@@@@")[0].getBytes("utf-8"), "ISO-8859-1"));
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
                byte[] buffer = new byte[1024];
                FileInputStream fis = null;
                BufferedInputStream bis = null;
                try {
                    fis = new FileInputStream(file);
                    bis = new BufferedInputStream(fis);
                    OutputStream os = response.getOutputStream();
                    int i = bis.read(buffer);
                    while (i != -1) {
                        os.write(buffer, 0, i);
                        i = bis.read(buffer);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (bis != null) {
                        try {
                            bis.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                    if (fis != null) {
                        try {
                            fis.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }
    }

}
