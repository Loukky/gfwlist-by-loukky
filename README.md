# gfwlist-by-loukky

[![HitCount](https://hits.dwyl.com/Loukky/gfwlist-by-loukky.svg?style=flat-square)](http://hits.dwyl.com/Loukky/gfwlist-by-loukky)
[![CodeRabbit Pull Request Reviews](https://img.shields.io/coderabbit/prs/github/Loukky/gfwlist-by-loukky?utm_source=oss&utm_medium=github&utm_campaign=Loukky%2Fgfwlist-by-loukky&labelColor=171717&color=FF570A&link=https%3A%2F%2Fcoderabbit.ai&label=CodeRabbit+Reviews)](https://coderabbit.ai)

基于 [GFWlist](https://github.com/gfwlist/gfwlist) 修改，自用为主，欢迎提交 Issue 补充规则。

主要适配 [ZeroOmega](https://github.com/zero-peak/ZeroOmega) / [SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega)。

---

## 文件说明

### list.txt（明文版）

适合查看和对比规则变更。

```text
https://github.com/Loukky/gfwlist-by-loukky/blob/master/list.txt
```

### gfwlist.txt（Base64 编码版）

通过 Base64 编码的规则列表，常规使用推荐此文件。

```text
https://raw.githubusercontent.com/Loukky/gfwlist-by-loukky/master/gfwlist.txt
```

---

## PAC 规则（来自 bocchi810）

> ⚠️ 转换过程中可能会丢失部分规则

| 节点 | 地址 |
|------|------|
| Jsdelivr Gcore (Cloudflare) | `https://gcore.jsdelivr.net/gh/bocchi810/loukky-gfwlist-pac@master/gfwlist.json` |
| **Jsdelivr Fastly（推荐）** | `https://fastly.jsdelivr.net/gh/bocchi810/loukky-gfwlist-pac@master/gfwlist.json` |

## gfwlist 加速镜像（可能有缓存）

| 节点 | 地址 |
|------|------|
| Jsdelivr Gcore (Cloudflare) | `https://gcore.jsdelivr.net/gh/Loukky/gfwlist-by-loukky@master/gfwlist.txt` |
| **Jsdelivr Fastly（推荐）** | `https://fastly.jsdelivr.net/gh/Loukky/gfwlist-by-loukky@master/gfwlist.txt` |
| Jsdelivr 国内镜像（仅供参考） | `https://cdn.jsdmirror.com/gh/Loukky/gfwlist-by-loukky@master/gfwlist.txt` |

## 镜像站（仅供参考）

```text
https://gh-proxy.com/https://raw.githubusercontent.com/Loukky/gfwlist-by-loukky/master/gfwlist.txt
```

---

## 规则提交指南

### 发现以下情况的网站未在列表中，请开 Issue 补充

1. 国内访问出现 `ERR_CONNECTION_RESET` 错误
2. HTTP 访问出现上述情况，但 HTTPS 正常
3. DNS 污染（国内解析该域名指向不正确 IP，而国外解析正常）
4. 该域名服务器 IP 在国内**完全无法访问**（国内 ping 不通或访问超时，国外正常）

### 示例

- `google.com` — 出现了情况 1 和 3
- `support.google.com` — 出现了情况 4

### 移除规则

如果有域名已被解除封锁需要从列表中移除，请直接开 Issue，说明原因并列出该域名的规则内容。

### 匿名提交

如需匿名提交，请发送邮件至：`gfwlistbyloukky#proton.me`（将 `#` 替换为 `@`）

---

## Star 历史

[![Stargazers over time](https://starchart.cc/Loukky/gfwlist-by-loukky.svg?variant=adaptive)](https://starchart.cc/Loukky/gfwlist-by-loukky)
