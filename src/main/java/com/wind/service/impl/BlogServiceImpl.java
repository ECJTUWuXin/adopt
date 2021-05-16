package com.wind.service.impl;

import com.wind.entity.Blog;
import com.wind.mapper.BlogMapper;
import com.wind.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Mr Wu
 * @create: 2019-08-20 15:03
 */
@Service
public class BlogServiceImpl implements BlogService {

    @Autowired
    BlogMapper blogMapper;

    @Override
    public int addBlog(Blog blog) {
        int i = blogMapper.addBlog(blog);
        return i;
    }

    @Override
    public int deleteBlog(Integer id) {
        int i = blogMapper.deleteBlog(id);
        return i;
    }

    @Override
    public int updateBlog(Blog blog) {
        int i = blogMapper.updateBlog(blog);
        return i;
    }

    @Override
    public List<Blog> getBlogs() {
        List<Blog> blogs = blogMapper.getBlogs();
        return blogs;
    }

    @Override
    public Blog findById(Integer id) {
        Blog blog = blogMapper.findById(id);
        return blog;
    }

    @Override
    public List<Blog> findByTime(String actionTime) {
        List<Blog> blog = blogMapper.findByTime(actionTime);
        return blog;
    }

    @Override
    public void deleteBatch(List<Integer> ids) {
        blogMapper.deleteBatch(ids);
    }


    public void judge(Blog blog){
        
    }
}
