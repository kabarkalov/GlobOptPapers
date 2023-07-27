% Стилевой файл для оформления статей 
% в серию "Вычислительная математика информатика"
% научного журнала "Вестник Южно-Уральского государственного университета"
% E-mail для вопросов и предложений: vestnikvmi@gmail.com

% TODO: подписи к таблице (выравнивание влево в одну строку)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cmi}
\LoadClass[twoside, 11pt, a4paper]{article}

% --- кодировка и язык ---
\usepackage[T1,T2A]{fontenc} % загружает кодировки шрифтов, T1 для латиницы и T2A для кириллицы
\usepackage[utf8]{inputenc} % загружает кодировку UTF-8
\usepackage[english, main=russian]{babel} % загружает поддержку языков
\usepackage[unicode=true,linktocpage=true]{hyperref}
%\usepackage[none]{hyphenat}
%\usepackage{textcomp}
\usepackage{mmap} % Включает CMap-таблицу в русскоязычный PDF, чтобы функции поиска и копирования работали правильно
\usepackage{array}
\usepackage{ragged2e}
\usepackage{translations}

% --- размеры шрифтов ---
\renewcommand{\large}{\fontsize{16pt}{19.6pt}\selectfont}{\bf} % заголовок статьи, заголовок 1
\renewcommand{\large}{\fontsize{12pt}{16.8pt}\selectfont} % авторы, заголовок 2, заголовок 3
\renewcommand{\footnotesize}{\fontsize{9pt}{12.6pt}\selectfont} % аннотация, сноски
\renewcommand{\normalsize}{\fontsize{11pt}{15.4pt}\selectfont} % основной текст, подписи к рисункам и таблицам, список литературы, сведения о грантах
\renewcommand{\small}{\fontsize{10pt}{14pt}\selectfont} % код

% --- подсчёт количества разных сущностей ---
\usepackage{totcount}
\regtotcounter{table}
\regtotcounter{figure}

% --- картинки ---
\usepackage{graphicx, epstopdf}
\graphicspath{{pic/}}

% --- красная строка в первом абзаце раздела ---
\usepackage{indentfirst}

\usepackage{enumitem, changepage, fancyvrb}

% --- пробелы между ссылками на литературу ---
%\usepackage[space]{cite}

\usepackage{amsfonts, amsmath, amssymb, amsthm}
%\usepackage{showframe} % показывать все поля для отладки стилей

% --- acknowledgements ---
\newcommand\ack[1]{
	\vspace{1em}
	{\it
		#1
		
	}
}

\newcommand\openaccess{%
	\ack{This paper is distributed under the terms of the Creative Commons
		Attribution-Non Commercial 4.0 License which permits non-commercial
		use, reproduction and distribution of the work without further
		permission provided the original work is properly cited.}%
}

% --- нумерованный список с уменьшенными интервалами ---
\let\oldenumerate\enumerate
\let\endoldenumerate\endenumerate
\def\enumerate{% FIXME: add support of optional arguments
	\oldenumerate[topsep=0pt, itemsep=0pt, parsep=0pt, widest=9, leftmargin=7mm]
}
\def\enumerateparen{% FIXME: delete this one if the trick with enumerate works
	\oldenumerate[topsep=0pt, itemsep=0pt, parsep=0pt, label=\arabic*), widest=9, leftmargin=7mm]
}
\let\endenumerateparen\endoldenumerate

