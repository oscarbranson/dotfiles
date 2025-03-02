% LaTeX class for Reviewer Comments.
% Expands `article' class
% 
% by Oscar Branson - ob266@cam.ac.uk (03/03/2020)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cam_review}[2020/03/03 Journal Review]

% Pass options through to article class
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions \relax
\LoadClass{article}

% page layout
\RequirePackage[a4paper,top=3cm,left=26mm,right=26mm,bottom=30mm,includefoot,headheight=3cm]{geometry}

% font family
\renewcommand{\familydefault}{\sfdefault}

% No section numbers
\setcounter{secnumdepth}{0}

% Remove paragraph indentation
\parindent0pt
\setlength{\parskip}{0.8\baselineskip}

% Variables
\newcommand{\@editor}{The Editor\\\@journal}
\newcommand{\editor}[1]{\gdef\@editor{#1}}

\newcommand{\@journal}{Journal Title}
\newcommand{\journal}[1]{\gdef\@journal{#1}}

\newcommand{\@manuscript}{}
\newcommand{\manuscript}[1]{\gdef\@manuscript{#1}}

\newcommand{\@reviewround}{}
\newcommand{\reviewround}[1]{\gdef\@reviewround{#1}}

\newcommand{\@authors}{}
\newcommand{\authors}[1]{\gdef\@authors{#1}}

\newcommand{\@letterdate}{\today}
\newcommand{\letterdate}[1]{\gdef\@letterdate{#1}}

\newcommand{\@opening}{Dear Editor and Authors,}
\newcommand{\opening}[1]{\gdef\@opening{#1}}

\newcommand{\@fromname}{Oscar Branson}
\newcommand{\fromname}[1]{\gdef\@fromname{#1}}

\newcommand{\@fromtitle}{Dr}
\newcommand{\fromtitle}[1]{\gdef\@fromtitle{#1}}

\newcommand{\@fromposition}{Associate Professor}
\newcommand{\fromposition}[1]{\gdef\@fromposition{#1}}

\newcommand{\@fromaddress}{Department of Earth Sciences\\
                           University of Cambridge\\
                           Downing St.\\
                           Cambridge CB2 3EQ}
\newcommand{\fromaddress}[1]{\gdef\@fromaddress{#1}}

\newcommand{\@fromtel}{+44 (0)1223 333427}
\newcommand{\fromtel}[1]{\gdef\@fromtel{#1}}

\newcommand{\@fromemail}{ob266@cam.ac.uk}
\newcommand{\fromemail}[1]{\gdef\@fromemail{#1}}

\newcommand{\@fromweb}{http://biomin.esc.cam.ac.uk}
\newcommand{\fromweb}[1]{\gdef\@fromweb{#1}}

\newcommand{\@logofile}{\string~/texmf/tex/latex/media/logo_cam_esc}
\newcommand{\logofile}[1]{\gdef\@logofile{#1}}

\newcommand{\@signfile}{\string~/texmf/tex/latex/media/signature}
\newcommand{\signfile}[1]{\gdef\@signfile{#1}}

\newcommand{\@signoff}{Sincerely,}
\newcommand{\signoff}[1]{\gdef\@signoff{#1}}

% Headers and footers
\RequirePackage{fancyhdr}
\RequirePackage[absolute]{textpos}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{ifthen}
\RequirePackage{afterpage}
\RequirePackage[colorlinks=false,
                pdfborder={0 0 0},
               ]{hyperref}
\RequirePackage{lastpage}
\RequirePackage{marginnote}
\RequirePackage{ulem}
\RequirePackage{needspace}

\definecolor{LineGray}{RGB}{150,150,150}

\fancypagestyle{camheader}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \lfoot{\thepage/\pageref{LastPage}}
}

\fancypagestyle{firstpage}{
    \fancyhf{}
    \fancyhead{
        \begin{textblock*}{65mm}(12mm,14mm)
            \includegraphics[width=65mm]{\@logofile}
        \end{textblock*}
        \begin{textblock*}{178mm}(12mm,14mm)   % 178 = 210 - 12 - 20
            \rmfamily
            \hfill \textbf{\@fromtitle~\@fromname} \\
            \hfill \@fromposition 
        \end{textblock*}
    }
    \lfoot{\thepage/\pageref{LastPage}}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{signpage}{
    \rfoot{
        \begin{minipage}[b]{5cm}
            \begin{flushright}
            \footnotesize\sffamily
            \@fromaddress \\
            Tel: \@fromtel \\
            \href{mailto:\@fromemail}{Email: \@fromemail} \\
            \href{\@fromweb}{Website}
            \end{flushright}
        \end{minipage}
    }
    \lfoot{
        \begin{minipage}[b]{3cm}
            \thepage/\pageref{LastPage}       
        \end{minipage}
    }
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

\pagestyle{camheader}

\AtBeginDocument{
    \vspace*{1cm}
    \thispagestyle{firstpage}

    \@editor
    \vspace*{0.5\baselineskip}

    \@letterdate \vspace*{0.2\baselineskip}

    \textbf{\@reviewround Review of: \@manuscript} \\
    \hspace*{2.5cm}\@authors~for~\textit{\@journal}.
    \vspace*{0.5\baselineskip}

    \@opening \par
}

\newcommand{\sign}{
    \begingroup
    \needspace{8cm}
    \par \vspace{0.5\baselineskip}
    \thispagestyle{signpage}
    \parbox{45mm}{
        \hspace*{5mm}\@signoff \vspace*{5mm}
        \ifthenelse{\equal{\@signfile}{}}{\bigskip\bigskip}{
            \vspace*{0.7\baselineskip}
            \hspace*{8mm} \includegraphics[width=43mm]{\@signfile}
        }
        \hspace*{15mm}\@fromname
    }
    % Apply new geometry for signature page
    \newgeometry{top=2cm,left=30mm,right=2cm,bottom=2cm,includefoot,headheight=15pt}
    \endgroup
}

\newcommand{\lineno}[1]
{
        \marginnote{\small \color{LineGray} \bf{\texttt{L#1}}}[0.8\baselineskip]
}

\newcommand{\eqnno}[1]
{
        \marginnote{\small \color{LineGray} \bf{\texttt{Eq. #1}}}[0.8\baselineskip]
}

\newcommand{\figno}[1]
{
        \marginnote{\small \color{LineGray} \bf{\texttt{Fig. #1}}}[0.8\baselineskip]
}

\newcommand{\rogueref}[1]
{
        \marginnote{\small \color{LineGray} \bf{\texttt{#1}}}[0.8\baselineskip]
}

\newcommand{\replace}[2]
{
    \sout{#1} $\rightarrow$ #2
}

\newenvironment{specifics}
{   
    \clearpage
    \section{Specific Comments}
    \reversemarginpar
}
{}
