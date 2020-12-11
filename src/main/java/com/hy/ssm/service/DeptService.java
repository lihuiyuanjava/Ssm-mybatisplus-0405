package com.hy.ssm.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hy.ssm.mapper.DeptMapper;
import com.hy.ssm.mapper.EmpMapper;
import com.hy.ssm.pojo.Dept;
import com.hy.ssm.pojo.Emp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DeptService extends ServiceImpl<DeptMapper, Dept>{
    @Autowired
    private DeptMapper deptMapper;


}
