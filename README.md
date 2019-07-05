## 简介
springboot整合Hadoop，HDFS相关操作，进击大数据一小步

##Hadoop 3.1.2安装（仅展示win下安装方式）
[Hadoop安装教程链接](http://note.youdao.com/noteshare?id=5b22302f342ecf12c5a7789208a90238)

## 工程结构
``` 
hadoop-demo
├── base -- 前端视图基础类
├── config -- hadoop配置类
├── controller -- hdfs操作接口 
├── props -- hadoop属性配置
├── util -- 工具类 
├── HadoopClient.java -- Hadoop 操作类
└── HadoopDemoApplication.java -- springboot启动类
``` 

## 提示
此demo只是作为Hadoop学习demo，若有其他请联系作者