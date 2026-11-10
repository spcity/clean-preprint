%% ============================================================
%% cleanpreprint.cls  v1.0  (2026-11-10)
%% Brand-free, screen-readable preprint class. CC0 1.0 / public domain.
%% No logos, no institution names, no copyright lines, no journal branding.
%% Reproduces the TYPOGRAPHY of report-style preprints (single column,
%% Charter, generous leading, 21pt title, full-width bold abstract).
%% Compile with pdfLaTeX. Needs a full TeX Live / Overleaf (TeX Live 2025).
%% Options: any extarticle option (10/11/12pt, a4paper, ...), plus
%%   lineno  -> line numbers for review copies
%% ============================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cleanpreprint}[2026/11/10 v1.0 Brand-free readable preprint class]

\newif\ifcplineno
\cplinenofalse
\DeclareOption{lineno}{\cplinenotrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax
\LoadClass[a4paper]{extarticle}

%% --- fonts: the single most important ingredient -----------------
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{XCharter}
\RequirePackage[xcharter,bigdelims,vvarbb]{newtxmath}
\RequirePackage[scaled=1.1]{zlmtt}
\RequirePackage[tracking=smallcaps]{microtype}

%% --- page and spacing --------------------------------------------
\RequirePackage[left=2.2cm,right=2.2cm,top=2.8cm,bottom=2.8cm,
                headheight=16pt,headsep=16pt]{geometry}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{amsmath,amssymb,amsfonts}
\RequirePackage{booktabs}
\RequirePackage{authblk}
\RequirePackage{fancyhdr}

%% --- references and links -----------------------------------------
%% Order matters: natbib -> hyperref -> lineno (loaded at the end of this
%% class). Loading lineno before hyperref causes spurious blank lines
%% before equations and broken line-number anchors.
\RequirePackage[numbers,sort&compress]{natbib}
\RequirePackage[colorlinks=true,allcolors=blue]{hyperref}

\setlength{\parindent}{0pt}
\setlength{\parskip}{0.5\baselineskip}
\setlength{\affilsep}{0.2em}
\renewcommand{\Authfont}{\normalfont\bfseries\fontsize{9}{13}\selectfont}
\renewcommand{\Affilfont}{\normalfont\fontsize{8}{10}\selectfont}
\renewcommand{\Authands}{ and }

\newcommand{\footerfont}{\normalfont\fontsize{8}{10}\selectfont}
\newcommand{\runningtitle}[1]{\gdef\cp@runningtitle{#1}}
\newcommand{\cp@runningtitle}{}

%% --- one-line branding hooks --------------------------------------
%% \preprintlogo{logo.png}  -> institution logo, first page header (left)
%% \preprintnote{...}       -> replaces the date, first page header (right)
%% Both optional. With no logo the header falls back to plain "Preprint".
\newcommand{\cp@logo}{}
\newcommand{\preprintlogo}[1]{\gdef\cp@logo{#1}}
\newcommand{\cp@note}{}
\newcommand{\preprintnote}[1]{\gdef\cp@note{#1}}

%% --- title block --------------------------------------------------
\newcommand{\cp@titlefont}{\normalfont\bfseries\fontsize{21}{23}\selectfont}
\renewcommand{\maketitle}{%
  \begingroup
    \setlength{\parindent}{0pt}%
    \begin{flushleft}%
      {\cp@titlefont\@title\par}\vskip 11pt
      {\@author\par}%
    \end{flushleft}%
  \endgroup
  \vskip 4pt
  \hrule height 0.5pt
  \vskip 12pt
  \thispagestyle{cpfirst}%
}

%% --- abstract: full text width, bold 10pt, open leading -----------
\renewenvironment{abstract}{%
  \par\noindent
  \begingroup
    \bfseries\fontsize{10}{12}\selectfont\linespread{1.2}\selectfont
}{%
    \par
  \endgroup
  \vskip 10pt
}

%% --- running heads ------------------------------------------------
\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\footerfont\cp@runningtitle}
\fancyfoot[R]{\footerfont\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{cpfirst}{%
  \fancyhf{}%
  \fancyhead[L]{%
    \ifx\cp@logo\empty
      \footerfont Preprint%
    \else
      \includegraphics[height=16pt]{\cp@logo}%
    \fi}%
  \fancyhead[R]{%
    \footerfont
    \ifx\cp@note\empty
      \today%
    \else
      \cp@note%
    \fi}%
  \fancyfoot[R]{\footerfont\thepage}%
  \renewcommand{\headrulewidth}{0.5pt}%
}

%% --- optional line numbers ----------------------------------------
\ifcplineno
  \RequirePackage{lineno}
  \AtBeginDocument{\linenumbers}
\fi

\endinput
