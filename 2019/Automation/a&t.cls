% ���������� � ���� 2011
% �������� �������� ������ � ��������� ������
% ������ KeyWords (����������������)
% ������ PACS (����������������)
% cp1251 � ������������ ����������� ������� �����
% ��������� ������ �����������
% ������ �������������� ������������� ���������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  LaTeX class for preparing papers to "Avtomatika i Telemekhanika"
%%  (under MikTeX 1.2c--2.4 platform)
%%  charset=cp1251
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1998/12/01]
\ProvidesClass{a&t}[2005/05/07 alpha v2.1
LaTeX class for preparing papers to "Avtomatika i Telemekhanika"]
\ClassWarningNoLine{a&t}{This class requires MikTeX 1.2c--2.4}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}


\ProcessOptions
\LoadClass[a4paper]{article} % ����������� �����
\RequirePackage[cp1251]{inputenc} % � ��������� cp1251 (Windows)
\RequirePackage[T2A,OT1]{fontenc} % ������
\RequirePackage[russian]{babel} % �����������
\RequirePackage[leqno]{amsmath} % ����������� ����������� ��� ������� ������
\RequirePackage{amsfonts} % �� �� �����
\RequirePackage{amssymb} % �� �� �����
\RequirePackage{ifthen} % ����������� ����������� ���������� ��������
\RequirePackage{calc} % ����������� ����������� �������������� ��������
\RequirePackage{myruss} % !!! ������������� ����� ���������� (������ ����� ������� ��������)
\RequirePackage{ruslist} % !!! �������
\RequirePackage{verbatim} % ��� ����������� ���������������� ����� ������ \begin{comment} ... \end{comment}
\RequirePackage{160-240} % !!! ������� �����

%%  !!! --- ��� �������� ������������� ������

%%  ����� ������ ������ ������
\sloppy

\setlength\parskip{2\p@ \@plus \p@}

%%  ����� ��������� �������� (��� ������� � ���)
\def\le{\leqslant}
\def\leq{\leqslant}
\def\ge{\geqslant}
\def\geq{\geqslant}

%%  ���������
\renewenvironment{abstract}%
{\vspace{6pt}
\begin{center}
\begin{tabular}{p{0.8\textwidth}}\small}%
{%
\par
\vspace*{1ex}
\hspace{\parindent}{\it �������� �����:}~\@KeyWords
\end{tabular}
\end{center}
\vspace{12pt}
}%

%%  ������ ����������
\def\@biblabel#1{#1.\hfill}
\addto\extrasrussian{%
\def\bibname{\rm\center ������ ����������\small}
\def\refname{\rm\center ������ ����������\small}}

