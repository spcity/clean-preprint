# clean-preprint

**A brand-free, screen-readable LaTeX preprint class that uploads to arXiv as-is.**

[中文文档](README.zh-CN.md) · [License: CC0-1.0](LICENSE) · [arXiv-ready zip](arxiv_submission.zip)

Single-column A4, XCharter with matching math fonts, a 21 pt left-aligned title,
a full-width bold abstract, generous leading and a thin running head. No logos,
no copyright lines, no journal metadata. Line numbers are on by default.

## Why this exists

Publisher classes such as Springer Nature's `sn-jnl` are built for production
pipelines, not for reading. Report-style preprints (for example Google
DeepMind technical reports) are much easier to read, but come with
institutional branding. `cleanpreprint.cls` keeps only the typography and
drops the branding.

## Highlights

- **arXiv-ready.** `main.bbl` ships with the source, so arXiv's `pdflatex`
  needs no BibTeX pass. `00README.json` pins pdfLaTeX and TeX Live 2025.
- **Nature Portfolio initial submission.** Both *Nature Methods* and *Nature
  Computational Science* state: "Your initial submission does not need to be
  specially formatted ... if you are using TeX/LaTeX, please submit compiled
  PDFs." The PDF from this class is directly usable, with line numbers already on.
- **One-line branding for any team.** `\preprintlogo{logo.png}` and
  `\preprintnote{...}` in the preamble. No class-file editing, no forking.
- **References, your way.** Paste BibTeX entries into `refs.bib`, or paste
  `main.bbl` into the manuscript for a single-file submission.
- **Zero friction.** No `\input` chains, no required figure assets, no fonts
  to install on Overleaf, no institutional assets or trademark issues.
- **CC0 public domain.** Fork, rebrand and redistribute without attribution.

## Quick start

**Overleaf (easiest).** Upload this folder, set Compiler = pdfLaTeX and
TeX Live version = 2025, then compile `main.tex`.

**Local.**
```bash
pdflatex main
bibtex main          # only needed after editing refs.bib
pdflatex main
pdflatex main
```

**arXiv.** Submit `arxiv_submission.zip` as-is. Its `00README.json` declares
`main.tex` as toplevel and pdfLaTeX as compiler; arXiv adds its own ID stamp.

> The shipped `main.bbl` **must match the name of your main `.tex` file**:
> LaTeX's `\bibliography{refs}` reads `\jobname.bbl`, not `refs.bbl`.
> Rename `main.tex` to `paper.tex` and you must also rename the file to
> `paper.bbl`.

## Add your team's branding

Everything lives in `main.tex`; the class stays untouched:

```latex
\documentclass[11pt,a4paper,lineno]{cleanpreprint}

\preprintlogo{logo.png}                    % first-page header, left
\preprintnote{Technical Report 2026-01}    % first-page header, right
\runningtitle{Short title}                 % running head, pages 2+
```

Without `\preprintlogo` the header reads "Preprint"; without `\preprintnote`
it shows the date. To change fonts, margins, title size or the header rule,
edit the clearly marked sections of `cleanpreprint.cls`. Drop the `lineno`
class option to switch line numbers off.

## References: three workflows

| Mode | What you do | Build |
|---|---|---|
| BibTeX (default) | paste entries into `refs.bib` | `pdflatex → bibtex → pdflatex ×2` |
| arXiv / no BibTeX | keep the shipped `main.bbl` beside `main.tex` | one `pdflatex` |
| Single `.tex` | comment out `\bibliographystyle` and `\bibliography`, paste `main.bbl` contents (or `\input{main.bbl}`) | one `pdflatex` |

The last mode is also what *Nature Methods* asks for after Acceptance in
Principle: a standard class, one `.tex`, Computer Modern, numerical citations
and the `.bbl` inlined. See below.

## Switching to a publisher class later

Initial submission needs no change. After Acceptance in Principle, Nature
Methods requires Word or a standard LaTeX class (`article`, `revtex`,
`amsart`), a single `.tex`, default Computer Modern, no personal macros,
numerical references and the `.bbl` pasted into the manuscript. Copy the body
over and replace the preamble with:

```latex
\documentclass[11pt]{article}
\usepackage{amsmath,amssymb,graphicx}
\usepackage[numbers,sort&compress]{natbib}
\title{...}\author{...}\date{}
\begin{document}
\maketitle
\begin{abstract}...\end{abstract}
% ... body unchanged ...
% ... pasted main.bbl here ...
\end{document}
```

The official wording asks for a standard class, while Springer Nature's own
template uses `sn-jnl.cls`; follow the editor's instructions if Springer
source files are requested.

## Files

| File | Purpose |
|---|---|
| `cleanpreprint.cls` | the class (CC0) |
| `main.tex` | editable manuscript / example |
| `refs.bib`, `main.bbl` | BibTeX database + prebuilt bibliography for arXiv |
| `00README.json` | arXiv toplevel + compiler declaration |
| `arxiv_submission.zip` | ready-to-upload bundle |
| `README.md`, `README.zh-CN.md` | English / 中文 documentation |
| `LICENSE` | CC0 1.0 Universal |

## Requirements

pdfLaTeX with a full TeX Live 2025 (or Overleaf). Packages used:
`extarticle` (extsizes), `XCharter`, `newtxmath`, `zlmtt`, `microtype`,
`geometry`, `graphicx`, `xcolor`, `amsmath`, `amssymb`, `booktabs`, `authblk`,
`fancyhdr`, `natbib`, `hyperref`, and optionally `lineno`. All ship with TeX Live.

Package order matters: **natbib → hyperref → lineno**. Loading `lineno`
before `hyperref` inserts spurious blank lines before equations and breaks
line-number anchors.

## Publishing to GitHub

| Field | Suggested value |
|---|---|
| Repository name | `clean-preprint` |
| Description | `Brand-free, readable LaTeX preprint class: arXiv-ready in one pass, line numbers on, one-line logo hooks. CC0.` |
| Topics | `latex` `latex-template` `arxiv` `preprint` `academic-writing` `typography` `overleaf` `open-science` `cc0` |
| License | CC0-1.0 (GitHub auto-detects `LICENSE`) |
| Default branch | `main` |
| Release | `v1.0.0`, attach `arxiv_submission.zip` |

`.gitignore` excludes LaTeX build artefacts but keeps `main.bbl`, which arXiv
needs. Check the repository name for collisions before creating the repo.

## Credits and license

Inspired by the typography of Google DeepMind technical-report preprints
(arXiv:2512.08296) and by the CTAN `extsizes` classes. This class was written
from scratch; it contains no Google code, logos or other assets.

**CC0 1.0 Universal** — public domain. See [LICENSE](LICENSE).
