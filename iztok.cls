\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iztok}[2023/10/11 iztok CV class]

% Base class
\LoadClass[onecolumn]{article}

% Colors + options
\RequirePackage{xcolor}
\definecolor{slcolor}{HTML}{882B21}
\definecolor{slcolor1}{HTML}{0080FF}

\newcommand{\headlinecolor}{\normalcolor}
\DeclareOption{green}{\renewcommand{\headlinecolor}{\color{green}}}
\DeclareOption{red}{\renewcommand{\headlinecolor}{\color{slcolor}}}
\DeclareOption{blue}{\renewcommand{\headlinecolor}{\color{slcolor1}}}

% Pass unknown
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Page layout
\RequirePackage[
  margin=2cm
]{geometry}

% Links (needed by \orcidicon)
\PassOptionsToPackage{hyphens}{url}
\RequirePackage[colorlinks=false]{hyperref}

\AtBeginDocument{%
  \fontsize{9}{10}\selectfont
}

% ---- Internal redefinitions that use @-macros ----
\makeatletter

% Title (two-column body after a full-width headline - TODO)
\renewcommand{\maketitle}{%
  \twocolumn[%
    \thispagestyle{empty}%
    \vspace*{-0.5\baselineskip}%
    {\fontsize{50}{60}\fontfamily{phv}\fontseries{b}\fontshape{sl}\selectfont
      \headlinecolor \@title\par}%
    \medskip
  ]%
}

% Section styling
\renewcommand{\section}{%
  \@startsection
    {section}{1}{0pt}%
    {-1.5ex plus -1ex minus -.2ex}%
    {1ex plus .2ex}%
    {\large\sffamily\slshape\headlinecolor}%
}
\setcounter{secnumdepth}{0}

\makeatother

\def\changemargin#1#2{\list{}{\rightmargin#2\leftmargin#1}\item[]}
\let\endchangemargin=\endlist

% ====== Identifiers / ORCID ======
\RequirePackage{scalerel}
\RequirePackage{tikz}
\usetikzlibrary{svg.path}

% reference: https://tex.stackexchange.com/questions/533939/ifacconf-how-to-include-orcid-in-latex
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
    }{|}}%
  }%
}

