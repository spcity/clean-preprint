# clean-preprint

**一套无机构品牌、为屏幕阅读优化的 LaTeX 预印本模板，打包后可直接上传 arXiv。**

[English](README.md) · [许可证：CC0-1.0](LICENSE) · [arXiv 提交包](arxiv_submission.zip)

A4 单栏、XCharter 正文配同族数学字体、21 pt 左对齐大标题、整宽粗体摘要、
宽松行距与一条细页眉线。没有 logo、没有版权行、没有期刊专属元数据。默认开启行号。

## 为什么做这个

Springer Nature 的 `sn-jnl` 这类出版社模板是为**排版生产流水线**设计的，
不是为人阅读设计的。机构技术报告式预印本（例如 Google DeepMind 的技术报告）
读起来舒服得多，却带着机构品牌资产。`cleanpreprint.cls` 只保留版式，
把品牌部分全部拿掉。

## 优势

- **可直接传 arXiv**：随包附带 `main.bbl`，arXiv 的 `pdflatex` 无需跑 BibTeX；
  `00README.json` 已指定 pdfLaTeX 与 TeX Live 2025。
- **Nature 系列初投可直接用**：*Nature Methods* 与 *Nature Computational
  Science* 原文都写明「初投无需特别排版……使用 TeX/LaTeX 的作者请提交编译后的
  PDF」。本模板编译出的 PDF 直接合格，而且默认带行号，更利于审稿。
- **各团队一行加自己的 logo**：导言区写 `\preprintlogo{logo.png}` 与
  `\preprintnote{...}` 即可，不必改 `.cls`、不必 fork、不必处理版权行。
- **加文献最省事**：往 `refs.bib` 直接粘 BibTeX 条目；需要单文件时把
  `main.bbl` 内容粘进正文即可，不用手敲 `\bibitem`。
- **零依赖负担**：没有 `\input` 链、不强制图片、Overleaf 无需装字体、
  不含任何机构商标资源。
- **CC0 公有领域**：可随意 fork、改品牌、再分发，无需署名。

## 快速开始

**Overleaf（最省事）**：上传本目录，Compiler 选 pdfLaTeX、TeX Live 选 2025，
编译 `main.tex`。

**本地编译**：
```bash
pdflatex main
bibtex main          # 只有改过 refs.bib 才需要
pdflatex main
pdflatex main
```

**arXiv**：直接提交 `arxiv_submission.zip`。其中 `00README.json` 声明 toplevel
为 `main.tex`、编译器为 pdfLaTeX；arXiv 会自动加左侧 ID 水印。

> `main.bbl` 的文件名**必须与主 `.tex` 同名**：LaTeX 的
> `\bibliography{refs}` 读的是 `\jobname.bbl`，不是 `refs.bbl`。
> 若把 `main.tex` 改成 `paper.tex`，`.bbl` 也要改成 `paper.bbl`。

## 团队定制：logo、页眉、行号

全部在 `main.tex` 里改，`.cls` 保持不动：

```latex
\documentclass[11pt,a4paper,lineno]{cleanpreprint}

\preprintlogo{logo.png}                    % 首页页眉左：机构 logo
\preprintnote{Technical Report 2026-01}    % 首页页眉右：报告名／编号
\runningtitle{短标题}                      % 第 2 页起的页眉
```

不写 `\preprintlogo` 时页眉显示 "Preprint"，不写 `\preprintnote` 时显示日期。
去掉 `lineno` 选项即关闭行号；字体、边距、标题字号、页眉线都在
`cleanpreprint.cls` 里按注释分区，改动很直接。

## 参考文献：三种用法

| 模式 | 做法 | 编译 |
|---|---|---|
| BibTeX（默认） | 把条目粘进 `refs.bib` | `pdflatex → bibtex → pdflatex ×2` |
| arXiv／不跑 BibTeX | 保留随包的 `main.bbl` | 一次 `pdflatex` |
| 单一 `.tex` | 注释掉 `\bibliographystyle` 与 `\bibliography`，把 `main.bbl` 内容粘进来（或 `\input{main.bbl}`） | 一次 `pdflatex` |

第三种也正是 *Nature Methods* 在 AIP（原则接受）之后的要求：标准 class、
单一 `.tex`、Computer Modern、数字引用、`.bbl` 内联。

## 后期切换出版社模板

初投不用改。AIP 之后按官方要求：Word 或标准 LaTeX class
（`article` / `revtex` / `amsart`）、单一 `.tex`、默认 Computer Modern、
删除个人宏、只用数字引用、`.bbl` 粘进正文、编译零警告。正文原样复制，
只换头部：

```latex
\documentclass[11pt]{article}
\usepackage{amsmath,amssymb,graphicx}
\usepackage[numbers,sort&compress]{natbib}
\title{...}\author{...}\date{}
\begin{document}
\maketitle
\begin{abstract}...\end{abstract}
% ... 正文不变 ...
% ... 粘贴 main.bbl 内容 ...
\end{document}
```

注意：官方字面要求标准 class，而 Springer Nature 自家模板用的是自定义
`sn-jnl.cls`；若编辑明确索要 Springer 源文件，以编辑邮件为准。

## 文件说明

| 文件 | 作用 |
|---|---|
| `cleanpreprint.cls` | 模板类（CC0） |
| `main.tex` | 可编辑的正文／示例 |
| `refs.bib`、`main.bbl` | BibTeX 库 + 给 arXiv 用的预生成参考文献 |
| `00README.json` | arXiv 的 toplevel 与编译器声明 |
| `arxiv_submission.zip` | 可直接上传的打包文件 |
| `README.md`、`README.zh-CN.md` | 英文／中文文档 |
| `LICENSE` | CC0 1.0 Universal 全文 |
| `.gitignore` | 忽略编译产物，但保留 `main.bbl` |

## 运行环境

pdfLaTeX + 完整 TeX Live 2025（或 Overleaf）。用到的包：
`extarticle`（extsizes）、`XCharter`、`newtxmath`、`zlmtt`、`microtype`、
`geometry`、`graphicx`、`xcolor`、`amsmath`、`amssymb`、`booktabs`、`authblk`、
`fancyhdr`、`natbib`、`hyperref`，以及可选的 `lineno`。TeX Live 均自带。

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

`.gitignore` 会忽略 LaTeX 编译产物，但显式保留 `main.bbl`（arXiv 需要）。
建仓库前建议先在 GitHub 搜一下同名项目。

## 致谢与许可

版式思路来自 Google DeepMind 技术报告预印本（arXiv:2512.08296）与 CTAN
`extsizes` 类。本 `.cls` 为从零编写，不含任何 Google 代码、logo 或素材。

**CC0 1.0 Universal**，公有领域，详见 [LICENSE](LICENSE)。
