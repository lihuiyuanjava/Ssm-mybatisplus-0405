package com.hy.ssm.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hy.ssm.pojo.Emp;
import com.hy.ssm.pojo.SqlClass;
import org.apache.ibatis.annotations.*;


import java.util.List;

@Mapper
public interface EmpMapper extends BaseMapper<Emp> {

    @Results({
            @Result(column = "EMPNO", property = "empno"),
            @Result(column = "ENAME", property = "ename"),
            @Result(column = "dname", property = "dept.dname")
    })
    @SelectProvider(type = SqlClass.class,method ="query_emp_dept" )
    public IPage<Emp> queryall_emp_map(Page page,@Param("emp") Emp emp);


    @Results({
            @Result(column = "EMPNO", property = "empno"),
            @Result(column = "ENAME", property = "ename"),
            @Result(column = "dname", property = "dept.dname")
    })
    @Select("select e.empno,e.ename,e.job,e.mgr,e.hiredate,e.sal,e.comm,e.deptno,e.photo,d.dname from emp1 e,dept1 d where e.deptno=d.deptno")
    public List<Emp> queryallone();

    /*@Select("select * from EMP1 ")
    public List<Emp> queryall();

    @Delete("delete from EMP1 where EMPNO=#{empno}")
    public void deleteall(Emp emp);

    @Update("update EMP1 set ENAME=#{ename},JOB=#{job},MGR=#{mgr},SAL=#{sal} where EMPNO=#{empno}")
    public void upadates(Emp emp);*/

    /*@SelectKey(statement = "select sequence_creat.nextval from dual", keyProperty = "empno", before = true, resultType = Integer.class)
    @Insert("insert into EMP1(EMPNO,ENAME,JOB,MGR,SAL,HIREDATE,DEPTNO,PHOTO) values(#{empno},#{ename},#{job},#{mgr},#{sal},to_date(#{hiredate},'yyyy-MM-dd'),#{deptno},#{photo})")
    public void inserts(Emp emp);*/

   /* @Select("select * from DEPT1 ")
    public List<Dept> queryallDEPT();

    @Select("select * from EMP1 where EMPNO=#{EMPNO}")
    public void queryByid(Emp emp);

    @Delete("delete from EMP1 where EMPNO=#{value}")
    public void deleteaone(long id);
    *//**
     * 修改方法
     * *//*
    @Select("select * from EMP1 where EMPNO=#{value}")
    public Emp queryall_emp_map(long id);*/

}
