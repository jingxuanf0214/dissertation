% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "Dissertate.cls",
%     version         = "1.0",
%     date            = "24 January 2014",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, Dissertate",
%     supported       = "send email to suchow@post.harvard.edu",
%     docstring       = "Class for a dissertation."
% --------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Dissertate}[2014/01/24 v1.0 Dissertate Class]
\LoadClass[12pt, oneside, letterpaper]{book}

%---Definitions--------------------------------------------------------
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\department#1{\gdef\@department{#1}}
\def\field#1{\gdef\@field{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitystate#1{\gdef\@universitystate{#1}}
\def\programname#1{\gdef\@programname{#1}}
\def\pdOneName#1{\gdef\@pdOneName{#1}}
\def\pdOneSchool#1{\gdef\@pdOneSchool{#1}}
\def\pdOneYear#1{\gdef\@pdOneYear{#1}}
\def\pdTwoName#1{\gdef\@pdTwoName{#1}}
\def\pdTwoSchool#1{\gdef\@pdTwoSchool{#1}}
\def\pdTwoYear#1{\gdef\@pdTwoYear{#1}}

% 
\RequirePackage{color}
\usepackage{xcolor}
\usepackage{hyperref}
\RequirePackage[tiny, md, sc]{titlesec}
\setlength{\headheight}{15pt}
\pagestyle{plain}
\RequirePackage{titling}
\RequirePackage[palatino]{quotchap}

\RequirePackage{kvoptions}
\DeclareStringOption{School}[]
\ProcessKeyvalOptions*
\RequirePackage{packages/\Dissertate@School/style}

\RequirePackage{graphicx}
\usepackage{microtype}
\usepackage{subcaption}
\usepackage[most]{tcolorbox}
\usepackage{listings}
\usepackage{inconsolata}

% --- Appendix B: Code listing style (from DiffusionObjectRelation/code_style.sty) ---
\tcbuselibrary{listings}
\tcbuselibrary{skins}

\definecolor{lightindigo}{RGB}{220, 224, 255}
% Atom One Light Inspired Color Palette
\definecolor{atomBackground}{RGB}{250, 250, 250}      % Background: #FAFAFA
\definecolor{atomForeground}{RGB}{40, 40, 40}        % Default Text: #282828
\definecolor{atomKeyword}{RGB}{209, 72, 65}          % Keywords: #D14841
\definecolor{atomComment}{RGB}{117, 117, 117}        % Comments: #757575
\definecolor{atomString}{RGB}{42, 130, 218}          % Strings: #2A82DA
\definecolor{atomFunction}{RGB}{88, 110, 117}        % Functions: #586E75
\definecolor{atomNumber}{RGB}{255, 128, 0}           % Numbers: #FF8000
\definecolor{atomType}{RGB}{72, 118, 255}            % Types: #4876FF
\definecolor{atomOperator}{RGB}{40, 40, 40}          % Operators: Same as foreground
\definecolor{atomVariable}{RGB}{118, 118, 118}       % Variables: #767676

\lstdefinestyle{atomLight}{
    backgroundcolor=\color{lightindigo},
    basicstyle=\fontsize{9}{10}\selectfont\ttfamily\color{atomForeground},
    keywordstyle=\color{atomKeyword}\bfseries,
    commentstyle=\color{atomComment}\itshape,
    stringstyle=\color{atomString},
    identifierstyle=\color{atomFunction},
    numberstyle=\tiny\color{gray},
    numbers=none,
    breaklines=true,
    breakatwhitespace=true,
    frame=none,
    rulecolor=\color{atomBackground},
    tabsize=1,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    captionpos=b,
    language=Python,
    morekeywords={self, cls, with, ...},
    emph={print, def, return, self, with},
    emphstyle=\color{atomType}\bfseries,
    linewidth=0.99\linewidth,
    columns=fullflexible
}
\lstset{style=atomLight}
\lstset{mathescape}

\newtcblisting{RoundedListing}[1][]{
  listing engine=listings,
  listing only,
  enhanced,
  breakable,
  arc=5pt,
  boxrule=1pt,
  colframe=atomBackground,
  colback=lightindigo,
  top=3pt, bottom=3pt, left=3pt, right=3pt,
  listing options={
    style=atomLight,
    #1
  }
}
% --- End Appendix B code listing style ---
\usepackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathspec}
% lets me use \diameter
\RequirePackage{wasysym}

% seeing if this makes things look OK
% \setmathsfont(Digits,Latin,Greek)[Numbers={Proportional}]{Arial} 
\RequirePackage{lettrine}

% use natbib for citations, so \citep for () and \citet for inline in the .tex
\RequirePackage[]{natbib}
\setcitestyle{authoryear} % use authoryear instead of numbers

