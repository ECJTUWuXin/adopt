package com.ecjtu.controller;

import com.ecjtu.entity.Admin;
import com.ecjtu.entity.Blog;
import com.ecjtu.service.BlogService;
import com.ecjtu.util.Message;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

/**
 * @author Mr Wu
 * @create: 2019-08-20 15:06
 */
@Controller
@RequestMapping("blog")
public class BlogController {

    @Autowired
    private BlogService blogService;


    @RequestMapping("blogs.action")
    @ResponseBody
    public Message getBlog(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,4);
        List<Blog> blogs = blogService.getBlogs();
        System.out.println(blogs);
        // startPage后面紧跟的这个查询就是一个分页查询
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo page=new PageInfo(blogs,2);
        return Message.success().add("pageInfo",page);
    }

    /**
    * 这是传给前端的数据
    * */
    @RequestMapping("blog.action")
    public String getBlogs(ModelAndView modelAndView){
        List<Blog> blogs = blogService.getBlogs();
        modelAndView.addObject("blogs",blogs);
        return "blog";
    }

    @RequestMapping("addBlog.action")
    @ResponseBody
    public Message addBlog(Blog blog){
        int i = blogService.addBlog(blog);
        if(i>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("deleteBlog.action")
    @ResponseBody
    public Message deleteBlog(Integer id){
        if(blogService.deleteBlog(id)>0){
            return Message.success();
        }else {
            return Message.fail();
        }
    }

    @RequestMapping("updateBlog.action")
    @ResponseBody
    public Message updateBlog(Blog blog){
        if(blogService.updateBlog(blog)>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("findById.action")
    @ResponseBody
    public Blog findById(Integer id){
        Blog blog = blogService.findById(id);
        return blog;
    }

    @RequestMapping("findByTime.action")
    public Blog findByTime(ModelAndView modelAndView, Date actionTime){
        Blog blog = blogService.findByTime(actionTime);
        return blog;
    }

}
