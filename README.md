# dotfiles

### 依赖软件
- git
- curl
- zsh

### 配置 git 代理
```
git config --global http.proxy http://192.168.50.88:7890
git config --global https.proxy http://192.168.50.88:7890
```

### 配置
```
git clone https://github.com/icuxika/dotfiles.git
cd dotfiles
./install
```

### 设置 zsh 为默认 shell
```
chsh -s $(which zsh)
```

### 重启终端
> 由于 Zim 初始化需要使用 curl 去 github 下载文件，可能会因网络问题失败，此时可以手动配置下代理，再重新应用 zsh 配置文件，Zim 可能会给出一些警告，但这时终端 ui 应该已经正常了，再次重启一下，没有输出警告的话，就不用管它
```
export https_proxy=http://192.168.50.88:7890 http_proxy=http://192.168.50.88:7890 all_proxy=http://192.168.50.88:7890
source ~/.zshrc
```
