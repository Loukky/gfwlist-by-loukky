# gfwlist-by-loukky<br>
![CodeRabbit Pull Request Reviews](https://img.shields.io/coderabbit/prs/github/Loukky/gfwlist-by-loukky?utm_source=oss&utm_medium=github&utm_campaign=Loukky%2Fgfwlist-by-loukky&labelColor=171717&color=FF570A&link=https%3A%2F%2Fcoderabbit.ai&label=CodeRabbit+Reviews)  
changed from [GFWlist](https://github.com/gfwlist/gfwlist) and self use
主要适配于[ZeroOmega](https://github.com/zero-peak/ZeroOmega)/[SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega)
# 文件说明
[list.txt](https://github.com/Loukky/gfwlist-by-loukky/blob/master/list.txt) 使用明文方便对比列表的变化  
[gfwlist.txt](https://raw.githubusercontent.com/Loukky/gfwlist-by-loukky/refs/heads/master/gfwlist.txt) 则是通过base64转码过后的列表，一般使用这个即可
## Pac规则（来自bocchi810）
### 转换过程中可能会丢失部分规则
Jsdelivr(gcore(实际上是Cloudflare)):https://gcore.jsdelivr.net/gh/bocchi810/loukky-gfwlist-pac@master/gfwlist.json  
Jsdelivr(Fastly):https://fastly.jsdelivr.net/gh/bocchi810/loukky-gfwlist-pac@master/gfwlist.json **(推荐使用)**  

## Jsdelivr(可能有缓存): 
Jsdelivr(gcore(实际上是Cloudflare)):https://gcore.jsdelivr.net/gh/Loukky/gfwlist-by-loukky@master/gfwlist.txt  
Jsdelivr(Fastly):https://fastly.jsdelivr.net/gh/Loukky/gfwlist-by-loukky@master/gfwlist.txt **(推荐使用)**  
Jsdelivr(国内镜像，有封禁风险):https://cdn.jsdmirror.com/gh/Loukky/gfwlist-by-loukky@master/gfwlist.txt  

## 镜像站（仅供参考）:  
镜像站1:https://gh-proxy.com/https://raw.githubusercontent.com/Loukky/gfwlist-by-loukky/master/gfwlist.txt   
镜像站2:https://raw.kkgithub.com/Loukky/gfwlist-by-loukky/master/gfwlist.txt  
## 提示
### 发现了有以下情况的网站，并且没在此列表的，请开issues  
1.国内访问出现ERR_CONNECTION_RESET错误的  
2.http访问出现1.所说情况的，但https正常的  
3.DNS污染（国内解析该域名指向不正确的IP（例如标为Facebook，Twitter，Dropbox所属的IP），而国外解析正常的）  
4.该域名服务器IP在国内根本（此处根本指的是：国内ping不通（或者国内访问超时），国外正常的）无法访问的  
### 例子：
google.com:出现了1和3情况  
support.google.com:出现了4情况  

### 如果有域名被解除封锁需要移除列表的，请直接开issue说明并且列出该域名的规则内容
## 项目 Star 数增长趋势

[![Stargazers over time](https://starchart.cc/Loukky/gfwlist-by-loukky.svg?variant=adaptive)](https://starchart.cc/Loukky/gfwlist-by-loukky)