%% --- колонтитулы ---
%\newcommand{\ps@vestnikfirst}{
%	% нижние колонтитулы первой страницы
%	\renewcommand{\@oddfoot}{%
%		\vbox{%
%			\phantom{eee}%
%			\hrule%
%			\vskip 4pt%
%			\hbox to \textwidth{%
%				\textbf{2013, т.~2, \No~1}\hfil\thepage%
%			}%
%		}%
%	}
%	\renewcommand{\@evenfoot}{%
%		\vbox{%
%			\phantom{eee}%
%			\hrule%
%			\vskip 4pt%
%			\hbox to \textwidth{%
%				\thepage\hfil\textbf{Вестник ЮУрГУ. Серия <<Вычислительная математика и информатика>>}%
%			}%
%		}%
%	}
%	% верхние колонтитулы первой страницы
%	\renewcommand{\@oddhead}{}
%	\renewcommand{\@evenhead}{}
%}
%
%\newcommand{\ps@vestnik}{
%	\setlength{\textwidth}{161mm}% {ширина текста на странице}
%	% нижние колонтитулы остальных страниц
%	\renewcommand{\@oddfoot}{%
%		\vbox{%
%			\phantom{eee}%
%			\hrule%
%			\vskip 4pt%
%			\hbox to \textwidth{%
%				\textbf{2013, т.~2, \No~1}\hfil\thepage%
%			}%
%		}%
%	}
%	\renewcommand{\@evenfoot}{%
%		\vbox{%
%			\phantom{eee}%
%			\hrule%
%			\vskip 4pt%
%			\hbox to \textwidth{%
%				\thepage\hfil\textbf{Вестник ЮУрГУ. Серия <<Вычислительная математика и информатика>>}%
%			}%
%		}%
%	}
%
%	% верхние колонтитулы остальных страниц
%	\renewcommand{\@oddhead}{%
%		\raisebox{0pt}[\headheight][0pt]{%
%			\vbox{%
%				\hbox to \textwidth{\hfil\small{\textbf{\leftmark}}\hfil}%
%				\vskip 3pt%
%				\hrule%
%			}%
%		}%
%	}
%	\renewcommand{\@evenhead}{%
%		\raisebox{0pt}[\headheight][0pt]{%
%			\vbox{%
%				\hbox to \textwidth{\hfil\small{\textbf{\rightmark}}\hfil}%
%				\vskip 3pt%
%				\hrule%
%			}%
%		}%
%	}
%}

% --- горизонтальная линия, которая не рисуется в начале и конце страницы
\newcommand\rulesep{%
	\par%
	\leaders\vrule width \textwidth\vskip 0.4pt%
	\nointerlineskip
}

