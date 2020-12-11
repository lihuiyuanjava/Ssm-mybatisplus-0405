package com.hy.ssm.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.util.List;
@TableName(value = "DEPT1")
public class Dept {
    @TableId(value = "DEPTNO", type = IdType.INPUT)
    private Integer deptno;
    private String dname;
    private String loc;
   /* private List<Dept> list;*/
    public Integer getDeptno() {
        return deptno;
    }


    public void setDeptno(Integer deptno) {
        this.deptno = deptno;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getLoc() {
        return loc;
    }

    public void setLoc(String loc) {
        this.loc = loc;
    }

 /*   public List<Dept> getList() {
        return list;
    }

    public void setList(List<Dept> list) {
        this.list = list;
    }*/

    @Override
    public String toString() {
        return "Dept{" +
                "deptno=" + deptno +
                ", dname='" + dname + '\'' +
                ", loc='" + loc + '\'' +
               /* ", list=" + list +*/
                '}';
    }
}
