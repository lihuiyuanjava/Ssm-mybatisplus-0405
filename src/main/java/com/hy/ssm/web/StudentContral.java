package com.hy.ssm.web;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hy.ssm.mapper.EmpMapper;
import com.hy.ssm.pojo.Dept;
import com.hy.ssm.pojo.Emp;
import com.hy.ssm.pojo.ToJson;
import com.hy.ssm.service.DeptService;
import com.hy.ssm.service.EmpService;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.UUID;


@Controller
public class StudentContral {
    @Autowired
    private EmpService empService;
    @Autowired
    private DeptService deptService;

    @RequestMapping("/query.do")
    public ModelAndView query() {
        ModelAndView modelAndView = new ModelAndView();
        List list = empService.querybydept();
        System.out.println(list);
        modelAndView.addObject("list", list);
        modelAndView.setViewName("/empjsp/emphome.jsp");
        return modelAndView;
    }

    @RequestMapping("/deleteall.do")
    public String deleteall(Integer[] ids, Model model) {
        model.addAttribute("list", empService.removeByIds(Arrays.asList(ids)));
        return "/query.do";
    }

    @RequestMapping("/querydept.do")
    @ResponseBody
    public String querydeptall(Model model) {
        Wrapper<Dept> tWrapper = new QueryWrapper<>();
        model.addAttribute("bean", deptService.list(tWrapper));
        return "/empjsp/empadd.jsp";
    }

    @RequestMapping("/querydeptin.do")
    @ResponseBody
    public String querydeptallin(Model model) {
        Wrapper<Dept> tWrapper = new QueryWrapper<>();
        model.addAttribute("bean", deptService.list(tWrapper));
        return "/empjsp/empadd.jsp";
    }

    @RequestMapping("/insertall.do")
    public String insertino(Emp emp, @RequestParam("pto") MultipartFile imgfile, HttpServletRequest request) throws IOException {
        System.out.println("=====" + emp);
        String picture = UUID.randomUUID().toString();
        String oename = imgfile.getOriginalFilename();
        String substring = oename.substring(oename.lastIndexOf("."));
        String realPath = request.getServletContext().getRealPath("/");
        imgfile.transferTo(new File(realPath + "/upload/" + picture + substring));
        //System.out.println("=============="+realPath);
        emp.setPhoto(picture + substring);
        System.out.println("---------------" + picture + substring);
        empService.save(emp);
        return "/querydept.do";
    }

    @RequestMapping("/seleteone.do")
    public String seleteone(Model model, Integer id) {
        model.addAttribute(empService.querybydept());
        return "/empjsp/empupdate.jsp";
    }

    @RequestMapping("/updateall.do")
    public String upadte(Model model, Emp emp) {
        empService.saveOrUpdate(emp);
        return "/query.do";
    }

    @RequestMapping("/queyall.do")
    @ResponseBody
    public ToJson queryall(Integer page, Integer limit,Emp emp) {
        return empService.queryall(page, limit,emp);
    }

    @RequestMapping("/del.do")
    @ResponseBody
    public boolean deleteall(String ids){
        try {
            empService.removeByIds(Arrays.asList(ids.split(",")));
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    @RequestMapping("/deptquery.do")
    @ResponseBody
    public List<Dept> deptquery(){
        List<Dept> depts=deptService.list();
        return depts;
    }

    @RequestMapping("/save.do")
    @ResponseBody
    public boolean save(@RequestBody Emp emp){
        System.out.println("!!!!!!!!!!!!"+emp.getHiredate());

        try {
            empService.saveOrUpdate(emp);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @RequestMapping("/selectbyid.do")
    @ResponseBody
    public Emp querybyempno(Integer id){
        System.out.println("你是大傻逼"+id);
        return empService.getById(id);
    }
}
