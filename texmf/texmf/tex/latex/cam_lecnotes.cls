\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cam_lecnotes}[2020/03/02 Cambridge Lecture Notes]

% Pass options to article class
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions \relax
\LoadClass{article}

% Page Layout
\RequirePackage[a4paper,top=2cm,bottom=2cm,left=2cm,right=2cm,headheight=15pt]{geometry}

% Packages
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{xcolor}

% Variables
\newcommand{\@lecturer}{Oscar Branson}
\newcommand{\lecturer}[1]{\gdef\@lecturer{#1}}

\newcommand{\@course}{C5 : Mineralogy : Biominerals}
\newcommand{\course}[1]{\gdef\@course{#1}}

\newcommand{\@nlecture}{}
\newcommand{\nlecture}[1]{\gdef\@nlecture{#1}}

\newcommand{\@lectitle}{}
\newcommand{\lectitle}[1]{\gdef\@lectitle{#1}}

\newcommand{\@lecsubtitle}{}
\newcommand{\lecsubtitle}[1]{\gdef\@lecsubtitle{#1}}

\newcommand{\@coursedate}{March 2020}
\newcommand{\coursedate}[1]{\gdef\@coursedate{#1}}


% Style
\definecolor{SeaBlue}{HTML}{336EBE}
\renewcommand{\familydefault}{\sfdefault}
\parindent0pt

\fancypagestyle{plain}{
    \fancyhf{}
    \lhead{\@course : \@nlecture}
    \rhead{\@lecturer}
    \rfoot{\thepage/\pageref{LastPage}}
    \lfoot{\@coursedate}
    \renewcommand{\headrulewidth}{1pt}
    \renewcommand{\footrulewidth}{1pt}
}

\fancypagestyle{firstpage}{
    \fancyhf{}
    \lhead{\@course : \@nlecture}
    \rhead{\@lecturer}
    \rfoot{\thepage/\pageref{LastPage}}
    \lfoot{\@coursedate}
    \renewcommand{\headrulewidth}{1pt}
    \renewcommand{\footrulewidth}{1pt}
}

\pagestyle{plain}

% Title
\renewcommand{\maketitle}{
    \LARGE \textbf{\@lectitle}

    \Large \textit{\@lecsubtitle}
    
    \normalsize
}

\AtBeginDocument{
    \thispagestyle{firstpage}

    \maketitle
}


% Reference to slide in margin
\newcommand{\slideref}[1]{
    \marginpar{\vspace{0.65\baselineskip}\tiny\color{SeaBlue}\bf{#1}}
}

% Concepts sections and item
\newenvironment{concepts}
{
    \section*{Key Concepts}
    \begin{tabular}{p{0.18\textwidth} p{0.7\textwidth} p{.1\textwidth}}
}
{
    \end{tabular}
}

\newcommand{\concept}[3]{
    \raggedright{\textbf{#1}} & #2 & \vspace{-0.35\baselineskip}\tiny\color{SeaBlue}\bf{#3} \\
}