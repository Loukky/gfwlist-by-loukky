<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://img.shields.io/badge/gfwlist--by--loukky-自动更新规则列表-8A2BE2?style=for-the-badge&logo=openinternet&logoColor=white">
    <img alt="gfwlist-by-loukky" src="https://img.shields.io/badge/gfwlist--by--loukky-自动更新规则列表-8A2BE2?style=for-the-badge&logo=openinternet&logoColor=white">
  </picture>
</p>

<p align="center">
  <a href="https://github.com/Loukky/gfwlist-by-loukky/blob/master/LICENSE">
    <img src="https://img.shields.io/github/license/Loukky/gfwlist-by-loukky?label=License&labelColor=22272e&color=blue" alt="License">
  </a>
  <a href="https://github.com/Loukky/gfwlist-by-loukky/stargazers">
    <img src="https://img.shields.io/github/stars/Loukky/gfwlist-by-loukky?label=Stars&labelColor=22272e&color=gold" alt="Stars">
  </a>
  <a href="https://github.com/Loukky/gfwlist-by-loukky/commits/master">
    <img src="https://img.shields.io/github/last-commit/Loukky/gfwlist-by-loukky?label=Last%20Commit&labelColor=22272e&color=success" alt="Last Commit">
  </a>
  <a href="https://github.com/Loukky/gfwlist-by-loukky/actions/workflows/sendGFWList.yml">
    <img src="https://img.shields.io/github/actions/workflow/status/Loukky/gfwlist-by-loukky/sendGFWList.yml?label=Build&labelColor=22272e&logo=github" alt="Build">
  </a>
  <a href="https://hitcount.dev/p/Loukky/gfwlist-by-loukky">
    <img src="https://hitcount.dev/p/Loukky/gfwlist-by-loukky.svg" alt="Hits">
  </a>
  <a href="https://coderabbit.ai">
    <img src="https://img.shields.io/coderabbit/prs/github/Loukky/gfwlist-by-loukky?label=CodeRabbit&labelColor=22272e&color=FF570A" alt="CodeRabbit">
  </a>
</p>

<div align="center">
  基于 <a href="https://github.com/gfwlist/gfwlist">GFWlist</a> 修改，自用为主 · 欢迎提交 <a href="https://github.com/Loukky/gfwlist-by-loukky/issues/new">Issue</a> 补充规则<br>
  主要适配 <a href="https://github.com/zero-peak/ZeroOmega">ZeroOmega</a> / <a href="https://github.com/FelisCatus/SwitchyOmega">SwitchyOmega</a>
</div>

---

## 📖 目录

- [文件说明](#文件说明)
- [快速使用](#快速使用)
- [PAC 规则](#pac-规则来自-bocchi810)
- [gfwlist 加速镜像](#gfwlist-加速镜像可能有缓存)
- [镜像站](#镜像站仅供参考)
- [规则提交指南](#规则提交指南)
- [Star 历史](#star-历史)

---

## 📄 文件说明

### `list.txt`（明文版）

适合查看和对比规则变更。

```text
https://github.com/Loukky/gfwlist-by-loukky/blob/master/list.txt
```

### `gfwlist.txt`（Base64 编码版）

通过 Base64 编码的规则列表，常规使用推荐此文件。

```text
https://raw.githubusercontent.com/Loukky/gfwlist-by-loukky/master/gfwlist.txt
```

---

## 🚀 快速使用

### SwitchyOmega / ZeroOmega

1. 打开扩展选项页 → **新建情景模式** → 选择 **自动切换模式**
2. **规则列表格式**选择 **AutoProxy** 网址填入以下地址：
   ```text
   https://raw.githubusercontent.com/Loukky/gfwlist-by-loukky/master/gfwlist.txt
   ```
3. 点击 **立即更新情景模式** → **应用选项**

---

## 📡 PAC 规则（来自 bocchi810）

> ⚠️ 转换过程中可能会丢失部分规则

| 节点 | 地址 |
|------|------|
| Jsdelivr Gcore (Cloudflare) | `https://gcore.jsdelivr.net/gh/bocchi810/loukky-gfwlist-pac@master/gfwlist.json` |
| **Jsdelivr Fastly（推荐）** | `https://fastly.jsdelivr.net/gh/bocchi810/loukky-gfwlist-pac@master/gfwlist.json` |

## 🌐 gfwlist 加速镜像（可能有缓存）

| 节点 | 地址 |
|------|------|
| Jsdelivr Gcore (Cloudflare) | `https://gcore.jsdelivr.net/gh/Loukky/gfwlist-by-loukky@master/gfwlist.txt` |
| **Jsdelivr Fastly（推荐）** | `https://fastly.jsdelivr.net/gh/Loukky/gfwlist-by-loukky@master/gfwlist.txt` |
| Jsdelivr 国内镜像（仅供参考） | `https://cdn.jsdmirror.com/gh/Loukky/gfwlist-by-loukky@master/gfwlist.txt` |

## 🔗 镜像站（仅供参考）

```text
https://gh-proxy.com/https://raw.githubusercontent.com/Loukky/gfwlist-by-loukky/master/gfwlist.txt
```

---

## 🧾 规则提交指南

### 发现以下情况的网站未在列表中，请开 Issue 补充

- [ ] 国内访问出现 `ERR_CONNECTION_RESET` 错误
- [ ] HTTP 访问出现上述情况，但 HTTPS 正常
- [ ] DNS 污染（国内解析该域名指向不正确 IP，而国外解析正常）
- [ ] 该域名服务器 IP 在国内**完全无法访问**（国内 ping 不通或访问超时，国外正常）

### 📌 示例

| 域名 | 现象 |
|------|------|
| `google.com` | 情况 1 和 3 |
| `support.google.com` | 情况 4 |

### ❌ 移除规则

如果有域名已被解除封锁需要从列表中移除，请直接开 Issue，说明原因并列出该域名的规则内容。

### 🕵️ 匿名提交

如需匿名提交，请发送邮件至：`gfwlistbyloukky#proton.me`（将 `#` 替换为 `@`）

---

## ⭐ Star 历史

[![Stargazers over time](https://starchart.cc/Loukky/gfwlist-by-loukky.svg?variant=adaptive)](https://starchart.cc/Loukky/gfwlist-by-loukky)

---

<p align="center">
  <a href="https://github.com/Loukky/gfwlist-by-loukky">
    <img src="https://github-readme-stats.vercel.app/api/pin/?username=Loukky&repo=gfwlist-by-loukky&theme=transparent&hide_border=true" alt="Repo Card">
  </a>
</p>

<p align="center">
  <sub>Licensed under <a href="https://github.com/Loukky/gfwlist-by-loukky/blob/master/LICENSE">LGPL-2.1</a> · Built with ❤️ for the open internet</sub>
</p>
