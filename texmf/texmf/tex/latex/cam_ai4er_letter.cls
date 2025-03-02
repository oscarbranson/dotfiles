% LaTeX class for Cambridge Letter Template.
% Expands `article' class
% 
% by Oscar Branson - ob266@cam.ac.uk (28/02/2020)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cam_letter}[2020/02/27 Cambridge Letterhead]

% Pass options through to article class
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions \relax
\LoadClass{article}

% page layout
\RequirePackage[a4paper,top=5cm,left=26mm,right=2cm,bottom=4cm,includefoot,headheight=15pt]{geometry}

% Title sizes
\RequirePackage{titlesec}

\titleformat*{\section}{\normalsize\bfseries}
\titlespacing\section{0pt}{4pt plus 3pt minus 3pt}{0pt}
\titleformat*{\subsection}{\normalsize\bfseries\slshape}
\titlespacing\subsection{0pt}{4pt plus 3pt minus 3pt}{0pt}

% font family
\renewcommand{\familydefault}{\sfdefault}

% Remove paragraph indentation
\parindent0pt
\setlength{\parskip}{0.8\baselineskip}

% Letter Variables
\newcommand{\@toname}{To Whom It May Concern}
\newcommand{\toname}[1]{\gdef\@toname{#1}}

\newcommand{\@toaddress}{Where They Live}
\newcommand{\toaddress}[1]{\gdef\@toaddress{#1}}

\newcommand{\@subject}{}
\newcommand{\subject}[1]{\gdef\@subject{#1}}

\newcommand{\@letterdate}{\today}
\newcommand{\letterdate}[1]{\gdef\@letterdate{#1}}

\newcommand{\@opening}{\@toname,}
\newcommand{\opening}[1]{\gdef\@opening{#1}}

\newcommand{\@fromname}{Oscar Branson}
\newcommand{\fromname}[1]{\gdef\@fromname{#1}}

\newcommand{\@fromtitle}{Dr}
\newcommand{\fromtitle}[1]{\gdef\@fromtitle{#1}}

\newcommand{\@fromsignoff}{}
\newcommand{\fromsignoff}[1]{\gdef\@fromsignoff{#1}}

\newcommand{\@fromposition}{Assistant Professor\\\hfill AI4ER Co-Director \& MRes Director}
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

\newcommand{\@fromweb}{http://www.esc.cam.ac.uk/directory/oscar-branson}
\newcommand{\fromweb}[1]{\gdef\@fromweb{#1}}

\newcommand{\@ailogo}{\string~/texmf/tex/latex/media/ai4er_logo}
\newcommand{\ailogo}[1]{\gdef\@ailogo{#1}}

\newcommand{\@esclogo}{\string~/texmf/tex/latex/media/EarthSciences}
\newcommand{\esclogo}[1]{\gdef\@esclogo{#1}}

\newcommand{\@signfile}{\string~/texmf/tex/latex/media/signature}
\newcommand{\signfile}[1]{\gdef\@signfile{#1}}

\newcommand{\@signoff}{Sincerely,}
\newcommand{\signoff}[1]{\gdef\@signoff{#1}}

% Headers and footers
\RequirePackage{fancyhdr}
\RequirePackage[colorlinks=false,
                pdfborder={0 0 0},
               ]{hyperref}
\RequirePackage[absolute]{textpos}
\RequirePackage{graphicx}
\RequirePackage{ifthen}
\RequirePackage{afterpage}

\fancypagestyle{camheader}{
    \fancyhf{}
    % \fancyhead{
    %     \begin{textblock*}{65mm}(12mm,14mm)
    %         \includegraphics[width=65mm]{\@ailogo}
    %     \end{textblock*}
    % }
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \cfoot{\thepage}
}

\fancypagestyle{firstpage}{
    \fancyhf{}
    \fancyhead{
        \begin{textblock*}{25mm}(14mm,14mm)
            \includegraphics[height=25mm]{\@ailogo}
        \end{textblock*}
        \begin{textblock*}{178mm}(12mm,18mm)   % 178 = 210 - 12 - 20
            \rmfamily
            \hfill \textbf{\@fromtitle~\@fromname} \\
            \hfill \@fromposition 
        \end{textblock*}
    }
    \fancyfoot{
        \begin{flushright}
            \footnotesize\sffamily
            \@fromaddress \\
            Tel: \@fromtel \\
            \href{mailto:\@fromemail}{Email: \@fromemail} \\
            \href{\@fromweb}{Website}
        \end{flushright}
    }
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{lastpage}{
    
}

\pagestyle{camheader}

\AtBeginDocument{
    \thispagestyle{firstpage}

    \vspace*{0.5\baselineskip}
    \@toname\ifthenelse{\equal{\@toname}{}}{}{\\}
    \@toaddress\ifthenelse{\equal{\@toaddress}{}}{}{\vspace*{0.5\baselineskip}}

    \null\hfill \@letterdate \vspace*{0.2\baselineskip}
        
    \ifthenelse{\equal{\@subject}{}}{}{\textbf{Re: \@subject}\vspace*{0.5\baselineskip}}

    \@opening \par

    \raggedright
}

\AtEndDocument{
    \par \vspace{0.5\baselineskip}
    \parbox{100mm}{
        \hspace*{5mm}\@signoff
        \ifthenelse{\equal{\@signfile}{}}{\bigskip\bigskip}{
            \vspace*{0.7\baselineskip} \\
            \hspace*{8mm} \includegraphics[width=43mm]{\@signfile} \\
            }
        \hspace*{15mm}\@fromname
        \ifthenelse{\equal{\@fromsignoff}{}}{}{\\\hspace*{15mm}\@fromsignoff}
    }
}