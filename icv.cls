% ------------------------------------------------
% iztok.cls — Academic CV class in LaTeX
% ------------------------------------------------
%
% Source:
%   https://codeberg.org/firefly-cpp/academic-cv-latex-template
%
% License:
%   European Union Public License (EUPL) v1.2
%
% Copyright (c) 2026 Iztok Fister, Jr.
%
% ------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{icv}[2026/03/07 Academic CV class]

\LoadClass[10pt,onecolumn]{article}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{xcolor}
\RequirePackage{geometry}
\RequirePackage{enumitem}
\RequirePackage{needspace}
\RequirePackage{hyperref}
\RequirePackage{doi}
\RequirePackage{fontawesome5}
\RequirePackage{scalerel}
\RequirePackage{tikz}
\RequirePackage{array}
\usetikzlibrary{svg.path}

\definecolor{slred}{HTML}{882B21}
\definecolor{slblue}{HTML}{0080FF}
\definecolor{slgreen}{HTML}{2F6B3B}
\colorlet{accent}{slred}

\newif\ifcvslovene
\cvslovenefalse

\DeclareOption{red}{\colorlet{accent}{slred}}
\DeclareOption{blue}{\colorlet{accent}{slblue}}
\DeclareOption{green}{\colorlet{accent}{slgreen}}
\DeclareOption{slovene}{\cvslovenetrue}
\DeclareOption{english}{\cvslovenefalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\geometry{top=1.45cm,bottom=1.7cm,left=1.8cm,right=1.8cm}
\definecolor{cvtextgray}{HTML}{4A4A4A}
\definecolor{rulegray}{HTML}{D8D8D8}

\hypersetup{
  colorlinks=true,
  urlcolor=accent,
  linkcolor=accent
}

\setlength{\parindent}{0pt}
\setlength{\parskip}{0.06em}
\setlist[itemize]{leftmargin=1.15em,itemsep=0.03em,topsep=0.03em,parsep=0pt,partopsep=0pt}
\AtBeginDocument{\fontsize{10}{11.5}\selectfont}

\makeatletter
\newcommand{\cvtitletext}{\@title}
\newcommand{\cvtaglinetext}{}
\newcommand{\cvcontacttext}{}
\newcommand{\tagline}[1]{\gdef\cvtaglinetext{#1}}
\newcommand{\contactinfo}[1]{\gdef\cvcontacttext{#1}}
\makeatother

\newcommand{\contactsep}{\enspace{\color{accent}\textbar}\enspace}
\newcommand{\emaillink}[1]{\href{mailto:#1}{\faIcon{envelope}\enspace #1}}
\newcommand{\phonelink}[1]{\href{tel:#1}{\faIcon{phone}\enspace #1}}
\newcommand{\weblink}[2]{\href{#1}{\faIcon{globe}\enspace #2}}
\newcommand{\githublink}[2]{\href{#1}{\faIcon{github}\enspace #2}}
\newcommand{\codeberglink}[2]{\href{#1}{\faIcon{code}\enspace #2}}
\newcommand{\locationtext}[1]{\faIcon{map-marker-alt}\enspace #1}

\definecolor{orcidlogocol}{HTML}{A6CE39}
\tikzset{
  orcidlogo/.pic={
    \fill[orcidlogocol] svg{M256,128c0,70.7-57.3,128-128,128C57.3,256,0,198.7,0,128C0,57.3,57.3,0,128,0C198.7,0,256,57.3,256,128z};
    \fill[white] svg{M86.3,186.2H70.9V79.1h15.4v48.4V186.2z}
                 svg{M108.9,79.1h41.6c39.6,0,57,28.3,57,53.6c0,27.5-21.5,53.6-56.8,53.6h-41.8V79.1z M124.3,172.4h24.5c34.9,0,42.9-26.5,42.9-39.7c0-21.5-13.7-39.7-43.7-39.7h-23.7V172.4z}
                 svg{M88.7,56.8c0,5.5-4.5,10.1-10.1,10.1c-5.6,0-10.1-4.6-10.1-10.1c0-5.6,4.5-10.1,10.1-10.1C84.2,46.7,88.7,51.3,88.7,56.8z};
  }
}
\DeclareRobustCommand{\orcidicon}[1]{%
  \href{https://orcid.org/#1}{%
    \mbox{\scalerel*{%
      \begin{tikzpicture}[yscale=-1,transform shape]
        \pic{orcidlogo};
      \end{tikzpicture}
    }{|}}\enspace #1%
  }%
}

\newcommand{\makecvheader}{%
  \thispagestyle{empty}%
  \noindent
  {\fontsize{30}{32}\selectfont\sffamily\bfseries\color{accent}\cvtitletext\par}%
  \vspace{0.06em}
  {\normalsize\sffamily\color{cvtextgray}\cvtaglinetext\par}%
  \vspace{0.18em}
  {\color{rulegray}\rule{\textwidth}{0.45pt}\par}%
  \vspace{0.10em}
  \begin{center}
    \small\color{cvtextgray}
    \cvcontacttext
  \end{center}
  \vspace{-0.38em}
  {\color{rulegray}\rule{\textwidth}{0.45pt}\par}%
  \vspace{0.28em}
}
\renewcommand{\maketitle}{\makecvheader}

\newcommand{\cvsection}[1]{%
  \Needspace{8\baselineskip}%
  \vspace{0.28em}
  {\large\sffamily\bfseries\color{accent} #1}\par
  \vspace{0.04em}
  {\color{rulegray}\rule{\textwidth}{0.40pt}}\par
  \vspace{0.10em}
}

\newlength{\cvleftcolwidth}
\setlength{\cvleftcolwidth}{0.16\textwidth}
\newlength{\cvrightcolwidth}
\setlength{\cvrightcolwidth}{\dimexpr\textwidth-\cvleftcolwidth-1.0em\relax}

\newcolumntype{L}{>{\raggedleft\arraybackslash\small\sffamily\color{cvtextgray}}p{\cvleftcolwidth}}
\newcolumntype{R}{>{\arraybackslash}p{\cvrightcolwidth}}

\newenvironment{cvlayout}{%
  \begin{description}[
    leftmargin=\dimexpr\cvleftcolwidth+1.0em\relax,
    labelwidth=\cvleftcolwidth,
    labelsep=1.0em,
    align=right,
    nosep
  ]
}{%
  \end{description}%
}

\NewDocumentCommand{\cventry}{m m m m +g}{%
  \begin{cvlayout}
    \item[{\normalfont\small\sffamily\color{cvtextgray}\strut #1}]%
    \parbox[t]{\linewidth}{%
      \setlength{\parskip}{0pt}%
      \raggedright
      \strut\textbf{#2}\par
      \vspace{-0.20em}%
      \strut{\small\sffamily #3}\par
      \vspace{-0.20em}%
      \strut{\emph{#4}}\par
      \IfNoValueF{#5}{\vspace{-0.25em}#5}%
    }%
  \end{cvlayout}%
  \vspace{0.04em}%
}

\newcommand{\cvitem}[2]{%
  \begin{cvlayout}
    \item[{\normalfont\small\sffamily\color{cvtextgray}\strut #1}]%
    \parbox[t]{\linewidth}{%
      \setlength{\parskip}{0pt}%
      \raggedright
      \strut #2%
    }%
  \end{cvlayout}%
  \vspace{0.05em}%
}

\newcommand{\cvaward}[2]{\cvitem{#1}{\textbf{#2}}}
\newcommand{\cvmetric}[2]{\cvitem{#1}{#2}}

% helper macro for repo
\newcommand{\repo}[2]{\href{#1}{\texttt{#2}}}

% helper macro for website - e.g. text from website
\newcommand{\web}[2]{\href{#1}{#2}}
