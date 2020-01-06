package com.zcc.log.annotation;

import java.lang.annotation.*;

/**
 * @author zcc
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log {
    String name() default "";
}
