package com.hy.ssm.pojo;

import org.apache.ibatis.annotations.Param;

public class SqlClass {
    public String query_emp_dept(@Param("emp")Emp emp){
        System.out.println(emp);
        StringBuffer sql=new StringBuffer("select e.empno,e.ename,e.job,e.mgr,e.hiredate,e.sal,e.comm,e.deptno,e.photo,d.dname from emp1 e,dept1 d where e.deptno=d.deptno");
        if(emp!=null){
            System.out.println(1111);
            if(emp.getEname()!=null&&emp.getEname()!=""){
                sql.append(" and e.ename like '%${emp.ename}%' ");
            }
            if(emp.getJob()!=null&&emp.getJob()!=""){
                    sql.append(" and e.job=#{emp.job}");
            }
            if(emp.getDeptno()!=null&&emp.getDeptno()!=0){
                sql.append(" and e.deptno=#{emp.deptno}");
            }
        }
        System.out.println(sql.toString());
        return sql.toString();
    }
}
