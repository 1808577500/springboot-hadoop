## 简介
springboot整合Hadoop，HDFS相关操作，可以实现最基本的文件操作系统，进击大数据一小步。

## Hadoop 3.1.2安装（仅展示win下安装方式）
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

## 接口功能展示
1、查看目录
``` 
GET请求 请求地址: http://127.0.0.1:8080/file/getPathInfo
参数说明：{"path": ${目录路径}}
参数示例：{"path": "/"}
``` 

2、创建目录
``` 
POST请求 请求地址: http://127.0.0.1:8080/file/mkdir
参数说明：{"folderPath": ${目录路径}}
form-data参数示例：{"folderPath": "/data"}
``` 

3、上传文件
``` 
POST请求 请求地址: http://127.0.0.1:8080/file/upload
参数说明：{"uploadPath": ${hdfs目录路径}, "file": ${MultipartFile文件}}
form-data参数示例：{"uploadPath": "/data", "file": ${MultipartFile文件}}
``` 

4、上传本地文件到hdfs
``` 
POST请求 请求地址: http://127.0.0.1:8080/file/uploadFileFromLocal
参数说明：{"path": ${本地文件路径}, "uploadPath": ${上传的hdfs路径}}
form-data参数示例：{"path": "/data", "uploadPath": "C:\Users\XXX\Desktop\用户信息-导入模板.xlsx"}
``` 

5、获取目录下文件列表
``` 
GET请求 请求地址: http://127.0.0.1:8080/file/getPathInfo
参数说明：{"path": ${目录路径}}
参数示例：{"path": "/"}
``` 

6、下载文件
``` 
POST请求 请求地址: http://127.0.0.1:8080/file/download
参数说明：{"path": ${hdfs目录路径}, "fileName": ${MultipartFile文件}}
form-data参数示例：{"path": "/data", "fileName": "用户信息-导入模板.xlsx"}
``` 

7、下载文件到本地电脑
``` 
POST请求 请求地址: http://127.0.0.1:8080/file/downloadFileFromLocal
参数说明：{"path": ${hdfs文件路径}, "downloadPath": ${本地电脑路径}}
form-data参数示例：{"path": "/data", "downloadPath": "C:\Users\XXX\Desktop\"}
``` 

8、复制文件
``` 
POST请求 请求地址: http://127.0.0.1:8080/file/copyFile
参数说明：{"sourcePath": ${hdfs源文件路径}, "targetPath": ${hdfs目标文件路径}}
form-data参数示例：{"sourcePath": "/data/用户信息-导入模板.xlsx", "targetPath": "/test/用户信息-导入模板.xlsx"}
``` 

9、读取文件内容
``` 
POST请求 请求地址: http://127.0.0.1:8080/file/readFile
参数说明：{"filePath": ${hdfs文件路径}}
form-data参数示例：{"filePath": "/data/计税公式.txt"}
``` 

10、文件或文件夹重命名
``` 
POST请求 请求地址: http://127.0.0.1:8080/file/renameFile
参数说明：{"oldName": ${hdfs旧文件名称}, "newName": ${hdfs新文件名称}}
form-data参数示例：{"oldName": "/data/用户信息-导入模板.xlsx", "newName": "/data/用户信息-重命名.xlsx"}
``` 

11、删除文件或文件夹
``` 
POST请求 请求地址: http://127.0.0.1:8080/file/rmdir
参数说明：{"path": ${hdfs文件路径}, "fileName": ${文件名称，不填为删除文件夹}}
form-data参数示例：{"path": "/data", "fileName": "用户信息-导入模板.xlsx"}
``` 

## 提示
此demo只是作为Hadoop学习demo，若有其他请联系作者

Email：*yuanjjrr@foxmail.com*