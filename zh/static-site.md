# 静态博客使用 


## Jekyll

### 安装服务器

* Port：填写一个访问端口，也可以使用 Nginx 来反代
* Volumes - Site: 将 Jekyll 文件存在这儿


### 客户端

1. 在你电脑上安装  Jekyll
2. `jekyll new MyBlog` 新建一个站点
3. `scp -r newBlog/* root@Your-VPS:/srv/docker/Jekyll/` 将文件保存到你服务器上
4. scp 后文件归当前用户所有（比如root）可能会导致 Jekyll 无法创建文件夹，所以可以运行 `chmod o+w /srv/docker/Jekyll` 让 Jekyll 可以在里面生成静态文件
5. 访问 http://YourIP:PORT/
6. 本地更新后重复运行第三步即可


## Hugo

### 安装服务端

* Port: 填写一个访问端口
* Theme：主题（这个主题需要在下面的 Volume 目录中存在，没有主题的话会显示空白页）
* Volumes - Site: 这儿将保持源文件和静态文件

### 客户端配置

1. 在你的机器上安装 [hugo](https://gohugo.io/)
2. `hugo new site MySite` 初始化一个站点
3. `cd themes;git clone https://github.com/dim0627/hugo_theme_robust.git` 下载一个主题
4. `hugo server --theme=hugo_theme_robust` 启动 Hugo 本地服务器
5. 打开 `http://localhost:1313` 是不是看到你的博客了

### 上传到服务器

就和上面的 Jekyll 差不多，运行 `scp -r MySite/* root@YourIP:/srv/docker/Hugo`，然后修改下 Hugo 的配置将主题改成上面你下载的主题名字：`hugo_theme_robust` 点击“更新配置”更新一下然后访问 http://你的IP:端口 就可以访问啦。




