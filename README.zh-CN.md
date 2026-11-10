# clean-preprint

[![License](https://img.shields.io/badge/license-CC0%201.0-blue?style=flat-square)](LICENSE) [![Compiler](https://img.shields.io/badge/compiler-pdfLaTeX-orange?style=flat-square)](00README.json) [![TeX Live](https://img.shields.io/badge/TeX%20Live-2025-8A2BE2?style=flat-square)](#运行环境) [![arXiv ready](https://img.shields.io/badge/arXiv-ready-brightgreen?style=flat-square)](arxiv_submission.zip) [![Line numbers](https://img.shields.io/badge/line%20numbers-on-success?style=flat-square)](#快速开始) [![Version](https://img.shields.io/badge/version-1.0.0-informational?style=flat-square)](#上传到-github-的配置)

**一套无机构品牌、为屏幕阅读优化的 LaTeX 预印本模板，打包后可直接上传 arXiv。**

[English](README.md) · [中文](README.zh-CN.md) · [下载 arXiv 提交包](arxiv_submission.zip)

> A4 单栏 · XCharter 正文与同族数学字体 · 21 pt 左对齐标题 · 整宽粗体摘要 · 细线页眉 · 无 logo、无版权行、无会议期刊专属元数据。

## 一眼看懂

| | |
|---|---|
| **版面** | A4 单栏，左右 2.2 cm，正文 11 pt |
| **字体** | XCharter + 同族数学字体，21 pt 左对齐标题，10 pt 粗体摘要 |
| **页眉** | 细线、短标题、页码 |
| **品牌** | 默认无；一行代码即可换成自己的 logo |
| **审稿** | 默认开启行号；去掉 `lineno` 即关闭 |
| **编译** | 带 `main.bbl` 时一次 `pdflatex` 即可 |
| **许可** | CC0 1.0 Universal，公有领域 |

## 设计目标

- **先求好读**：宽松行距、适中的行长、清晰的层级，长 PDF 在屏幕上也不累。
- **默认零品牌**：不含任何机构素材、版权页脚或商标问题。
- **零编译负担**：没有 `\input` 链、不强制图片文件、Overleaf 无需额外装字体。
- **改品牌不改类**：所有定制都写在 `main.tex`，`.cls` 保持不动。
- **自由复用**：公有领域，可随意 fork 与再分发，无需署名。

## 快速开始

| 场景 | 做法 |
|---|---|
| Overleaf | 上传本目录，Compiler 选 pdfLaTeX、TeX Live 选 2025，编译 `main.tex` |
| 本地 | `pdflatex main` → `bibtex main`（仅改过 `refs.bib` 才需要）→ `pdflatex main` ×2 |
| arXiv | 直接提交 `arxiv_submission.zip`；`00README.json` 已声明 toplevel 与编译器 |

> `main.bbl` 的文件名**必须与主 `.tex` 同名**：`\bibliography{refs}` 读的是
> `\jobname.bbl`，不是 `refs.bbl`。若把 `main.tex` 改成 `paper.tex`，
> 参考文献文件也要改成 `paper.bbl`。

## 团队定制：logo、页眉、行号

```latex
\documentclass[11pt,a4paper,lineno]{cleanpreprint}

\preprintlogo{logo.png}                    % 首页页眉左：机构 logo
\preprintnote{Technical Report 2026-01}    % 首页页眉右：报告名／编号
\runningtitle{短标题}                      % 第 2 页起的页眉
```

不写 `\preprintlogo` 时页眉显示 "Preprint"，不写 `\preprintnote` 时显示日期。
字体、边距、标题字号与页眉线都在 `cleanpreprint.cls` 里按注释分区，改动很直接。

## 参考文献：三种用法

| 模式 | 做法 | 编译 |
|---|---|---|
| BibTeX（默认） | 把条目粘进 `refs.bib` | `pdflatex → bibtex → pdflatex ×2` |
| 不跑 BibTeX | 保留随包的 `main.bbl` | 一次 `pdflatex` |
| 单一 `.tex` | 注释掉 `\bibliographystyle` 与 `\bibliography`，把 `main.bbl` 内容粘进来（或 `\input{main.bbl}`） | 一次 `pdflatex` |

## 文件说明

| 文件 | 作用 |
|---|---|
| `cleanpreprint.cls` | 模板类（CC0） |
| `main.tex` | 可编辑的正文／示例 |
| `refs.bib` | BibTeX 文献库 |
| `main.bbl` | 预生成的参考文献，使一次 `pdflatex` 即可出结果 |
| `00README.json` | arXiv 的 toplevel 与编译器声明 |
| `arxiv_submission.zip` | 可直接上传的打包文件 |
| `README.md`、`README.zh-CN.md` | 英文／中文文档 |
| `LICENSE`、`.gitignore` | CC0 全文与忽略规则 |

## 运行环境

pdfLaTeX + 完整 TeX Live 2025（或 Overleaf）。用到的包：`extarticle`、`XCharter`、
`newtxmath`、`zlmtt`、`microtype`、`geometry`、`graphicx`、`xcolor`、`amsmath`、
`amssymb`、`booktabs`、`authblk`、`fancyhdr`、`natbib`、`hyperref`，以及可选的 `lineno`。

**包顺序有讲究**：`natbib → hyperref → lineno`。若 `lineno` 在 `hyperref`
之前加载，公式前会莫名多出空行，行号锚点也会失效。

## 上传到 GitHub 的配置

| 字段 | 建议值 |
|---|---|
| 仓库名 | `clean-preprint` |
| Description | `Brand-free, readable LaTeX preprint class: arXiv-ready in one pass, line numbers on, one-line logo hooks. CC0.` |
| Topics | `latex` `latex-template` `arxiv` `preprint` `academic-writing` `typography` `overleaf` `open-science` `cc0` |
| License | CC0-1.0（放好 `LICENSE`，GitHub 会自动识别） |
| 默认分支 | `main` |
| Release | `v1.0.0`，附件挂 `arxiv_submission.zip` |

`.gitignore` 会忽略编译产物，但显式保留 `main.bbl`。建仓库前建议先搜一下同名项目。

## 许可证

**CC0 1.0 Universal** —— 公有领域，无需署名。详见 [LICENSE](LICENSE)。
