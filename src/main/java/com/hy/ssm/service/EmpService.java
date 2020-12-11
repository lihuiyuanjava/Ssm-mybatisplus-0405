package com.hy.ssm.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hy.ssm.mapper.EmpMapper;
import com.hy.ssm.pojo.Dept;
import com.hy.ssm.pojo.Emp;
import com.hy.ssm.pojo.ToJson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class EmpService extends ServiceImpl<EmpMapper, Emp> {
    @Autowired
    private EmpMapper empMapper;

    public List<Emp> querybydept() {
        return empMapper.queryallone();
    }

    public ToJson queryall(Integer page, Integer limit,Emp emp) {
        Page<Emp> empPage = new Page<>(page, limit);
        IPage<Emp> empIPage = empMapper.queryall_emp_map(empPage,emp);
        return new ToJson(0, "", (int) empIPage.getTotal(), empIPage.getRecords());
    }

    ;
    
    
/*
    public List<Emp> queryall(){
        return empMapper.queryall();
    }

    public void save(Emp emp){
         empMapper.inserts(emp);
    }

    public void deletes(Emp emp){ empMapper.deleteall(emp); }

    public void update(Emp emp){
        empMapper.upadates(emp);
    }

    public  List<Dept> querydept(){
       return  empMapper.queryallDEPT();
    }

    public Emp querybydeptno(long id) {
        return empMapper.queryall_emp_map(id);
    }
    public void deleteone(long id){
        empMapper.deleteaone(id); }*/


}
