# easycoder
一个面向开发人员的代码生成器，尤其适合各类企业管理系统的开发人员使用，支持Spring2.5.6+，Struts2 2.3.15+，Ibatis-2.3.4（MyBatis） ，Oracle10g2+的JAVA开发框架，有限支持Mysql数据库。
easycoder代码生成器，让开发人员减少框架相关的代码编写和配置，减少手写或复制代码造成的不必要错误，可以将时间和精力更多的聚焦在业务代码的编写上，提升开发人员的开发效率和质量。
代码生成器自带管理系统样式，若需自定义，开发人员需要了解freemarker等模板技术，自行编写并替换模板文件。
## 特点：
### 1.代码生成器使用web方式部署
代码生成器使用web方式部署，而非传统的使用swing/applet或者作为IDE插件的方式，方便升级更新。下载项目，直接部署为web应用即可运行。
### 2.按模块生成代码
可以自定义模块/包名称，以单表为最小单位，生成对应的SSI各层的文件（包括JAVA文件以及struts、spring、ibatis的xml配置文件），以及JS、JSP等文件
### 3.自定义表单页面功能
可以自定义表字段对应在页面上的显示名称，定义列表查询字段，支持日期格式，支持输入验证
### 4.升级更新方便
如果模块对应的表结构发生变化，重新生成代码，基本上直接覆盖Ibatis文件的部分代码即可

## 下一版本或全新分支
### 1.更新代码架构
当前生成的代码支持的框架较当前主流落后，需要更新代码架构Spring、Struts2、Ibatis到当前主流版本
### 2.更新前端组件
更新页面/前端使用的组件，包括如jquery、输入验证组件、日期组件到新版本
### 3.更换默认的模板样式
使用bootstrap作为默认的页面样式
### 4.支持更多的数据库
目前对Oracle支持较好，其它数据库支持还比较弱，需要支持MySQL等主流数据库

## 更多后续发展
创建新分支，开发Spring+SpringMVC+MyBatis框架下支持Oracle、Mysql、MongoDB等主流数据库的管理系统代码生成器，前段样式统一使用bootstrap.

