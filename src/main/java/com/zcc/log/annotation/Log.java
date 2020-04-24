package com.zcc.log.annotation;

import java.lang.annotation.*;

/**
 * @author zcc
 * 自定义Log注解
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log {
    String name() default "";
}
