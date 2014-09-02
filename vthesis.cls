%-------------------------------------------------------------------%
%- VTHESIS.CLS                                                     -%
%-------------------------------------------------------------------%
%-                                                                 -%
%- UVic Thesis style according to Dec. 1994 rules (for LaTeX 2e)   -%
%- (c) Vassilios V. Dimakopoulos, LA.P.I.S., May & Nov. 1995       -%
%-                                                                 -%
%- This file may be freely distributed but not altered.            -%
%- NOTE: No guarantees are made that this file works! And in no    -%
%-       way will the author be responsible to any damage done to  -%
%-       your files. Use it at your own risk.                      -%
%-                                                                 -%
%-------------------------------------------------------------------%

%----------------------------------------------------------------------
%- SECTION 1: preliminaries
%----------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesClass{vthesis}[1995/10/30 R.2.0, V.V. Dimakopoulos]
\newif\if@restonecol %- Should be useless
\newif\if@titlepage  \@titlepagetrue
\newif\if@openright
\newif\if@openbib    \@openbibfalse

%-
%- Internal options provided
%-
\newcommand{\@ptsize}{}
\DeclareOption{10pt}{\renewcommand{\@ptsize}{0}}
\DeclareOption{11pt}{\renewcommand{\@ptsize}{1}}
\DeclareOption{12pt}{\renewcommand{\@ptsize}{2}}
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{\@openbibtrue}
%- Install default ones
%- Letter paper
\setlength\paperheight{11in} \setlength\paperwidth{8.5in}
\ExecuteOptions{11pt,oneside,final,onecolumn,openany}

%-
%- Execute user options
%-
%- First though declare the normal baselineskip for each pt size
\newdimen\pure@baselineskip    %- Needed because \baselinestrech alters
    %- \baselineskip irrepairably; in bibliography we use singl-spacing
\ifcase \@ptsize \pure@baselineskip 12pt
             \or \pure@baselineskip 13.6pt
         \or \pure@baselineskip 14.5pt
\fi
\ProcessOptions
\input{vthesis1\@ptsize.clo}

%-
%- Now set some parameters common to all point sizes
%-   1. Names of various parts
%-
\def\contentsname{Table of Contents}
\def\listfigurename{List of Figures}
\def\listtablename{List of Tables}
\def\bibname{References}        %- Seems better than "References"
\def\indexname{Index}
\def\figurename{Figure}
\def\tablename{Table}
\def\partname{Part}
\def\chaptername{Chapter}
\def\abstractname{ABSTRACT}
\def\appendixname{Appendix}
\def\ackname{Acknowledgement}
\def\dedicname{Dedication}
\def\notname{Notation}

%-   2. Some paragraph variables
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand{\baselinestretch}{1.285}  %- Almost double-spaced
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty

%-   3. Some settings and counters for lists, margins. etc.
%-
\if@twocolumn
  \setlength\leftmargini{2em}
\else
  \setlength\leftmargini{2.5em}
\fi
\setlength\leftmarginii{2.2em}
\setlength\leftmarginiii{1.87em}
\setlength\leftmarginiv{1.7em}
\if@twocolumn
  \setlength\leftmarginv{.5em}
  \setlength\leftmarginvi{.5em}
\else
  \setlength\leftmarginv{1em}
  \setlength\leftmarginvi{1em}
\fi
\setlength\leftmargin{\leftmargini}
\setlength\labelsep{.5em}
\setlength\labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}

\def\labelenumi{\theenumi.}
\def\theenumi{\arabic{enumi}}

\def\labelenumii{(\theenumii)}
\def\theenumii{\alph{enumii}}
\def\p@enumii{\theenumi}

\def\labelenumiii{\theenumiii.}
\def\theenumiii{\roman{enumiii}}
\def\p@enumiii{\theenumi(\theenumii)}

\def\labelenumiv{\theenumiv.}
\def\theenumiv{\Alph{enumiv}}
\def\p@enumiv{\p@enumiii\theenumiii}

\def\labelitemi{$\m@th\bullet$}
\def\labelitemii{\normalfont\bfseries --}
\def\labelitemiii{$\m@th\ast$}
\def\labelitemiv{$\m@th\cdot$}

%-   4. Other settings
%-
\setcounter{topnumber}{2}
\def\topfraction{.7}
\setcounter{bottomnumber}{1}
\def\bottomfraction{.3}
\setcounter{totalnumber}{3}
\def\textfraction{.2}
\def\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\def\dbltopfraction{.7}
\def\dblfloatpagefraction{.5}

