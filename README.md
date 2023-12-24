# 兼职信息管理系统开发文档

## 一、项目概要

- 系统概述
  - 该系统是一个兼职信息管理平台，旨在为求职者、委托方（商家）提供一个统一的服务平台。
  - 用户角色包括求职者、委托方（商家），分别对应不同的功能权限。
- 系统架构
  - 前端页面采用Bootstrap框架进行开发，使用JSP技术进行页面呈现。
  - 后端采用Java语言进行开发，使用Servlet技术实现Web接口。
  - 数据库采用MySQL进行存储，并使用JDBC连接数据库。
- 开发环境配置
  - 开发环境需要安装jdk、idea、Mysql数据库等工具。
  - 在Eclipse中导入相应的JAR包和项目文件，然后可直接进行开发调试。
- 技术栈
  - 前端：Bootstrap、html、css、JavaScript、Jquery。
  - 后端：JavaServlet、jdbc。
  - 数据库：Mysql。
- 数据库设计
  - 创建3张表，分别用于存储求职者信息、雇主信息和委托信息。
  - 求职者信息
    - 求职者编号，求职者姓名，求职者联系方式，求职者账号、雇主密码
  - 商家信息
    - 商家编号，商家姓名，商家邮箱，商家账号，商家密码
  - 委托信息
    - 委托编号(p_id)，委托详细信息(p_message)
  - 通过表之间的关联实现数据的查询和更新。
- 前端开发
  - 在Bootstrap框架基础上，设计相关页面
    - 大厅（主界面）
    - 兼职信息列表页面
    - 兼职信息发布页面
    - 兼职者个人信息页面
    - 雇主个人信息界面
  - 使用JSP技术进行页面呈现。
  - 实现Ajax等技术实现服务大厅页面的实时更新。
- 后端开发
  - 设计和实现相应的Servlet，处理前端请求，进行业务逻辑的处理和数据的增删改查。
  - 将请求参数转化为Java对象，并将Java对象转成JSON格式响应给前端。
- 安全与权限
  - 入口处采用JSTL进行拦截，根据角色进行权限控制。
- 测试
  - 对系统进行单元测试、集成测试和系统测试。
  - 针对常见问题进行详细的调试和解决方案。
- 部署与维护
- 将代码部署到tomcat服务器中，并配置相应的环境和数据库连接。
- 定期备份数据和日志，保证系统的稳定性和可靠性。

1. 参考资料

- Bootstrap官方文档：https://getbootstrap.com/docs/5.1/getting-started/introduction/
- Servlet API官方文档：https://docs.oracle.com/javaee/7/api/javax/servlet/package-summary.html
- MySQL官方文档：https://dev.mysql.com/doc/

## 二、系统用例图



## 三、用例文档



## 四、项目文件结构

```
volunteer-management-system
├── src
│   ├── main
│   │   ├── java
│   │   │   ├── controller   # 控制器层，处理用户请求和响应
│   │   │   ├── dao          # 数据访问层，实现与数据库的交互
│   │   │   ├── entity       # 实体类，存储数据对象
│   │   │   ├── service      # 服务层，实现业务逻辑
│   │   │   └── util         # 工具类，提供一些常用的工具方法
│   │   └── resources        # 资源文件夹，存放配置文件和静态资源
│   │       └── application.properties  # 应用配置文件
│   └── web                   # web应用目录
│       ├── WEB-INF
│       │   └── web.xml       # Web应用配置文件
│       ├── static            # 静态资源文件夹
│   		└── img     	  # 将 图片 文件夹放置在这里
│   		└── bootstrap     # 将 Bootstrap 文件夹放置在这里
│       		├── css       # Bootstrap CSS 文件
│       		├── js        # Bootstrap JavaScript 文件
│       └── Jsp               # 项目的其他JSP文件
│       └── index.jsp         # 项目的入口JSP文件
└── pom.xml                   # 项目配置文件
```

