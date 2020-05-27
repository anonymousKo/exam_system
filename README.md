# 智慧校园考试系统

## 系统环境

MySQL 5.5以上版本

Python3.5以上版本

Redis任意新版本即可

Django版本2.1.4



## 安装步骤

### python 3.8.3 

- 加入环境变量 

### MySQL 

- cd 到mysql/bin目录下 

- 执行以下命令连接数据库

- mysql -uroot -p 

- 输入密码

- 创建数据库：

- Create database exam_system default character set utf8;

### Django

- 使用pip install Django==2.1.4 进行安装。

### 安装虚拟环境

- 运行以下命令	

  ```
  pip install virtualenv
  ```

- cd 到Exam\venv\Scripts中 运行 

  ```
  activate
  ```

-  然后回到Exam根目录安装项目所需安装包

  pip install -r requirements.txt



### 连接数据库

-  迁移数据库，创建数据表

  ```
  python manage.py migrate
  ```

- 继续运行：

  ```
  python manage.py runserver
  ```

- 启动项目，然后，访问“http://127.0.0.1:8000”

  



### 注：

- 配置文件位于config/local_settings.py

- 测试登录账号：ozn88917@bcaoo.com

密码：abc123456

- 收到邮件，由于我们在本地测试，不能直接单击邮箱验证链接，可以手动赋值链接，然后在链接地址前添加“http://127.0.0.1:8000"