\arraycolsep 5pt
\tabcolsep 6pt
\arrayrulewidth .4pt
\doublerulesep 2pt
\tabbingsep \labelsep
\skip\@mpfootins = \skip\footins
\fboxsep = 3pt
\fboxrule = .4pt

%----------------------------------------------------------------------
%- SECTION 2: sectioning stuff
%----------------------------------------------------------------------

\newcounter{part}
\newcounter{chapter}
\newcounter{section}[chapter]
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]

\def\thepart          {\Roman{part}}
\def\thechapter       {\arabic{chapter}}
\def\thesection       {\thechapter.\arabic{section}}
\def\thesubsection    {\thesection.\arabic{subsection}}
\def\thesubsubsection {\thesubsection.\arabic{subsubsection}}
\def\theparagraph     {\thesubsubsection.\arabic{paragraph}}
\def\thesubparagraph  {\theparagraph.\arabic{subparagraph}}

\def\@chapapp{\chaptername}

\setcounter{secnumdepth}{3}

%-
%- Parts
%-
\def\part{\cleardoublepage
   \thispagestyle{empty}%-   empty page looks better
   \@tempswafalse%-          we do not have to check for twocolumn
   \hbox{}\vfil
   \secdef\@part\@spart}

\def\@part[#1]#2{\ifnum \c@secnumdepth >-2\relax
     \refstepcounter{part}%
     \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
   \else
     \addcontentsline{toc}{part}{#1}%
   \fi
   \markboth{}{}%
   {\centering
    \interlinepenalty \@M
    \ifnum \c@secnumdepth >-2\relax
      \huge\bfseries \partname~\thepart
      \par
      \vskip 20\p@
    \fi
    \Huge \bfseries #2\par}\@endpart}

\def\@spart#1{{\centering
   \interlinepenalty \@M \reset@font
   \Huge \bfseries #1\par}\@endpart}

\def\@endpart{\vfil\newpage
   \if@twoside
      \hbox{}%
      \thispagestyle{empty}%
      \newpage
   \fi
   \if@tempswa%-            unnecessary test!
     \twocolumn
   \fi}

%-
%- Chapters
%-
%- Keep a flag to automatically reset the page counter and start arabic
%- numbering when we see the 1st chapter. Notice that we cannot just
%- check if \thechapter is 0 because the \appendix command resets this
%- counter! (VD)
%- Another problem is that starred sectioning commands go through
%- \chapter, so in the beginning things like \tableofcontents get
%- an empty (!) pagestyle. We fix this inside the \@schapter
%-
\newif\if@firstchap \@firstchaptrue

\def\chapter{\if@openright\cleardoublepage\else\clearpage\fi
  \if@firstchap
    \thispagestyle{empty}%-   1st page of text is unpaginated
  \else
    \thispagestyle{plain}%-   Plain page (no fancy headers)
  \fi
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter%
}

\def\@chapter[#1]#2{%- Here we check the above flag
  \if@firstchap \@firstchapfalse \setcounter{page}{1}
     \pagenumbering{arabic}\fi
  \ifnum \c@secnumdepth >\m@ne
    \refstepcounter{chapter}%
    \typeout{\@chapapp\space\thechapter.}%
    \if@onappendix
      \addcontentsline{toc}{chapter}{%
        \appendixname\ \protect\numberline{\thechapter}#1}
      \appendixmark{#1}%- see ps@vpage
    \else
      \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}
      \chaptermark{#1}%
    \fi
  \else
    \addcontentsline{toc}{chapter}{#1} \chaptermark{#1}
  \fi
  \addtocontents{lof}{\protect\addvspace{10\p@}}
  \addtocontents{lot}{\protect\addvspace{10\p@}}
  \if@twocolumn \@topnewpage[\@makechapterhead{#2}]%
  \else \@makechapterhead{#2}\@afterheading\fi%
}

\def\@schapter#1{\thispagestyle{plain} %- NOT empty as decided by \chapter
   \@makeschapterhead{#1}\@afterheading}

\def\chaptermark#1{}
\def\appendixmark#1{}

%- Make chapter heads
\def\@makechapterhead#1{                 % numbered chapters
  {\parindent \z@ \raggedright \reset@font
   \ifnum \c@secnumdepth >\m@ne
     \LARGE\bfseries \@chapapp{} \thechapter
     \nobreak\hspace{.25em}--- 
   \fi
   \interlinepenalty\@M                  % sets up spacing etc. before first paragraph
   \LARGE\bfseries #1\nobreak
   \vskip 80\p@
   }%
}

\def\@makeschapterhead#1{                %un-numbered chapters
  {\parindent \z@ \raggedright
   \reset@font \interlinepenalty\@M \LARGE \bfseries #1\par
   \nobreak \vskip 30\p@}%
}

%-
%- Others
%-
\def\section{\@startsection{section}{1}{\z@}{-3.5ex plus-1ex minus
    -.2ex}{2.3ex plus.2ex}{\reset@font\Large\bfseries}}
\def\subsection{\@startsection{subsection}{2}{\z@}{-3.25ex plus-1ex
    minus-.2ex}{1.5ex plus.2ex}{\reset@font\large\bfseries}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{-3.25ex plus
    -1ex minus-.2ex}{1.5ex plus.2ex}{\reset@font\normalsize\bfseries}}
%- afterskip now is negative so that body does not begins in a new line
\def\paragraph{\@startsection
     {paragraph}{4}{\z@}{3.25ex plus1ex minus.2ex}{-1em}{%
     \reset@font\normalsize\bfseries}}
\def\subparagraph{\@startsection
     {subparagraph}{4}{\parindent}{3.25ex plus1ex minus
     .2ex}{-1em}{\reset@font\normalsize\bfseries}}

%-
%- Appendicies
%-
\newif\if@onappendix \@onappendixfalse   %- We treat them in a special way

\def\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \def\@chapapp{\appendixname}%
  \def\thechapter{\Alph{chapter}}%
  \@onappendixtrue%- yes
}

%----------------------------------------------------------------------
%- SECTION 3: stuff for tables of contents
%----------------------------------------------------------------------

\def\@pnumwidth{1.55em}
\def\@tocrmarg {2.55em}
\def\@dotsep{4.5}
\setcounter{tocdepth}{3}

\def\tableofcontents{\@restonecolfalse
  \if@twocolumn\@restonecoltrue\onecolumn\fi
  \chapter*{\contentsname \@mkboth{\contentsname}{\contentsname}}%
  %- Had to add the next line (VD)
  \addcontentsline{toc}{chapter}{\contentsname}
  \@starttoc{toc}\if@restonecol\twocolumn\fi}

\newcommand*{\l@part}[2]{\ifnum \c@tocdepth >-2\relax
   \addpenalty{-\@highpenalty}%
   \addvspace{2.25em plus\p@}% space above part line
   \begingroup
     \@tempdima 3em
     \parindent \z@ \rightskip \@pnumwidth
     \parfillskip -\@pnumwidth
     {\leavevmode 
      \large\bfseries #1\hfil \hbox to\@pnumwidth{\hss #2}}\par
     \nobreak \global\@nobreaktrue
      \everypar{\global\@nobreakfalse\everypar{}}
   \endgroup \fi}

\newcommand{\l@chapter}[2]{\ifnum \c@tocdepth >\m@ne
   \addpenalty{-\@highpenalty}%
   \vskip 1.0em plus\p@
   \@tempdima 1.5em
   \begingroup
     \parindent \z@ \rightskip \@pnumwidth
     \parfillskip -\@pnumwidth
     \leavevmode \bfseries
     \advance\leftskip\@tempdima
     \hskip -\leftskip
     #1\nobreak\hfil \nobreak\hbox to\@pnumwidth{\hss #2}\par
     \penalty\@highpenalty
   \endgroup \fi}

\def\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\def\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\def\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\def\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\def\l@subparagraph{\@dottedtocline{5}{12em}{6em}}


%----------------------------------------------------------------------
%- SECTION 4: standard environments & some new/modified ones (abstract,
%-            acknowledgement, dedication, bibliography)
%----------------------------------------------------------------------

%- Footnotes
\def\footnoterule{\kern-3\p@
  \hrule width .4\columnwidth
  \kern 2.6\p@}
\@addtoreset{footnote}{chapter}
\long\def\@makefntext#1{\parindent 1em\noindent
            \hbox to1.8em{\hss$\m@th^{\@thefnmark}$}#1}

%- Verse
\def\verse{\let\\=\@centercr
  \list{}{\itemsep\z@ \itemindent -1.5em\listparindent \itemindent
          \rightmargin\leftmargin\advance\leftmargin 1.5em}\item[]}
\let\endverse\endlist

%- Quotation
\def\quotation{\list{}{\listparindent 1.5em%
    \itemindent\listparindent
    \rightmargin\leftmargin \parsep \z@ plus\p@}\item[]}
\let\endquotation=\endlist

%- Quote
\def\quote{\list{}{\rightmargin\leftmargin}\item[]}
\let\endquote=\endlist

%- Here is how we should normally define them (i.e. not with \def)
\newcommand{\descriptionlabel}[1]{\hspace\labelsep \normalfont\bfseries #1}
\newenvironment{description}{\list{}{\labelwidth\z@ \itemindent-\leftmargin
     \let\makelabel\descriptionlabel}}{\endlist}

%- This should be useless normally
\def\titlepage{\@restonecolfalse \newpage \thispagestyle{empty}
  \if@compatibility \setcounter{page}{0} \else \setcounter{page}{1} \fi}
\def\endtitlepage{\newpage \setcounter{page}{1}}

%- Abstract
\newenvironment{abstract}{\newpage
  \thispagestyle{plain}
  \addcontentsline{toc}{chapter}{Abstract}  %- Have to add it
  %- \setcounter{page}{0}
  %- \supervisor is defined below
  \noindent {\bf Supervisor:} \the\supervisor \vskip.5in minus.2in
  \begin{center}%
    {\normalsize\bf \abstractname\vspace{\z@}}%
    \vskip1em minus.5em
  \end{center}}%
  {\newpage \noindent {\bf Examiners:} \vskip1in \makecommittee\eject}

%- Acknowledgement
\newenvironment{acknowledgement}{\newpage
  \thispagestyle{plain}
  \addcontentsline{toc}{chapter}{\ackname}  %- Have to add it
  \rightline{\LARGE\bfseries\itshape \ackname}%
  \vskip2em minus.5em}%
  {}

%- Dedication
\newenvironment{dedication}{\newpage
  \thispagestyle{plain}
  \addcontentsline{toc}{chapter}{\dedicname}  %- Have to add it
  \rightline{\LARGE\bfseries\itshape \dedicname}%
  \vskip2em minus.5em}%
  {}

%- Notation
\newenvironment{notation}{\newpage
  \thispagestyle{plain}
  \chapter*{\notname \@mkboth{\notname}{\notname}}
  \addcontentsline{toc}{chapter}{\notname}}  %- Have to add it
  {}

%- Bibliography
%-      Redefine @biblabel - from latex.tex - with \hfill in the front
%-      Also, use reduced spacing
\def\@biblabel#1{\hfill[#1]}
\newdimen\bibindent
\bibindent=1.5em

\def\thebibliography#1{\chapter*{\bibname\@mkboth{\bibname}{\bibname}}
  \addcontentsline{toc}{chapter}{\bibname}
  \baselineskip 1.1\pure@baselineskip %- Single space needed
  \list
  {\@biblabel{\arabic{enumiv}}}{\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \if@openbib
       \advance\leftmargin\bibindent
       \itemindent -\bibindent
       \listparindent \itemindent
       \parsep \z@
    \fi
    \itemsep 4.5\p@ plus.5\p@ minus1\p@ %- Make good space between entries
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \def\theenumiv{\arabic{enumiv}}}%
    \if@openbib
      \renewcommand{\newblock}{\par}
    \else
      \renewcommand{\newblock}{\hskip .11em plus.33em minus.07em}%
    \fi
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=\@m%
}
\newcommand{\newblock}{}%- No idea what it does!
\def\endthebibliography{%
  \def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
  \endlist%
  %- So that after bibliography ends, no headers are affected
  %- Removed!
  %- \@mkboth{}{}
}

%- Index
\def\theindex{\@restonecoltrue\if@twocolumn\@restonecolfalse\fi
  \columnseprule \z@
  \columnsep 35\p@\twocolumn[\@makeschapterhead{\indexname}]%
  \@mkboth{\indexname}{\indexname}%
  \thispagestyle{plain}\parindent\z@
  \parskip\z@ plus .3\p@\relax\let\item\@idxitem}
\def\endtheindex{\if@restonecol\onecolumn\else\clearpage\fi}
\def\@idxitem{\par\hangindent 40\p@}
\def\subitem{\par\hangindent 40\p@ \hspace*{20\p@}}
\def\subsubitem{\par\hangindent 40\p@ \hspace*{30\p@}}
\def\indexspace{\par \vskip 10\p@ plus5\p@ minus3\p@\relax}

%- Figures
\newcounter{figure}[chapter]
\def\thefigure{\thechapter.\@arabic\c@figure}

\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}

\def\figure{\@float{figure}} \let\endfigure\end@float
\@namedef{figure*}{\@dblfloat{figure}} \@namedef{endfigure*}{\end@dblfloat}

\def\listoffigures{\@restonecolfalse
  \if@twocolumn\@restonecoltrue\onecolumn\fi
  \chapter*{\listfigurename\@mkboth{\listfigurename}{\listfigurename}}
  %- Had to add it (VD)
  \addcontentsline{toc}{chapter}{\listfigurename}
  \@starttoc{lof}\if@restonecol\twocolumn\fi}
\def\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}

%- Tables
\newcounter{table}[chapter]
\def\thetable{\thechapter.\@arabic\c@table}

\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}

\def\table{\@float{table}} \let\endtable\end@float
\@namedef{table*}{\@dblfloat{table}} \@namedef{endtable*}{\end@dblfloat}

\def\listoftables{\@restonecolfalse
  \if@twocolumn\@restonecoltrue\onecolumn\fi
  \chapter*{\listtablename\@mkboth{\listtablename}{\listtablename}}
  %- Had to add it (VD)
  \addcontentsline{toc}{chapter}{\listtablename}
  \@starttoc{lot}\if@restonecol
  \twocolumn\fi}
\let\l@table\l@figure

%----------------------------------------------------------------------
%- SECTION 5: Hacks. For captions, section titles
%----------------------------------------------------------------------

%- 
%- Captions
%-
%- Bold captions, no `:', italics. (VD)
%-
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \setbox\@tempboxa\hbox{{\normalfont\bfseries #1.}\hskip.6em% 
                         {\normalfont\itshape #2}}%
  \ifdim \wd\@tempboxa >\hsize
     {\normalfont\bfseries #1.}\hskip.6em {\normalfont\itshape #2}\par
  \else
     \global \@minipagefalse
     \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip%
}

%- Changed the contents line to put the type of entity (table/figure/etc) (VD)
\long\def\@caption#1[#2]#3{\par\addcontentsline{\csname
  ext@#1\endcsname}{#1}{\csname #1name\endcsname\ \protect\numberline{\csname
  the#1\endcsname}{\ignorespaces #2}}\begingroup
    \@parboxrestore
    \normalsize
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup}

%-
%- \@sect command
%-
%- Changed a bit (from latex.tex) (VD)
%- Also to take care of Appendix (VD)
%- Section headers info:
%- 1: name, 2: level, 3: indentation of header, 4: beforeskip, 5: afterskip
%- 6: font, 8: header text
%-
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \def\@svsec{}%
  \else 
    \refstepcounter{#1}%
    \edef\@svsec{{\csname the#1\endcsname}\hskip1em}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@       %- If afterskip is positive then normal...
    \begingroup #6\relax
      \@hangfrom{\hskip #3\relax\@svsec}{\interlinepenalty \@M #8\par}
    \endgroup
    \csname #1mark\endcsname{#7}\addcontentsline
        {toc}{#1}{\ifnum #2>\c@secnumdepth\else 
                     \protect\numberline{\csname the#1\endcsname}
                  \fi #7}%
  \else    %- If afterskip < 0, then DO NOT PUT A NEWLINE AFTER THE HEADER
    \def\@svsechd{#6\hskip #3\@svsec #8\csname #1mark\endcsname
      {#7}\addcontentsline
        {toc}{#1}{\ifnum #2>\c@secnumdepth
                  \else \protect\numberline{\csname the#1\endcsname}
                  \fi #7}}
  \fi
  \@xsect{#5}%
}

\mark{{}{}}

\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}

%----------------------------------------------------------------------
%- SECTION 6: New page style
%----------------------------------------------------------------------
%
% Explanation of page styles
% --------------------------
% TeX keeps a list of marks [TeXBook pp.258 - 260] (a list of texts)
% for every page. Marks can be added by anyone. Usually the sectioning
% commands add marks. Now, when TeX bulids a page, it knows the first
% mark and the last mark set in the page, called \firstmark and \botmark,
% and uses them (if needed) to create the headers/footers (output routine).
% LaTeX has the equivalent \rightmark and \leftmark, correspondingly.
% Page styles may use \rightmark and \leftmark inside the \@oddhead etc.
% commands.
% Now, these marks are set by the commands \markright{text} and 
% \markboth{text for LEFT mark}{text for right mark}.
% BUT, the sectioning commands, e.g. \section, DO NOT CALL these marking
% commands directly. They instead call a command named \<sectionname>mark,
% e.g. \sectionmark, \chaptermark. These latter commands are \defined
% INSIDE the PAGE STYLES, capture the marks set by the sectioning commands
% and format the output as desired.
% In addition, there are some commands like e.g. \tableofcontents that
% want to set marks as well, but we may not want them to actually set
% marks (e.g. we do not want a header with "TABLE OF CONTENTS" which would
% be the case if we always print the \botmark and \tableofcontents was
% the last command on the page). Thus, most of these commands do NOT
% call \markboth but a command called `\@mkboth'. Now, INSIDE the PAGE
% STYLES, we \let \@mkboth be (a) \markboth - to allow marks - or 
% (b) \@gobbletwo - to just consume the two arguments and do nothing.
%
%- (VD)

%- Define new page footers for normal and beginning-of-chapter pages.
%- Normally not used (VD)
\newtoks\footline \footline={\hfil}
\newtoks\chapterfootline \chapterfootline={\hfil}

%- New default page style. (VD)
% The twoside case shouldn't occur normally - but we give it for completeness
\if@twoside
  \def\ps@vpage{%
    \let\@mkboth\markboth
    \def\chaptermark##1{\markboth {\ifnum \c@secnumdepth>\m@ne
          {\rmfamily\@chapapp\ \thechapter}. \ \fi ##1}{}}
    \def\appendixmark##1{\markboth {\ifnum \c@secnumdepth>\m@ne
          {\rmfamily\appendixname\ \thechapter}. \ \fi ##1}{}}
    \def\sectionmark##1{\markright {\ifnum \c@secnumdepth >\z@
          {\rmfamily\thesection}. \ \fi ##1}}
    % On even pages (\leftmark used) display the chapter title and
    % on odd pages (\rightmark used) the section.
    \def\@oddhead{\vbox{\hfill%
      {\small\itshape\rightmark\/}\hskip2em\small\bfseries\thepage}}
    \def\@evenhead{\vbox{\noindent\small\bfseries\thepage\hfill}}
    \def\@oddfoot{\the\footline} \let\@evenfoot\@oddfoot}%
\else
  \def\ps@vpage{%
    \let\@mkboth\markboth
    \def\chaptermark##1{\markright {\ifnum \c@secnumdepth>\m@ne
          {\rmfamily\thechapter}. \fi ##1}{}}
    \def\appendixmark##1{\markright {\ifnum \c@secnumdepth>\m@ne
          {\rmfamily\appendixname\ \thechapter} \fi \relax}{}}
    \def\@oddhead{\vbox{\hfill%
      {\small\itshape\rightmark\/}\hskip2em\small\bfseries\thepage}} 
    \let\@evenhead\@oddhead
    \def\@oddfoot{\the\footline} \let\@evenfoot\@oddfoot}%
\fi

%- Used for the first *chapter* pages
\def\ps@vplain{\let\@mkboth\@gobbletwo%- No marks
  \def\@oddhead{\vbox{\hfill{\small\bfseries\thepage}}}  %- Only page number
  \let\@evenhead\@oddhead
  \def\@oddfoot{\the\chapterfootline} \let\@evenfoot\@oddfoot}

%- Redefine plain page style and install vpage as default
\let\ps@plain\ps@vplain
\pagestyle{plain}
\pagestyle{vpage}

%-
%- Here is "headings" just in case someone does not like "vpage".
%- Straight from "report.cls".
%-
\if@twoside
  \def\ps@headings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\chaptermark##1{\markboth {\uppercase{\ifnum \c@secnumdepth >\m@ne
      \@chapapp\ \thechapter. \ \fi ##1}}{}}%
    \def\sectionmark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\z@
          \thesection. \ \fi ##1}}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\chaptermark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\m@ne
            \@chapapp\ \thechapter. \ \fi ##1}}}}
\fi


%----------------------------------------------------------------------
%- SECTION 7: automatic title page construction
%----------------------------------------------------------------------
%- User must call \committemember{<name>} for all his committe members,
%- \prevdegree{<name>} for all his previous degrees, \degree = {<name>} for
%- his current degree, \thesistitle = {<name>} for his thesis title, 
%- \name = {<name>} for his name, and after all that he must say: 
%- \maketitlepage.
%- We also need the supervisor's name for the abstract.

%- Capitalize and lowercase a token. That was tricky!
%- Assuming \newtok\mytok \mytok={foo}, call as e.g. \captoken{mytok}.
\def\captoken#1{\expandafter\uppercase\expandafter{\the\csname #1\endcsname}}
\def\lowtoken#1{\expandafter\lowercase\expandafter{\the\csname #1\endcsname}}

%- Add to a vbox - used for committee members
\def\addvbox#1#2{\setbox\csname #1\endcsname=\vbox{\unvbox\csname #1\endcsname%
\vskip1cm \hbox to14cm{\vrule width14cm height.5pt} %\vskip-2mm%
\hbox to14cm{\hss #2\hss}}}

%- Tokens              %- Default values if user forgets to set them
\newtoks\thesistitle   \thesistitle={You forgot to set your thesistitle}
\newtoks\name          \name={Mr.\ Noname}
\newtoks\degree        \degree={Doctor of Philosophy}   
\newtoks\thesistype    \thesistype={Thesis}        %- maybe Dissertation
\newtoks\supervisor    \supervisor={Unsupervised}  %- For the abstract
\newtoks\department 
  \department={Department of Electrical and Computer Engineering}

%- Hidden below are the \prevdegree, \committeemember commands
\newbox\degreesbox \setbox\degreesbox=\vbox{}
\def\prevdegree#1{\setbox\degreesbox=\vbox{\unvbox\degreesbox%
\vskip1mm\hbox to14cm{\hss #1\hss}}}
\newbox\committeebox \setbox\committeebox=\vbox{}
\def\committeemember#1{\addvbox{committeebox}{#1}}
\def\makecommittee{\centerline{\copy\committeebox}}

\def\maketitlepage{%
\thispagestyle{empty}
\null\vskip-3cm\null\vskip-1cm  %- We need 2 cause latex gobbles the last on
{\baselineskip14pt \parskip0pt \parindent0pt \def\baselinestretch{1}
          \begin{center} {\noindent\bfseries \the\thesistitle} \end{center}
\baselineskip0pt
\vskip1mm \centerline{by}
\vskip5mm \centerline{\the\name}
\vskip1mm \centerline{\box\degreesbox}
\vskip 0pt plus1fil
\vskip4mm \centerline{A \the\thesistype\ Submitted in Partial Fulfillment of 
              the Requirements}
\vskip0mm \centerline{for the Degree of}
\vskip4mm \centerline{\large\scshape\the\degree}
\vskip5mm \centerline{in the \the\department}
\vskip 0pt plus2fil
      \centerline{We accept this \lowtoken{thesistype} as conforming}
\vskip0mm \centerline{to the required standard}
\vskip.5cm \makecommittee
\vskip2mm
\vskip 0pt plus2fil
      \centerline{\copyright ~ \the\name, \the\year}
\vskip3mm \centerline{University of Victoria}
\vskip3mm \centerline{\itshape All rights reserved. This \lowtoken{thesistype}
              may not be reproduced in whole or in part by}
\vskip0mm \centerline{\itshape photocopy or other means, without the permission 
              of the author.}}
\eject
}

%----------------------------------------------------------------------
%- SECTION 8: automatic copyright page construction
%----------------------------------------------------------------------

\def\makecopyrightpage#1{%-
\newpage
\thispagestyle{empty}
\begin{center}
\underline{\large PARTIAL COPYRIGHT LICENSE}
\end{center}
\vspace*{.5in}
I hereby grant the right to lend my \lowtoken{thesistype} to users 
of the University of Victoria Library, and to make single copies only for 
such users or in response to a request from the Library of any other 
university, or similar institution, on its behalf or for one of its users. 
I further agree that permission for extensive copying of this 
\lowtoken{thesistype} for scholarly purposes may be granted by me 
or a member of the University designated by me. It is understood that 
copying or publication of this \lowtoken{thesistype} for financial 
gain shall not be allowed without my written permission.

\vspace{.5in}

\noindent
\setbox0=\hbox{Title of \the\thesistype:\hskip.7em\null}%
\hangindent=\wd0 \hangafter=1 {\box0\scshape\the\thesistitle.\par}

\vspace{1in}

\begin{flushleft}
\noindent\hbox to.6in{Author:\hfil} \rule{3.5in}{.01in} \\
\hskip.7in \captoken{name} \\
\hskip.7in #1 \\
\end{flushleft}
\eject
}

%----------------------------------------------------------------------
%- SECTION 9: automatic withhold page construction
%----------------------------------------------------------------------

\def\makewithholdpage#1{%-  Needs the date as argument
\newpage
\thispagestyle{empty}
\begin{center}
\underline{\captoken{thesistype} WITHHOLDING FORM}
\end{center}
\vspace*{.5in}
At our request, the commencement of the period for which the partial
licence shall operate shall be delayed from #1 for a period of at
least six months.

\vskip1in minus.3in
\begin{flushleft}
\rule{3.5in}{.01in} \\ (Supervisor) \\ \vspace{.4in}
\rule{3.5in}{.01in} \\ (Department Chairman) \\ \vspace{.4in}
\rule{3.5in}{.01in} \\ (Dean of Graduate Studies) \\ \vspace{.4in}
\rule{3.5in}{.01in} \\ (Signature of Author) \\ \vspace{.4in}
\rule{3.5in}{.01in} \\ (Date) \\
\end{flushleft}
\eject
}

%----------------------------------------------------------------------
%- SECTION 10: semi-automatic vita page construction
%----------------------------------------------------------------------


\newcommand{\vita}{%-
  \newpage
  \parindent 0pt
  \parskip 0pt
  \baselineskip 1.1\pure@baselineskip
  \pagestyle{empty}
  \begin{center}
  \underline{\large VITA}
  \end{center}
  \vspace*{.5in}
}

\def\fullinfo#1#2#3#4{\leftline{%-
\tabcolsep 1ex
\hskip -1ex
\begin{tabular}{llll}
{\bfseries\itshape Surname:}        & \hbox to3.5cm{#1\hfil} 
     & {\bfseries\itshape Given Names:}    & #2 \\
{\bfseries\itshape Place of Birth:} & #3                   
     & {\bfseries\itshape Date of Birth:} & #4
\end{tabular}
}}

\def\halfinfo#1#2#3{\leftline{%-
\tabcolsep 1ex
\hskip -1ex
\begin{tabular}{llll}
{\bfseries\itshape Surname:}        & \hbox to3.5cm{#1\hfil} 
     & 
     {\bfseries\itshape Given Names:}    & #2 \\
{\bfseries\itshape Place of Birth:} & #3 
\end{tabular}
}}

\newskip\@hsk \@hsk=1.2em

\newenvironment{education}%-
  {\vskip 1.5em{\bfseries\itshape Educational Institutions Attended}\vskip.8em
   \def\entry##1##2{\hskip\@hsk\hbox to11.2cm{##1\hfil}%-
      \hbox to3.5cm{\hfil ##2}\par}}{}
\newenvironment{degrees}%-
  {\vskip 1.5em {\bfseries\itshape Degrees Awarded}\vskip.8em
   \def\entry##1##2##3{\hskip\@hsk\hbox to4.1cm{##1\hfil}%-
      \hbox to 7.1cm{##2\hfil}\hbox to 3.5cm{\hfil ##3}\par}}{}
\newenvironment{awards}%-
  {\vskip 1.5em {\bfseries\itshape Honors and Awards}\vskip.8em
   \def\entry##1##2{\hskip\@hsk\hbox to11.2cm{##1\hfil}%-
      \hbox to3.5cm{\hfil ##2}\par}}{}

\def\pu#1{\vskip 1.5em {\bfseries\itshape #1}\vskip.8em \begin{numlist}}
\newenvironment{jpubs}{\pu{Journal Publications}}{\end{numlist}}
\newenvironment{cpubs}{\pu{Conference Publications}}{\end{numlist}}
\newenvironment{spubs}{\pu{Work Submitted for Publication}}{\end{numlist}}

%----------------------------------------------------------------------
%- SECTION 11: miscallenia
%----------------------------------------------------------------------
%
%- alphalist, numlist, QED and proof (VD)

%- Make chapter equations
\@addtoreset{equation}{chapter}
\def\theequation{\thechapter.\arabic{equation}}

%- Latex2e
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*{\cal}{\@fontswitch{\relax}{\mathcal}}
\DeclareRobustCommand*{\mit}{\@fontswitch{\relax}{\mathnormal}}

%- Two new lists
\newcounter{alphacount}
\newcounter{numcount}
\newenvironment{alphalist}%
  {\begin{list}{\bfseries(\alph{alphacount})}{\usecounter{alphacount}}}{\end{list}}
\newenvironment{numlist}%
  {\begin{list}{\bfseries\arabic{numcount}.}{\usecounter{numcount}}}{\end{list}}

%- Proof environment
\newcommand{\qed}{\hfill\vrule height.7em width.7em depth0pt}
%\newcommand{\qed}{\relax\ifmmode \vrule height.7em width.7em depth0pt%
%       \else\unskip\nobreak\hskip1pc\vrule height.7em width.7em depth0pt\fi}
\newenvironment{proof}{\noindent {\bfseries  Proof.}\ }%
   {\hfill\qed\par\vskip\baselineskip}

%-
%- We start with roman numberals. The first chapter will put it
%- to normal arabic numbering
%- (VD)
\pagenumbering{roman}

\if@twoside\else\raggedbottom\fi %- Ragged bottom may cause underful boxes -VD
\onecolumn                       %- Yeap.

\endinput
