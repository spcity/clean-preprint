# clean-preprint

[![License](https://img.shields.io/badge/license-CC0%201.0-blue?style=flat-square)](LICENSE) [![Compiler](https://img.shields.io/badge/compiler-pdfLaTeX-orange?style=flat-square)](00README.json) [![TeX Live](https://img.shields.io/badge/TeX%20Live-2025-8A2BE2?style=flat-square)](#requirements) [![arXiv ready](https://img.shields.io/badge/arXiv-ready-brightgreen?style=flat-square)](arxiv_submission.zip) [![Line numbers](https://img.shields.io/badge/line%20numbers-on-success?style=flat-square)](#quick-start) [![Version](https://img.shields.io/badge/version-1.0.0-informational?style=flat-square)](#publishing-to-github)

**A brand-free, screen-readable LaTeX preprint class that uploads to arXiv as-is.**

[English](README.md) · [中文](README.zh-CN.md) · [Download the arXiv-ready zip](arxiv_submission.zip)

> Single-column A4 · XCharter with matching math fonts · 21 pt left-aligned title · full-width bold abstract · hairline running head · no logos, no copyright lines, no venue-specific metadata.

## At a glance

| | |
|---|---|
| **Layout** | A4, single column, 2.2 cm side margins, 11 pt body |
| **Typography** | XCharter + matching math fonts, 21 pt left-aligned title, 10 pt bold abstract |
| **Header** | hairline rule, short running title, page numbers |
| **Branding** | none by default; one line adds your own logo |
| **Review** | line numbers on by default; drop `lineno` to switch off |
| **Build** | one `pdflatex` pass when `main.bbl` is present |
| **License** | CC0 1.0 Universal, public domain |

## Design goals

- **Readable first.** Generous leading, a wide measure and a clear type hierarchy make long PDFs comfortable on screen.
- **Brand-free by default.** No institutional assets, no copyright footer, no trademark concerns.
- **No build friction.** No `\input` chains, no required figure files, no fonts to install on Overleaf.
- **Yours to rebrand.** All customization lives in `main.tex`; the class file stays untouched.
- **Free to reuse.** Fork and redistribute without attribution.

## Quick start

| Where | What to do |
|---|---|
| Overleaf | Upload this folder, set Compiler = pdfLaTeX, TeX Live = 2025, compile `main.tex` |
| Local | `pdflatex main` → `bibtex main` (only after editing `refs.bib`) → `pdflatex main` ×2 |
| arXiv | Submit `arxiv_submission.zip` as-is; `00README.json` declares the toplevel and compiler |

> The shipped `main.bbl` **must match the name of your main `.tex` file**:
> `\bibliography{refs}` reads `\jobname.bbl`, not `refs.bbl`.
> Rename `main.tex` to `paper.tex` and the bibliography file must become `paper.bbl`.

## Add your team's branding

```latex
\documentclass[11pt,a4paper,lineno]{cleanpreprint}

\preprintlogo{logo.png}                    % first-page header, left
\preprintnote{Technical Report 2026-01}    % first-page header, right
\runningtitle{Short title}                 % running head, pages 2+
```

Without `\preprintlogo` the header reads "Preprint"; without `\preprintnote` it shows the date. Fonts, margins, title size and the header rule are grouped in clearly marked sections of `cleanpreprint.cls`.

## References: three workflows

| Mode | What you do | Build |
|---|---|---|
| BibTeX (default) | paste entries into `refs.bib` | `pdflatex → bibtex → pdflatex ×2` |
| No BibTeX | keep the shipped `main.bbl` beside `main.tex` | one `pdflatex` |
| Single `.tex` | comment out `\bibliographystyle` and `\bibliography`, paste `main.bbl` contents (or `\input{main.bbl}`) | one `pdflatex` |

## Files

| File | Purpose |
|---|---|
| `cleanpreprint.cls` | the class (CC0) |
| `main.tex` | editable manuscript / example |
| `refs.bib` | BibTeX database |
| `main.bbl` | prebuilt bibliography, so a single `pdflatex` pass works |
| `00README.json` | arXiv toplevel + compiler declaration |
| `arxiv_submission.zip` | ready-to-upload bundle |
| `README.md`, `README.zh-CN.md` | documentation |
| `LICENSE`, `.gitignore` | CC0 text and ignore rules |

## Requirements

pdfLaTeX with a full TeX Live 2025 (or Overleaf). Packages used: `extarticle`, `XCharter`, `newtxmath`, `zlmtt`, `microtype`, `geometry`, `graphicx`, `xcolor`, `amsmath`, `amssymb`, `booktabs`, `authblk`, `fancyhdr`, `natbib`, `hyperref`, and optionally `lineno`.

Package order matters: **natbib → hyperref → lineno**. Loading `lineno` before `hyperref` inserts spurious blank lines before equations and breaks line-number anchors.

## License

**CC0 1.0 Universal** — public domain, no attribution required. See [LICENSE](LICENSE).
