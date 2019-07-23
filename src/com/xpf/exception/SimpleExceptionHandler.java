package com.xpf.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class SimpleExceptionHandler {

    @ExceptionHandler(Exception.class)
    public ModelAndView errorPage(Exception e){
        ModelAndView view = new ModelAndView();
        view.addObject("message",e.getMessage());
        view.setViewName("error/error.jsp");
        return view;
    }
}
