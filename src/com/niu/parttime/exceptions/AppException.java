package com.niu.parttime.exceptions;

//报告app异常信息
public class AppException extends Exception{
    public AppException(){

    }

    public AppException(String msg){
        super(msg);
    }
}
