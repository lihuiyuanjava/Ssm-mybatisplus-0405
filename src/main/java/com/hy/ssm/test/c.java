package com.hy.ssm.test;

import com.hy.ssm.mapper.EmpMapper;
import com.hy.ssm.pojo.Emp;
import com.hy.ssm.service.EmpService;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;
import java.util.Map;

public class c {
    public static void main(String[] args) {
        ClassPathXmlApplicationContext applicationContext=new ClassPathXmlApplicationContext("spring.xml");
       EmpMapper empMapper=applicationContext.getBean(EmpMapper.class);


     //   System.out.println(  empService.list().size());
    }

}
