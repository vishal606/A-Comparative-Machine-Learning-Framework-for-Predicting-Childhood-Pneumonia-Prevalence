% LOCAL STAND-IN for Elsevier's cas-dc.cls (double-column CAS layout), used only to preview-compile offline.
% It reproduces the look of the original CAEPPF_main_FINAL.pdf (A4, two columns, Times, graphical-abstract and
% highlights pages first, "Preprint submitted to ..." footer). For submission, compile main.tex with the official class.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cas-dc}[2026/10/08 local stand-in]
\DeclareOption*{}
\ProcessOptions\relax
\LoadClass[10pt,a4paper,twocolumn,fleqn]{article}
\RequirePackage[T1]{fontenc}
\RequirePackage{mathptmx}
\RequirePackage[a4paper,left=64pt,right=64pt,top=97pt,bottom=112pt,columnsep=24pt,footskip=26pt,headheight=0pt,headsep=0pt]{geometry}
\RequirePackage{etoolbox,keyval,graphicx,xcolor}
\RequirePackage[numbers,sort]{natbib}
\RequirePackage[font=footnotesize,labelsep=colon,justification=justified,skip=4pt]{caption}
\RequirePackage{booktabs,array}
\RequirePackage[colorlinks=true,linkcolor=blue,citecolor=blue,urlcolor=blue]{hyperref}
\fontsize{10}{11.8}\selectfont
\renewcommand\normalsize{\@setfontsize\normalsize{10}{11.8}\abovedisplayskip 6pt plus 2pt minus 2pt\belowdisplayskip\abovedisplayskip\abovedisplayshortskip 4pt\belowdisplayshortskip 4pt}
\renewcommand\small{\@setfontsize\small{9}{10.6}}
\renewcommand\footnotesize{\@setfontsize\footnotesize{8}{9.4}}
\renewcommand\scriptsize{\@setfontsize\scriptsize{7}{8.2}}
\normalsize
\setlength{\parindent}{10pt}\setlength{\parskip}{0pt}
\setlength{\mathindent}{18pt}
\tolerance=1200 \emergencystretch=2em \hbadness=3000
\setlength{\textfloatsep}{12pt plus 2pt minus 2pt}\setlength{\floatsep}{10pt plus 2pt minus 2pt}\setlength{\intextsep}{10pt plus 2pt minus 2pt}
\setlength{\dbltextfloatsep}{12pt plus 2pt minus 2pt}
\renewcommand{\topfraction}{.9}\renewcommand{\dbltopfraction}{.9}\renewcommand{\bottomfraction}{.8}\renewcommand{\textfraction}{.08}
\renewcommand{\floatpagefraction}{.7}\renewcommand{\dblfloatpagefraction}{.7}
\setcounter{topnumber}{4}\setcounter{dbltopnumber}{4}\setcounter{totalnumber}{6}
\renewcommand\figurename{Figure}\renewcommand\tablename{Table}
% ---- headings
\def\@seccntformat#1{\csname the#1\endcsname.\hspace{.5em}}
\renewcommand\section{\@startsection{section}{1}{\z@}{14pt plus 3pt minus 2pt}{9pt plus 1pt}{\normalfont\normalsize\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}{10pt plus 2pt minus 2pt}{5pt plus 1pt}{\normalfont\normalsize\itshape}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}{8pt plus 2pt minus 2pt}{3pt}{\normalfont\normalsize\itshape}}
% ---- lists
\setlength{\leftmargini}{1.4em}\setlength{\leftmarginii}{1.2em}
\def\@listi{\leftmargin\leftmargini\parsep 0pt\topsep 3pt plus 1pt\itemsep 2pt plus 1pt}
% ---- front matter data
\def\@shorttitle{}\def\@shortauthors{}\gdef\@journalname{Informatics in Medicine Unlocked/Artificial Intelligence in Medicine}
\newcommand\shorttitle[1]{\gdef\@shorttitle{#1}}
\newcommand\shortauthors[1]{\gdef\@shortauthors{#1}}
\newcommand\journalname[1]{\gdef\@journalname{#1}}
\def\@authtoks{}\def\@authplain{}\def\@afftoks{}\def\@corinfo{}\def\@emailinfo{}
\renewcommand\title[2][]{\gdef\@title{#2}}
\renewcommand\author[2][]{%
  \begingroup\edef\@x{\endgroup\noexpand\g@addto@macro\noexpand\@authplain{\ifx\@authplain\@empty\else, \fi\unexpanded{#2}}}\@x
  \begingroup\edef\@x{\endgroup\noexpand\g@addto@macro\noexpand\@authtoks{%
    \ifx\@authtoks\@empty\else, \fi\unexpanded{#2}\noexpand\textsuperscript{\noexpand\@alph{#1}}}}\@x}
\newcommand\cormark[1][]{\g@addto@macro\@authtoks{\textsuperscript{,$\ast$}}}
\newcommand\cortext[2][]{\gdef\@corinfo{#2}}
\newcommand\ead[1]{\gdef\@emailinfo{#1}}
\newcommand\credit[1]{}\newcommand\orcid[1]{}
\define@key{aff}{organization}{\def\@affa{#1}}
\define@key{aff}{addressline}{\def\@affb{#1}}
\define@key{aff}{city}{\def\@affc{#1}}
\define@key{aff}{citysep}{}\define@key{aff}{postcode}{\def\@affd{#1}}
\define@key{aff}{state}{\def\@affe{#1}}
\define@key{aff}{country}{\def\@afff{#1}}
\newcommand\affiliation[2][]{%
  \def\@affa{}\def\@affb{}\def\@affc{}\def\@affd{}\def\@affe{}\def\@afff{}%
  \setkeys{aff}{#2}%
  \def\@affsep{}%
  \edef\@affline{\unexpanded\expandafter{\@affa}\ifx\@affb\@empty\else, \unexpanded\expandafter{\@affb}\fi\ifx\@affc\@empty\else, \unexpanded\expandafter{\@affc}\fi\ifx\@afff\@empty\else, \unexpanded\expandafter{\@afff}\fi}%
  \begingroup\edef\@x{\endgroup\noexpand\g@addto@macro\noexpand\@afftoks{\noexpand\par\noexpand\textsuperscript{\noexpand\@alph{#1}}\unexpanded\expandafter{\@affline}}}\@x}
\newsavebox\@absbox\newsavebox\@kwbox\newsavebox\@hlbox\newsavebox\@gabox
\newcommand\sep{\unskip, \ignorespaces}
\renewenvironment{abstract}{\global\setbox\@absbox\vbox\bgroup\hsize=\textwidth\noindent\textbf{Abstract}\par\vspace{3pt}\noindent\ignorespaces}{\par\egroup}
\newenvironment{keywords}{\global\setbox\@kwbox\vbox\bgroup\hsize=\textwidth\noindent\textit{Keywords:}\hspace{.5em}\ignorespaces}{\par\egroup}
\newenvironment{highlights}{\global\setbox\@hlbox\vbox\bgroup\hsize=.46\textwidth\parindent0pt
  \begin{itemize}\def\@listi{\leftmargin1.4em\itemsep 5.2em\parsep0pt\topsep0pt}}{\end{itemize}\egroup}
\newenvironment{graphicalabstract}{\global\setbox\@gabox\vbox\bgroup\hsize=\textwidth\centering}{\egroup}
\newcommand\@titleblock{\vspace*{26pt}\begin{center}{\fontsize{14.4}{17.3}\selectfont\@title\par}\vspace{16pt}
  {\normalsize\@authtoks\par}\vspace{6pt}{\footnotesize\itshape\@afftoks\par}\ifx\@corinfo\@empty\else\vspace{5pt}{\footnotesize $^{\ast}$\@corinfo: Bishal Paul, E-mail: \@emailinfo\par}\fi\end{center}\vspace{22pt}\hrule height .4pt\vspace{8pt}}
\newcommand\@frontpagehead[1]{\thispagestyle{empty}\noindent{\fontsize{14.4}{17.3}\selectfont #1}\par\vspace{58pt}
  \noindent\textbf{\@title}\par\vspace{58pt}\noindent\@authplain\par}
\newenvironment{frontmatter}{}{%
  \ifdim\ht\@gabox>0pt \clearpage\@frontpagehead{Graphical Abstract}\vspace{190pt}\noindent\usebox\@gabox\clearpage\fi
  \ifdim\ht\@hlbox>0pt \@frontpagehead{Highlights}\vspace{72pt}\noindent\usebox\@hlbox\clearpage\fi
  \setcounter{page}{1}%
  \twocolumn[\@titleblock\noindent\usebox\@absbox\par\vspace{8pt}\noindent\usebox\@kwbox\par\vspace{8pt}\hrule height .4pt\vspace{10pt}]%
  \thispagestyle{pprint}%
}
% ---- page styles
\def\ps@pprint{\let\@mkboth\@gobbletwo\def\@oddhead{}\def\@evenhead{}%
  \def\@oddfoot{}\let\@evenfoot\@oddfoot}
\def\ps@plain{\def\@oddhead{}\def\@evenhead{}\def\@oddfoot{\hfill\normalsize\thepage\hfill}\let\@evenfoot\@oddfoot}
\pagestyle{plain}
% ---- bibliography
\renewenvironment{thebibliography}[1]{\section*{References}\footnotesize
  \list{\@biblabel{\@arabic\c@enumiv}}{\settowidth\labelwidth{[10]}\leftmargin\labelwidth\advance\leftmargin\labelsep
  \itemsep 1.5pt plus .5pt\parsep 0pt\usecounter{enumiv}\let\p@enumiv\@empty\renewcommand\theenumiv{\@arabic\c@enumiv}}
  \sloppy\clubpenalty4000\widowpenalty4000\sfcode`\.\@m}{\def\@noitemerr{\@latex@error{Empty `thebibliography' environment}\@ehc}\endlist}
\renewcommand\section{\@startsection{section}{1}{\z@}{14pt plus 3pt minus 2pt}{9pt plus 1pt}{\normalfont\normalsize\bfseries}}
