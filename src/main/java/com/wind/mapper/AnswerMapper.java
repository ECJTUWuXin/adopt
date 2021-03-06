package com.wind.mapper;

import com.wind.entity.Answer;

import java.util.List;

/**
 * @author Mr Wu
 * @create: 2019-08-29 14:03
 */
public interface AnswerMapper {


    /**
     * 更具id查询用户的信息
     * @param id 回复的id
     * @return answer
     * */
    List<Answer> findByCommentId(Integer id);
    /**
     * 添加回复
     * @param answer 回复
     * @return int
     * */
    int addAnswer(Answer answer);

    /**
     * 添加回复
     * @param answer 回复
     * @return int
     * */
    int addAnswers(Answer answer);

    /**
     * 通过id查询值
     * @param id 回复的值
     * @return answer
     * */
    Answer findById(Integer id);
}