%%  ����������
\newcounter{isappendix}
\setcounter{isappendix}{0}
\def\appendix#1%
{\section*{\hfill\sl �\,�\,�\,�\,�\,�\,�\,�\,�\,�  \ #1}%
\refstepcounter{isappendix}}
\@addtoreset{equation}{isappendix}
\def\theequation%
{{\ifnum \arabic{isappendix} > 0 {\mbox{�.}\arabic{equation}}%
\else{\arabic{equation}}\fi}}

%%  ������� ��� ����������� ���������
\def\year#1{\gdef\@year{#1}} %% ���
\def\authors#1{\gdef\@authors{#1}} %% ������, ����� ������, ���������� ���������, ����� ����������� �����
\def\thanks#1{\gdef\@thanks{#1}} %% ������������� (������ �� ����� � �.�.)
\def\title#1{\gdef\@title{#1}} %% �������� ������
%\def\abstract#1{\gdef\@abstract{\parbox{140mm}{\small$\quad\;\,$#1}}} %% ����� ���������

%%  ���������
\renewcommand{\maketitle}{%
%{\noindent \leftline { PACS~\@PACS
%                             }}\vskip4mm
\begin{center}
\normalsize\bfseries\copyright~\@year~�.\qquad%
\@authors\\[3ex]
\large\bfseries{\@title}\footnote{\@thanks}\\[3ex] %
\normalsize\normalfont
% \vspace*{1ex}
% \@abstract
\end{center}
 }
\def\PACS#1{\gdef\@PACS{#1}}
\def\KeyWords#1{\gdef\@KeyWords{#1}}
\newcommand{\AdditionalInformation}[3]{%
{\hangafter=1%
\parindent=0pt%
\hangindent=5mm%
{#1},~{\it #2\/},~{\tt#3}
\par
}}

%%  ����� ����� ������� ��������
\def\@aftersepkern{\kern-.5em}
\def\postsection{.\@aftersepkern}
\def\postsubsection{.\@aftersepkern}
\def\postsubsubsection{.\@aftersepkern}
\def\postparagraph{.\@aftersepkern}
\def\postsubparagraph{.\@aftersepkern}
\def\presection{}
\def\presubsection{}
\def\presubsubsection{}
\def\preparagraph{}
\def\presubparagraph{}
\def\sectioncenterstyle{\centering}
\def\subsectioncenterstyle{\centering}

%%  ����� ����� ������� ������
\def\afterthmseparator{.}
\def\@begintheorem#1#2{%
\setlength{\topsep}{1pt}%
\setlength{\partopsep}{0mm}%
\trivlist\item[\hskip\labelsep{\rm
#1\ #2\unskip\afterthmseparator}]\itshape}
\def\@opargbegintheorem#1#2#3{%
\setlength{\topsep}{1pt}%
\setlength{\partopsep}{0mm}%
\trivlist\item[\hskip\labelsep{\rm
#1\ #2\ {\rm{#3}}\afterthmseparator}]\itshape}

%%  ������
\renewcommand\section{\@startsection{section}{1}{\z@}%
{18\p@ \@plus 4\p@ \@minus 4\p@}%
{8\p@ \@plus 2\p@ \@minus 1\p@}%
{\normalfont\normalsize\center\bfseries\boldmath}}

%%  ���������
\renewcommand\subsection{\@startsection{subsection}{2}{\parindent}%
{18\p@ \@plus 4\p@ \@minus 4\p@}%
{4\p@ \@plus 2\p@ \@minus 1\p@}%
{\normalfont\normalsize\center\itshape}}

%%  �������
\newtheorem{theorem}{\hspace{\parindent}\sl{�\,�\,�\,�\,�\,�\,�\,}}

%%  ���������
\newtheorem{corollary}{\hspace{\parindent}\sl{�\,�\,�\,�\,�\,�\,�\,�\,�\,}}

%%  �����
\newtheorem{lemma}{\hspace{\parindent}\sl{�\,�\,�\,�\,�\,}}

%%  �����������
\newtheorem{statement}{\hspace{\parindent}\sl{�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,}}

%%  �����������
\newtheorem{proposition}{\hspace{\parindent}\sl{�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,}}

%%  ��������
%\newtheorem{algorithm}{\hspace{\parindent}\sl{�\,�\,�\,�\,�\,�\,�\,�\,}}

%%  �����������
\newtheorem{definition}{\hspace{\parindent}\sl{�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,}}

%%  ������
\newtheorem{problem}{\hspace{\parindent}\sl{�\,�\,�\,�\,�\,�\,}}

%%  ��������������
\newenvironment{proof}
{\vspace{1pt}\par{\sl%
�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�.\,\ }}%
{\noindent\vspace{1pt}}

%%  �������������� �������
\newenvironment{proofoftheorem}[1]
{\vspace{1pt}\par{\sl%
�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\, �\,�\,�\,�\,�\,�\,�\, #1.}}%
{\noindent\vspace{1pt}}

%%  �������������� ���������
\newenvironment{proofofcorollary}[1]
{\vspace{1pt}\par{\sl%
�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\, �\,�\,�\,�\,�\,�\,�\,�\,�\, #1.}}%
{\noindent\vspace{1pt}}

%%  �������������� �����
\newenvironment{proofoflemma}[1]
{\vspace{1pt}\par{\sl%
�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\, �\,�\,�\,�\,�\, #1.}}%
{\noindent\vspace{1pt}}

%%  �������������� �����������
\newenvironment{proofofstatement}[1]
{\vspace{1pt}\par{\sl%
�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\, �\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\, #1.}}%
{\noindent\vspace{1pt}}

%%  �������������� �����������
\newenvironment{proofofproposition}[1]
{\vspace{1pt}\par{\sl%
�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\, �\,�\,�\,�\,�\,�\,�\,�\,�\,�\,�\, #1.}}%
{\noindent\vspace{1pt}}

%%  ��������
\newtheorem{alg}{\hspace{\parindent}\sl{�\,�\,�\,�\,�\,�\,�\,�\,}}%
\newenvironment{algorithm}[1][\unskip]{\begin{alg}[#1]\em}{\end{alg}}%
\def\thealgorithm{\thealg}

%%  ���������
\newtheorem{rem}{\hspace{\parindent}\sl{�\,�\,�\,�\,�\,�\,�\,�\,�}}%
\newenvironment{remark}[1][\unskip]{\begin{rem}[#1]\em}{\end{rem}}%
\def\theremark{\therem}

%%  ������
\newtheorem{exmpl}{\hspace{\parindent}\sl{�\,�\,�\,�\,�\,�\,}}%
\newenvironment{example}[1][\unskip]{\begin{exmpl}[#1]\em}{\end{exmpl}}%
\def\theexample{\theexmpl}


%%  ������ �� ������� �������
\def\itemref#1{{\rm\ref{#1})}}

%%  � ��������� multline �����=0
\multlinegap=0pt

\endinput
