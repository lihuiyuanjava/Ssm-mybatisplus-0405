package com.hy.ssm.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.hy.ssm.pojo.Dept;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface DeptMapper extends BaseMapper<Dept> {
 //嵌套查询(一对多)
   @Results({
           @Result(column = "dname",property = "dname"),
           @Result(column = "deptno", property = "list", many = @Many(select = "com.hy.mapper.EmpMapper.finall"))

   })
   @Select("select * from DEPT1 where DEPTNO=#{VALUE}")
  public List<Dept> queralldept(int sid);


  //嵌套结果、(一对多)
  public List<Dept> queryallByall();
}