%Текущий год
\newcommand{\lasttwoofyear}[1]{% #1 is the offset
	\expandafter\getlasttwo\number\numexpr\year+(#1)\relax\relax
}
\def\getlasttwo#1#2#3#4\relax{#3#4}

%\newcommand{\issuedoi}{0\issue}
%\newcommand{\numdoi}{0\num}

% --- doi ---
%\let\@doi\@empty
%\def\@doi{10.14529/cmse\lasttwoofyear{0}\issuedoi\numdoi}
\newcommand{\@doi}{}
\newcommand{\@novolume}{X}
\newcommand{\@noissue}{Y}
\newcommand{\@nonum}{Z}
\newcommand{\@nopages}{Z1--Z2}

\newcommand{\doi}{%
	\ifdefined\@volume 
		%\newline \@datesattended  % Please use some 'better' setup here
		\@doi{DOI:~10.14529/cmse\lasttwoofyear{0}0\@issue0\@num}\unskip 
	\else
		%\let\@institutionname\relax
		%\let\@datesattended\relax 
		%\let\@degree\relax
		\@doi{DOI:~10.14529/cmse\lasttwoofyear{0}0\@noissue0\@nonum}\unskip 
	\fi
}


\newcommand{\volume}{
	\ifdefined\@volume
		\unskip \@volume
	\else
		\unskip \@novolume
	\fi
}


\newcommand{\issue}{
	\ifdefined\@issue
		\unskip \@issue
	\else
		 \unskip \@noissue
	\fi
}


\newcommand{\pages}{
	\ifdefined\@pages
		\unskip \@pages
	\else
		\unskip \@nopages
	\fi
}

% --- классификация статьи ---
\let\@classification\@empty
\def\classify#1{
	%\def\@classification{#1}
	%\ifx \@classification \@empty% если пустая классификация
	%\vspace{10pt} % то она реально пустая
	%\else%
	%{\large{\begin{flushleft}\textbf{\@classification}\end{flushleft}}}% иначе - пишем её
	%\fi%
	%{\noindent\large\bfseries#1\hfill{}\@doi\par}
	{\noindent\large\bfseries#1\hfill{}\doi\par}
	\vspace{6pt}
}

\def\title#1{
	\begingroup
	\def\thefootnote{\fnsymbol{footnote}} % Установка вида сноски для благодарностей
	{\Large\bf\centering#1\par}
	\endgroup
	\setcounter{footnote}{0} % Сброс счетчика после печати благодарностей
	\vspace{10pt}
}

% Формат списка авторов
\def\authors#1{
	{\emph\large\bf\centering\copyright~\the\year~#1\par}
	\vspace{2pt}
}

\def\authorsen#1{
	{\emph\large\bf\centering\copyright~\the\year~#1\par}
	\vspace{2pt}
}

% Формат списка организаций			#commented by Alex Porozov. This \large makes organisation so big in comparison with word's PDF.
%\def\organizations#1{
%	{\large\centering\it#1\par}
%}

% Формат списка организаций
\def\organizations#1{
	{\normalsize\centering\it#1\par}
}

% Формат списка e-mail адресов #commented by Alex Porozov. This \large makes e-mails so big in comparison with word's PDF.
%\def\emails#1{
%	{\large\centering\it E-mail:~#1\par}
%}

\def\emails#1{
	{\normalsize\centering\it E-mail:~#1\par}
}

% Формат даты поступления в редакцию % Формат списка e-mail адресов #commented by Alex Porozov. This \large makes redaction date so big in comparison with word's PDF.
%\def\redactiondate#1{
%	{\large\centering Поступила~в~редакцию:~#1\par}
%	\vspace{16pt}
%}

\def\redactiondate#1{
	{\normalsize\centering Поступила~в~редакцию:~#1\par}
	\vspace{16pt}
}

% Формат даты поступления в редакцию % Формат списка e-mail адресов #commented by Alex Porozov. This \large makes redaction date so big in comparison with word's PDF.
%\def\redactiondateen#1{
%	{\large\centering Received:~#1\par}
%	\vspace{16pt}
%}

\def\redactiondateen#1{
	{\normalsize\centering Received:~#1\par}
	\vspace{16pt}
}

%Формат образца цитирования
\newcommand\forcitation[1]{
	{\noindent\large\bf ОБРАЗЕЦ~ЦИТИРОВАНИЯ \par}
	{#1~// Вестник ЮУрГУ. Серия: Вычислительная математика и информатика. \the\year. Т.~\volume, №~\issue. С.~\pages. \doi.}
}

\newcommand\forcitationen[1]{
	{\noindent\large\bf FOR~CITATION \par}
	%{#1. \emph{Bulletin of the South Ural State University. Series: Computational Mathematics and Software Engineering.} \the\year. Vol.~\volume, no.~\issue. P.~\pages. (in Russian) \doi.}
	{#1. Bulletin of the South Ural State University. Series: Computational Mathematics and Software Engineering. \the\year. Vol.~\volume, no.~\issue. P.~\pages. (in Russian) \doi.}
}

\newcommand\forcitationenglishdoc[1]{
	{\noindent\large\bf FOR~CITATION \par}
	{#1. \emph{Bulletin of the South Ural State University. Series: Computational Mathematics and Software Engineering.} \the\year. vol.~\volume, no.~\issue. pp.~\pages. \doi.}
}

% верхние и нижние индексы в текстовом режиме
\newcommand{\superscript}[1]{{\footnotesize\raisebox{0.5em}{#1}}}

% --- формат номера раздела ---
\renewcommand{\@seccntformat}[1]{\csname the#1\endcsname.\hspace{0.7em}}

% --- запрет висячих строк ---
\widowpenalty=10000 % внизу абзацев
\clubpenalty=10000 % вверху абзацев

\usepackage{ifthen,latexsym}

\normalsize
\usepackage[margin=2.5cm]{geometry}

% --- маркированный список с уменьшенными интервалами ---
\let\olditemize\itemize
\let\endolditemize\enditemize
\def\itemize{
	\olditemize[topsep=0pt, itemsep=0pt, parsep=0pt]
}

% --- параметры абзаца ---
\parindent=7mm
\parskip=0mm
\leftskip=0mm
\rightskip=0mm

% --- вертикальные отступы в строчных и выносных формулах
\abovedisplayskip=12pt plus 3pt minus 3pt
\belowdisplayskip=12pt plus 3pt minus 3pt
\abovedisplayshortskip=0pt plus 3pt
\belowdisplayshortskip=6pt plus 3pt

\pagestyle{empty}

% --- параметры плавающих объектов
\setcounter{totalnumber}{4}
\setcounter{topnumber}{4}
\setcounter{bottomnumber}{4}
\renewcommand{\textfraction}{0.01}
\renewcommand{\topfraction}{0.99}
\renewcommand{\bottomfraction}{0.99}

\newcommand{\sectspacm}{\hspace*{-\medskipamount}}
\newcommand{\sectspacp}{\hspace*{\medskipamount}}

\renewcommand{\section}{%
	\@startsection{section}{1}{0mm}{0.5\baselineskip}{0.5\baselineskip}{\normalfont\raggedright\Large\bf}%
}

\renewcommand{\subsection}{%
	\@startsection{subsection}{2}{0mm}{0.5\baselineskip}{0.5\baselineskip}{\normalfont\raggedright\large\bf}%
}

\renewcommand{\subsubsection}{%
	\@startsection{subsubsection}{3}{0mm}{-\baselineskip}{0.5\baselineskip}{\normalfont\raggedright\large\it}%
}

% --- теорема ---
\newcounter{theocounter}
\newenvironment{theorem}{%
	\refstepcounter{theocounter}\par\addvspace{3mm}\noindent%
	{\bf Теорема \thetheocounter.\ }%
}{%
	\par\addvspace{3mm}%
}

% --- теорема без номера ---
\newenvironment{theorem*}{%
	\refstepcounter{theocounter}\par\addvspace{3mm}\noindent%
	{\bf Теорема.\ }\begin{it}%
	}{%
	\end{it}\par\addvspace{3mm}
}

% --- лемма ---
\newcounter{lemcounter}
\newenvironment{lemma}{%
	\refstepcounter{lemcounter}\par\addvspace{3mm}\noindent
	{\bf Лемма \thelemcounter.\ }%
}{%
	\par\addvspace{3mm}%
}

% --- замечание ---
\newcounter{remcounter}
\newenvironment{remark}{%
	\refstepcounter{remcounter}\par\addvspace{3mm}\noindent
	{\bf Замечание \theremcounter.\ }%
}{%
	\par\addvspace{3mm}%
}

% --- определение ---
\newcounter{defcounter}
\newenvironment{definition}{%
	\refstepcounter{defcounter}\par\addvspace{3mm}\noindent
	{\bf Определение \thedefcounter.\ }%
}{%
	\par\addvspace{3mm}%
}

% --- пример ---
\newcounter{examcounter}
\newenvironment{example}{%
	\refstepcounter{examcounter}\par\addvspace{3mm}\noindent
	{\bf Пример \theexamcounter.\ }%
}{%
	\par\addvspace{3mm}%
}

% --- предложение ---
\newcounter{propcounter}
\newenvironment{proposition}{%
	\refstepcounter{propcounter}\par\addvspace{3mm}\noindent
	{\bf Утверждение \thepropcounter.\ }%
}{%
	\par\addvspace{3mm}%
}

% --- следствие ---
\newcounter{corcounter}
\newenvironment{corollary}{%
	\refstepcounter{corcounter}\par\addvspace{3mm}\noindent%
	{\bf Следствие \thecorcounter.\ }%
}{%
	\par\addvspace{3mm}%
}

\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\CP}{\mathbb{C}}
\newcommand\Paragraph{\textsection}

\newcommand{\keywords}[1]{%
	{\footnotesize\it Ключевые слова:~#1}%
	\vspace{6pt}
}
\newcommand{\keywordsen}[1]{%
	{\footnotesize\it Keywords:~#1}%
	\vspace{6pt}
}

\renewenvironment{abstract}{%
	\footnotesize%
	\setlength{\parindent}{2em}%
}

\renewcommand\newblock{\hskip .11em plus .33em minus .07em}
\sloppy
\sfcode`\.=1000\relax

% Отступ сверху и снизу от плавающих объектов
\setlength{\intextsep}{1em}
\usepackage{floatrow}
\floatsetup[table]{capposition=top}

\usepackage[labelfont=bf]{caption}
\captionsetup[table]{labelsep = period, singlelinecheck=off}
\captionsetup[figure]{labelsep=period, 
	justification=centering, singlelinecheck=off}
% --- подпись к рисункам и таблицам ---
%\abovecaptionskip=0pt
%\belowcaptionskip=0pt
%\newlength{\@tblwid}
%\setlength{\@tblwid}{10cm}
%\renewcommand{\@makecaption}[2]{%
%	\def\@tabenvname{table}%
%	\ifx\@currenvir\@tabenvname%
%	% we're in a table environment
%	\vspace{\abovecaptionskip}%
%		\centering\parbox{\@tblwid}{%
%			{\flushleft\textbf{#1.} #2\par\vspace{2mm}}%
%		}
%	\vspace{\belowcaptionskip}%
%	\else%
%	% we're in a figure environment
%	\vspace{\abovecaptionskip}%
%	\sbox{\@tempboxa}{{#1. #2}}%
%	\ifdim \wd\@tempboxa >\hsize%
%	{\textbf{\small\ifthenelse{\totvalue{figure} > 1}{#1.}{\figurename}} #2}%
%	\else%
%	\global\@minipagefalse%
%	\hbox to \hsize {\textbf{\small\hfil\ifthenelse{\totvalue{figure} > 1}{#1.}{\figurename}} #2 \hfil}%
%	\fi%
%	\vspace{\belowcaptionskip}%
%	\fi%
%}

% --- таблица ---
%\newcommand{\tabref}[1]{табл.~\ref{#1}} % быстрая ссылка на таблицу
%\newsavebox{\@tblbox}
%\newcommand{\tab}[3]{% label, caption, data
%	\begin{table}[h]%
%		\sbox{\@tblbox}{#3}% сохранить таблицу в бокс
%		\settowidth{\@tblwid}{\usebox{\@tblbox}}% измерить ширину полученного бокса
%		\caption{#2}%
%		\label{#1}%
%		\centering%
%		\usebox{\@tblbox}% собственно напечатать таблицу
%	\end{table}%
%}

% --- рисунок ---
%\newcommand{\figref}[1]{рис.~\ref{#1}} % быстрая ссылка на рисунок
%\newcommand{\fig}[3]{% params, label, caption
%	\begin{figure}[h]%
%		\centering%
%		\includegraphics[#1]{#2}%
%		\caption{#3}%
%		\label{#2}%
%	\end{figure}%
%}

% --- исходный код ---
\newcommand{\code}[4][\linewidth]{% width, params, label, caption
	\begin{figure}[h]%
		\centering%
		\topsep=0pt%
		\partopsep=0pt%
		\begin{minipage}{#1}
			{
				\small\VerbatimInput[#2]{#3}
				
			}%
		\end{minipage}
		\vskip 3pt
		\caption{#4}%
		\label{#3}%
	\end{figure}%
}

% --- исходный код без номера ---
\newcommand{\codenonum}[3]{% params, label, caption
	\begin{figure}[h]%
		\centering%
		\topsep=0pt%
		\partopsep=0pt%
		\begin{minipage}{\linewidth}
			{
				\small\VerbatimInput[#1]{#2}
				
			}%
		\end{minipage}
		\vskip 3pt
		#3%
		\label{#2}%
	\end{figure}%
}

% --- неплавающий рисунок
\newcommand{\fignofloat}[3]{% params, label, caption
	\center%
	\includegraphics[#1]{#2}%
	\caption{#3}%
	\label{#2}%
}

\newcommand{\MakeUppercaseWithNewline}[1]{%
	\begingroup
	\let\SavedOrgNewline\\%
	\DeclareRobustCommand{\\}{\SavedOrgNewline}%
	\MakeTextUppercase{#1}%
	\endgroup
}

\renewcommand\@makefntext[1]{%
	\noindent\@makefnmark #1%
}

% vim: syntax=tex

% список литературы
\newenvironment{biblio}[1][9]{% \begin{biblio}[maxval] ...
	\renewcommand{\refname}{Литература}%
	\begin{thebibliography}{#1}%
		\itemsep 0pt%
	}{%
	\end{thebibliography}%
	\vspace{11pt}
}

\newenvironment{biblio_lat}[1][9]{% 
	\renewcommand{\refname}{References}%
	\begin{thebibliography}{#1}%
		\itemsep 0pt%
	}{%
	\end{thebibliography}%
}
\renewcommand{\@biblabel}[1]{#1.} % Формат списка литературы


\usepackage[style=gost-numeric, % стиль цитирования и библиографии (по ГОСТ)
backend=biber, % движок
bibencoding=utf8, % кодировка bib файла
language=auto, % получение языка из babel/polyglossia
hyperref=auto,
autolang=other, % многоязычная библиография
sorting=none, % настройка сортировки списка литературы
defernumbers=true, % нумерация проставляется после двух компиляций, зато позволяет выцеплять библиографию по ключевым словам и нумеровать не из большего списка
maxnames=4,
minnames=3,
movenames=false, % не менять местами заголовок и список авторов, если авторов больше четырех
isbn=false % показывать или нет ISBN, ISSN, ISRN
]{biblatex}
\usepackage{csquotes}

\makeatletter
\newcommand*{\bibnocite}[1]{%
	\blx@xsanitizeafter{\forcsvlist\bibnocite@do}{#1}}

\newcommand*{\bibnocite@do}[1]{%
	\nocite{#1:TR}}
\makeatother

\newcommand{\bblcite}[1]{\cite{#1}\bibnocite{#1}}


\newcommand{\addbblresources}[2]{
	\addbibresource{#1}
	\addbibresource{#2}
	
	%модификация bib файла перед тем, как им займётся biblatex
	\DeclareSourcemap{
		\maps[datatype=bibtex]{
			\map[overwrite]{ % стираем ключевые слова
				\step[fieldsource=keywords]
				\step[fieldset=keywords,null]
			}
			\map[overwrite]{
				\perdatasource{#1}
				\step[fieldset=keywords, fieldvalue={,bibliography-ru}, append]
			}
			\map[overwrite]{
				\perdatasource{#2}
				\step[fieldset=keywords, fieldvalue={,bibliography-en}, append]
			}
			\map{% перекидываем значения полей language в поля langid, которыми пользуется biblatex
				\step[fieldsource=language, fieldset=langid, origfieldval, final]
				\step[fieldset=language, null]
			}
			\map[overwrite]{ % переделка формата записи даты
				\step[fieldsource=urldate, match=\regexp{([0-9]{2})\.([0-9]{2})\.([0-9]{4})}, replace={$3-$2-$1$4}, final]
			}
			\map[overwrite]{% стираем значения всех полей abstract
				\step[fieldsource=abstract]
				\step[fieldset=abstract,null]
			}
		}
	}
}


\newcommand{\addbblresourcesen}[2]{
	\addbibresource{#1}
	\addbibresource{#2}
	
	%модификация bib файла перед тем, как им займётся biblatex
	\DeclareSourcemap{
		\maps[datatype=bibtex]{
			\map[overwrite]{ % стираем ключевые слова
				\step[fieldsource=keywords]
				\step[fieldset=keywords,null]
			}
			\map[overwrite]{
				\perdatasource{#2}
				\step[fieldset=keywords, fieldvalue={,bibliography-ru}, append]
			}
			\map[overwrite]{
				\perdatasource{#1}
				\step[fieldset=keywords, fieldvalue={,bibliography-en}, append]
			}
			\map{% перекидываем значения полей language в поля langid, которыми пользуется biblatex
				\step[fieldsource=language, fieldset=langid, origfieldval, final]
				\step[fieldset=language, null]
			}
			\map[overwrite]{ % переделка формата записи даты
				\step[fieldsource=urldate, match=\regexp{([0-9]{2})\.([0-9]{2})\.([0-9]{4})}, replace={$3-$2-$1$4}, final]
			}
			\map[overwrite]{% стираем значения всех полей abstract
				\step[fieldsource=abstract]
				\step[fieldset=abstract,null]
			}
		}
	}
}

% Убрать тире из разделителей элементов в библиографии
\renewcommand*{\newblockpunct}{%
	\addperiod\space\bibsentence}

% Изменение точки с запятой на запятую в перечислении библиографических ссылок
\renewcommand*{\multicitedelim}{\addcomma\space}

\renewcommand*{\mkgostheading}[1]{#1} % только лишь убираем курсив с авторов

% Убираем неразрывные пробелы перед двоеточием и точкой с запятой %%%
\makeatletter
\renewcommand*{\addcolondelim}{%
	\begingroup%
	\def\abx@colon{%
		\ifdim\lastkern>\z@\unkern\fi%
		\abx@puncthook{:}\space}%
	\addcolon%
	\endgroup}

\renewcommand*{\addsemicolondelim}{%
	\begingroup%
	\def\abx@semicolon{%
		\ifdim\lastkern>\z@\unkern\fi%
		\abx@puncthook{;}\space}%
	\addsemicolon%
	\endgroup}
\makeatother


\DefineBibliographyStrings{english}{%
	pages = {p\adddot},
	urlseen = {accessed},
	andothers = {\emph{et al.}}
}

\DefineBibliographyStrings{russian}{%
	jourvol = {Т\adddot},
	pages = {C\adddot},
	urlseen = {дата обращения}
}

\renewbibmacro*{name:andothers}{%
	\ifboolexpr{
		test {\ifnumequal{\value{listcount}}{\value{liststop}}}
		and
		test \ifmorenames
	}
	{\ifnumgreater{\value{liststop}}{1}
		{\finalandcomma}
		{}%
		\andothersdelim\bibstring{andothers}}
	{}}

\renewcommand*{\bibinitdelim}{}

% print url if no doi
\renewbibmacro*{doi+eprint+url+note}{%
	\iffieldundef{doi}{%
	}{
		\printfield{note}
		%\setunit*{\space}%
		\printfield{doi}%
		%\setunit*{\space}%
		%\printfield{note}
		\newunit\newblock%
	}
	\iftoggle{bbx:eprint}{%
		\usebibmacro{eprint}%
	}{}%
	\newunit\newblock%
	\iffieldundef{doi}{%
		\usebibmacro{url+urldate+note}}%
	{}%
}

\renewbibmacro*{url+urldate+note}{%
	\ifboolexpr{
		test {\ifentrytype{online}}
		or
		( test \ifcitation
		and
		togl {cbx:url}
		)
		or
		( not test \ifcitation
		and
		togl {bbx:url}
		)
	}
	{\usebibmacro{url+urldate}}
	{}%
	%\setunit*{\addsemicolondelim}%
	\setunit*{\space}%
	\printfield{note}
}

% изменение оформления серии (убраны скобки вокруг серии) у периодических изданиях 
\renewbibmacro*{series+number}{%
	\iffieldundef{series}
	{}
	{\printtext{%
			\printfield{series}%
			\setunit*{\addsemicolondelim}%
			\printfield[seriesnumber]{number}}}}
		

\DeclareFieldFormat[book]{pages}{\mkpageprefixbook[bookpagination]{#1}}

\makeatletter
\blx@regimcs{%
	\mkpageprefixbook
}

\newrobustcmd*{\blx@imc@mkpageprefixbook}[1][pagination]{%
	\begingroup
	\def\blx@tempa{\blx@mkpageprefixbook{page}}%
	\iffieldundef{#1}
	{}
	{\iffieldequalstr{#1}{none}
		{\def\blx@tempa{\blx@mkpageprefix@i}}
		{\iffieldbibstring{#1}
			{\edef\blx@tempa{\blx@mkpageprefixbook{\thefield{#1}}}}
			{\blx@warning@entry{%
					Unknown pagination type '\strfield{#1}'}}}}%
	\@ifnextchar[%]
	{\blx@tempa}
	{\blx@tempa[\@firstofone]}}

\protected\long\def\blx@mkpageprefixbook#1[#2]#3{%
	\blx@mkpageprefix@i[{#2}]{#3}
	\ifnumeral{#3}
	{\bibstring{#1}\ppspace}
	{\ifnumerals{#3}
		{\bibstring{#1s}\ppspace}
		{\def\pno{\bibstring{#1}}%
			\def\ppno{\bibstring{#1s}}}}%
}
\makeatother


\DeclareFieldFormat{urldate}{%
	\mkbibparens{\bibstring{urlseen}\addcolon\space{\thefield{urlday}\adddot
			\thefield{urlmonth}\adddot
			\thefield{urlyear}}}}
		
\DeclareTextSymbolDefault{\CYRL}{T2A}
\DeclareTextSymbolDefault{\cyri}{T2A}
\DeclareTextSymbolDefault{\cyrt}{T2A}
\DeclareTextSymbolDefault{\cyre}{T2A}
\DeclareTextSymbolDefault{\cyrr}{T2A}
\DeclareTextSymbolDefault{\cyra}{T2A}
\DeclareTextSymbolDefault{\cyrt}{T2A}
\DeclareTextSymbolDefault{\cyru}{T2A}
\DeclareTextSymbolDefault{\cyrr}{T2A}
\DeclareTextSymbolDefault{\cyra}{T2A}

\newcommand{\bibtitleru}{Литература}
\newcommand{\bibtitleen}{References}

\newcommand*{\insertbiblio}{
	\selectlanguage{english}
	\printbibliography[title=\bibtitleru, keyword={bibliography-ru}, resetnumbers]
	\selectlanguage{russian}
}

\newcommand*{\insertbiblioen}{
	\selectlanguage{english}
	\begingroup\renewbibmacro*{//}{.}
	\printbibliography[title=\bibtitleen, keyword={bibliography-en}, resetnumbers]
	\endgroup
}
