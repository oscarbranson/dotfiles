\NeedsTeXFormat{LaTeX2e}[1994/06/01]

\ProvidesClass{tufte-book}[2009/12/11 v3.5.0 Tufte-book class]

%%
% Declare we're tufte-book
\newcommand{\@tufte@class}{book}% the base LaTeX class (defaults to the article/handout style)
\newcommand{\@tufte@pkgname}{tufte-book}% the name of the package (defaults to tufte-handout)

%%
% Load the common style elements
\input{tufte-common_ett.def}


%%
% Set up any book-specific stuff now

%%
% The front matter in Tufte's /Beautiful Evidence/ contains everything up
% to the opening page of Chapter 1.  The running heads, when they appear,
% contain only the (arabic) page number in the outside corner.
%\newif\if@mainmatter \@mainmattertrue
\renewcommand\frontmatter{%
  \cleardoublepage%
  \@mainmatterfalse%
  \pagenumbering{arabic}%
  %\pagestyle{plain}%
  \fancyhf{}%
  \ifthenelse{\boolean{@tufte@twoside}}%
    {\fancyhead[LE,RO]{\thepage}}%
    {\fancyhead[RE,RO]{\thepage}}%
}


%%
% The main matter in Tufte's /Beautiful Evidence/ doesn't restart the page
% numbering---it continues where it left off in the front matter.
\renewcommand\mainmatter{%
  \cleardoublepage%
  \@mainmattertrue%
  \fancyhf{}%
  \ifthenelse{\boolean{@tufte@twoside}}%
    {% two-side
      \renewcommand{\chaptermark}[1]{\markboth{##1}{}}%
      \fancyhead[LE]{\thepage\quad\smallcaps{\newlinetospace{\plaintitle}}}% book title
      \fancyhead[RO]{\smallcaps{\newlinetospace{\leftmark}}\quad\thepage}% chapter title
    }%
    {% one-side
      \fancyhead[RE,RO]{\smallcaps{\newlinetospace{\plaintitle}}\quad\thepage}% book title
    }%
}


%%
% The back matter contains appendices, indices, glossaries, endnotes,
% biliographies, list of contributors, illustration credits, etc.
\renewcommand\backmatter{%
  \if@openright%
    \cleardoublepage%
  \else%
    \clearpage%
  \fi%
  \@mainmatterfalse%
}

%%
% Only show the chapter titles in the table of contents
\setcounter{tocdepth}{0}

%%
% If there is a `tufte-book-local.sty' file, load it.

\IfFileExists{tufte-book-local.tex}
  {\input{tufte-book-local}
   \TufteInfoNL{Loading tufte-book-local.tex}}
  {}

%%
% End of file






%\renewcommand{\rmdefault}{phv} % Arial
%\renewcommand{\sfdefault}{phv} % Arial
%\hypersetup{colorlinks}

\geometry{
  left=24.8mm, % left margin
  textwidth=100mm, % main text block
  marginparsep=8.2mm, % gutter between main text block and margin notes
  marginparwidth=60mm % width of margin notes
}


\usepackage{tikz}
\usetikzlibrary{arrows}
\tikzstyle{block}=[draw opacity=0.3,line width=1.4cm]

\newenvironment{Objectives}{%
\begin{tikzpicture}  
\node[rounded corners,text width=1.5\textwidth,draw=black, thick, 
fill=DarkSeaGreen2, fill opacity=0.3,text opacity=1] 
\bgroup%
  \begin{minipage}{1.5\textwidth}
}{%
  \end{minipage}
\egroup;\end{tikzpicture}}


\newenvironment{Objectives2}{%
\begin{tikzpicture}
\node[rounded corners,text width=1.5\textwidth,draw=black, thick, 
fill=DarkSeaGreen2, fill opacity=0.3,text opacity=1] \bgroup%
}{\egroup;\end{tikzpicture}}



\usepackage[T1]{fontenc}    %added 23/2/16
\DeclareMathAlphabet{\mathbfsf}{\encodingdefault}{\sfdefault}{bx}{sl}  %added 23/2/16

%\usepackage{marginfix}
\usepackage[space]{grffile}




\usepackage{graphicx} % allow embedded images
  \setkeys{Gin}{width=\linewidth,totalheight=\textheight,keepaspectratio}
  \graphicspath{{graphics/}} % set of paths to search for images
\usepackage{amsmath}  % extended mathematics
\usepackage{booktabs} % book-quality tables
\usepackage{units}    % non-stacked fractions and better unit spacing
\usepackage{multicol} % multiple column layout facilities
%\usepackage{lipsum}   % filler text
\usepackage{fancyvrb} % extended verbatim environments
  \fvset{fontsize=\normalsize}% default font size for fancy-verbatim environments

% Standardize command font styles and environments
\newcommand{\doccmd}[1]{\texttt{\textbackslash#1}}% command name -- adds backslash automatically
\newcommand{\docopt}[1]{\ensuremath{\langle}\textrm{\textit{#1}}\ensuremath{\rangle}}% optional command argument
\newcommand{\docarg}[1]{\textrm{\textit{#1}}}% (required) command argument
\newcommand{\docenv}[1]{\textsf{#1}}% environment name
\newcommand{\docpkg}[1]{\texttt{#1}}% package name
\newcommand{\doccls}[1]{\texttt{#1}}% document class name
\newcommand{\docclsopt}[1]{\texttt{#1}}% document class option name
\newenvironment{docspec}{\begin{quote}\noindent}{\end{quote}}% command specification environment
\usepackage{textcomp}
\usepackage{wasysym}
\usepackage{amsthm}
%\usepackage{tikzsymbols}
\usepackage{caption}
\usepackage{hyperref}  
\hypersetup{
    colorlinks=true,
    allcolors=cyan}



%\usepackage{hyphenat}
%\usepackage[
%style=numeric,
 % autocite=footnote,
  %backend=biber,
  %sorting=none
%]{biblatex}
%\addbibresource{/Volumes/Kingfisher/edwardtipper/Working/papers/Refs/master-merged-2018.bib}

\newcommand{\dLi}{$\delta^{7}$Li}
\newcommand{\dMg}{$\delta^{26}$Mg}
\newcommand{\dmg}{$\delta^{25}$Mg}
\newcommand{\dS}{$\delta^{34}$S}
\newcommand{\dSs}{$\delta$$^{34}S_{SO_4^{2-}}$}
\newcommand{\dCa}{$\delta^{\frac{44}{42}}$Ca}
\newcommand{\dca}{$\delta^{\frac{43}{42}}$Ca}
\newcommand{\dCaa}{$\delta^{\frac{44}{40}}$Ca}
\newcommand{\dD}{$\delta${D}}
\newcommand{\dO}{$\delta$$^{18}$O}
\newcommand{\dOs}{$\delta$$^{18}O_{SO_4^-}$}
\newcommand{\dC}{$\delta$$^{13}$C}
\newcommand{\sulfate}{SO$_4$}
\newcommand{\DMg}{$\Delta$$^{25}$'Mg}
\newcommand{\DCa}{$\Delta$$^{43}$'Ca}
\newcommand{\micl}{$\mu$l}
\newcommand{\micg}{$\mu$g}
\newcommand{\micm}{$\mu$m}
\newcommand{\nit}{HNO$_3$}
\newcommand{\Sr}{$^{87}$Sr$/^{86}$Sr}
\newcommand{\Nd}{$^{143}$Nd$/^{144}$Nd}
\newcommand{\bicarb}{HCO$_3^-$}
\newcommand{\nitrate}{NO$_3^-$}
\newcommand{\micmol}{$\mu$mol}
\newcommand{\micmoll}{$\mu$mol/l}
\newcommand{\nitric}{HNO$_3$}
\newcommand{\s}{$\sigma$}
\newcommand{\carb}{CO$_2$}
\newcommand{\dSi}{$\delta$$^{30}$Si}
%\newcommand{\mathalert}[1]{\textcolor{DarkSeaGreen4}{\mathbfsf{#1}}}  %added 23/2/16
\newcommand{\mathalert}[1]{\textcolor{Firebrick3}{\mathbf{#1}}}  %added 23/2/16
\newcommand{\alert}[1]{\textcolor{Firebrick3}{\textbf{\textit{#1}}}}
\newcommand{\parent}[1]{\textcolor{OrangeRed3}{#1}}
\newcommand{\daughter}[1]{\textcolor{PaleGreen3}{#1}}


\usepackage{lscape}
%\newcommand{\alert}[1]{\textcolor{Firebrick3}{\textbf{\textit{#1}}}}
\usepackage{enumitem, soul}
\usepackage{tabularx}
%\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
%\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
%\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}}
\newcolumntype{C}{>{\centering\arraybackslash}X}
\newcolumntype{L}{>{\raggedright\arraybackslash}X}
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}

%



% STANDARDIZE COMMAND FONT STYLES AND ENVIRONMENTS
%\newcommand{\doccmd}[1]{\texttt{\textbackslash#1}}% command name -- adds backslash automatically
%\newcommand{\docopt}[1]{\ensuremath{\langle}\textrm{\textit{#1}}\ensuremath{\rangle}}% optional command argument
%\newcommand{\docarg}[1]{\textrm{\textit{#1}}}% (required) command argument
%\newcommand{\docenv}[1]{\textsf{#1}}% environment name
%\newcommand{\docpkg}[1]{\texttt{#1}}% package name
%\newcommand{\doccls}[1]{\texttt{#1}}% document class name
%\newcommand{\docclsopt}[1]{\texttt{#1}}% document class option name
%\newenvironment{docspec}{\begin{quote}\noindent}{\end{quote}}% command specification environment

\usepackage{etoolbox}
\makeatletter
\patchcmd{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi}{}{}{}
\makeatother



\makeatother

%% FIX NEWTHOUGHT
\makeatletter
\def\tuftebreak{%
  \if@nobreak\else
    \par
    \ifdim\lastskip<\tufteskipamount
      \removelastskip \penalty -100
      \tufteskip
    \fi
  \fi
}
\makeatother


%% FIX THE TITLEPAGE

\renewcommand{\maketitlepage}{%
  \cleardoublepage
  {%
  \sffamily
  \begin{fullwidth}%
  \fontsize{18}{20}\selectfont\par\noindent\allcaps\thanklessauthor\par
  \vspace{1pc}%
 % \fontsize{32bp}{70bp}
\fontsize{32bp}{36bp}\selectfont\noindent\allcaps\thanklesstitle\par
  \vspace{1pc}%
  \fontsize{14}{18}\selectfont\par\noindent\allcaps\thanklesspublisher%
    \vspace{1pc}%
  \fontsize{14}{16}\selectfont\par\noindent\allcaps\@\thedate%
  \end{fullwidth}%
  }%
  \thispagestyle{empty}%
  \clearpage
}







%% REDEFINE HEADERS AND FOOTERS
\makeatletter
\newcommand\chapterauthor[1]{#1\gdef\@chapterauthor{#1}}
\def\@chapterauthor{}
\fancypagestyle{mystyle}{%
\fancyhf{}%
\renewcommand{\chaptermark}[1]{\markboth{##1}{}}%
\fancyhead[LE]{\thepage\quad\smallcaps{\newlinetospace{\leftmark}}}% 
\fancyhead[RO]{\smallcaps{\newlinetospace{\plainauthor{} --- \plaintitle}}\quad\thepage}%
\fancyhead[RO]{\smallcaps{\newlinetospace{\plainauthor{} --- The Geological Jigsaw}}\quad\thepage}%
}
\makeatother

%% CREATE MACRO FOR BREAKING LONG CHAPTER NAMES
\newcommand{\lastline}[1]{%
  \begingroup\setlength{\parskip}{0pt}\par\nopagebreak
  \raggedleft#1\par\endgroup
}




%% CREATE EXERCISE AND SUB-EXERCISE
\newtheoremstyle{mystyle}
  {\topsep}% Space above
  {\topsep}% Space below
  {\normalfont}% Body font
  {}% Indent amount
  {\Large\itshape} % Theorem head font
  {\newline}% Punctuation after theorem head
  {0em} % Space after theorem head
  {\thmname{#1}\thmnumber{ #2:  }\thmnote{#3}}  % Theorem head spec (can be left empty, meaning `normal')


\theoremstyle{mystyle}
\newtheorem{Ex}{Exercise}

\newtheorem{SubEx}{Exercise}[Ex]
\renewcommand\theSubEx{\arabic{Ex}.\arabic{SubEx}}



\newcounter{practical}


\renewcommand{\bibname}{References}

\endinput