\renewcommand{\bibnumfmt}[1]{[#1]}
% \RequirePackage[width=6.5in, letterpaper]{geometry}
%\RequirePackage[margin=1.25in, letterpaper]{geometry}
\RequirePackage[width=6in, height=8.75in, foot = 0.75in, letterpaper]{geometry}
\usepackage{ragged2e}
\RequirePackage{fancyhdr}

\usepackage[titletoc]{appendix}
\renewcommand{\setthesection}{\arabic{chapter}.A\arabic{section}}

% \usepackage[OT1]{fontenc}

\RequirePackage{setspace}
\RequirePackage{packages/\Dissertate@School/fltpage2}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage[tight,nice]{units}
\RequirePackage{verbatim}
% tocdepth 2 gives \subsections (what I want)
\setcounter{tocdepth}{2} 

\RequirePackage{url}
\usepackage[titles]{tocloft}
\usepackage[normalem]{ulem}
\usepackage{csquotes}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\normalsize \scshape}
% \usepackage{fixltx2e}
\usepackage{ragged2e}

\renewcommand\bibname{References}
\renewcommand\listfigurename{Listing of figures}
% \RaggedRight

% 24pt looks more reasonable to me
\parindent 24pt
\RequirePackage{mathspec}

%---------FONTS----------------------------------------------------------------

% TODO: update to match figure styel of latex
% \setmathsfont(Digits,Latin,Greek)[Numbers={Proportional},SizeFeatures={{Size=-8, OpticalSize=8},{Size= 8-, OpticalSize=12}},]{EB Garamond}
% \setmathrm{EB Garamond}

% \setmathsfont(Digits,Latin,Greek)[Numbers={Proportional},SizeFeatures={{Size=-8, OpticalSize=8},{Size= 8-, OpticalSize=12}},]{Latin Modern Math}
% \setmathrm{Latin Modern Math}


% \setmathsfont(Digits,Latin,Greek)[Numbers={Proportional}]{Latin Modern Math}
% \setmathrm{Latin Modern Math}


% TODO see if it is possible to explicitly set the font to "Computer Modern Math"
% and define smallcaps with it
% unsure of of the order/difference b/n Ot1 and T1

% Use "Computer Modern" to show I am a nerd.
\usepackage{lmodern}
\usepackage[T1]{fontenc}

% Increase the penalty a bit (was 300 in original)
\widowpenalty=500
\clubpenalty=500

\defaultfontfeatures{Mapping=tex-text}

% \newfontfamily{\smallcaps}[RawFeature={+c2sc,+scmp}]{cm}
% \setromanfont[Numbers=OldStyle, Ligatures={Common, TeX}, Scale=1.0]{cmr}

%\newfontfamily{\smallcaps}[RawFeature={+c2sc,+scmp}]{Times New Roman}
% \setromanfont[Numbers=OldStyle, Ligatures={Common, TeX}, Scale=1.0]{Times New Roman}

% \newfontfamily{\smallcaps}[RawFeature={+c2sc,+scmp}]{EB Garamond}
%\setromanfont[Numbers=OldStyle, Ligatures={Common, TeX}, Scale=1.0]{EB Garamond}

%\setsansfont[Scale=MatchLowercase, BoldFont={Lato Bold}]{Lato Regular}
\setmonofont[Scale=MatchLowercase]{Noto Sans Mono} % Font substitution for Source Code Pro

%-----CAPTION CONFIG------------------------------------------------------------
% Set the font optins for the caption changes:
% sf to rm (sans to roman), footnotesize to small, singlespacing to onehalfspacing
\RequirePackage[labelfont={bf,rm,small,onehalfspacing},
								textfont={rm,small,singlespacing},
								justification=RaggedRight,
								singlelinecheck=false,
								margin=0pt,
								figurewithin=chapter,
								tablewithin=chapter]{caption}

% cleveref must be loaded after hyperref and caption
\usepackage[capitalize]{cleveref}

\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\doublespacing

% an environment for paragraph-style section
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}%
}


% Align reference numbers so that they do not cause an indent 
% \newlength\mybibindent
% \setlength\mybibindent{0pt}
% \makeatletter
% \renewenvironment{thebibliography}[1]
%     {\chapter*{\bibname}%
%      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
%      \list{\@biblabel{\@arabic\c@enumiv}}
%           {\settowidth\labelwidth{\@biblabel{999}}
%           \leftmargin\labelwidth
%             \advance\leftmargin\dimexpr\labelsep+\mybibindent\relax\itemindent-\mybibindent
%           \@openbib@code
%           \usecounter{enumiv}
%           \let\p@enumiv\@empty
%           \renewcommand\theenumiv{\@arabic\c@enumiv}}
%      \sloppy
%      \clubpenalty4000
%      \@clubpenalty \clubpenalty
%      \widowpenalty4000%
%      \sfcode`\.\@m}
%     {\def\@noitemerr
%       {\@latex@warning{Empty `thebibliography' environment}}
%      \endlist}
% \makeatother