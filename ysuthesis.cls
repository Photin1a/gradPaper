%% This is file `ysuthesis.cls',
%% generated with the docstrip utility.
%%
%% -----------------------------------
%%
%% This is a generated file.
%%
%% Copyright (C) 2024 by Guangjun Tan and Zhanyou Ma
%%
%% The Current Maintainer of this work is Guangjun Tan and Zhanyou Ma

\ProvidesClass{ysuthesis}[2024/09/01 v1.0 Thesis Template for Yanshan University]

\LoadClass[a4paper,12pt,twoside,onecolumn,openany]{ctexbook}

\RequirePackage{amsmath,amsfonts,amsthm,amssymb,amsbsy,mathrsfs}
\RequirePackage{bm,booktabs,graphicx,xcolor,makecell,fancyhdr,titletoc,microtype,setspace,hyperref,cleveref,longtable,natbib,enumitem,newtxmath}
\RequirePackage[labelsep=none,font=small,subrefformat=parens]{subcaption}
\RequirePackage{bicaption}
\RequirePackage[left=2.8cm, right=2.8cm, top=3.25cm, bottom=3.17cm,headsep=0.89cm,marginparsep=0pt,footskip=0.6cm]{geometry}
\RequirePackage[sort&compress]{gbt7714}
\citestyle{numbers}

\hypersetup{CJKbookmarks,%
	bookmarksnumbered,%
	colorlinks,%
	linkcolor=black,%
	citecolor=black,%
	plainpages=false,%
	pdfstartview=FitH}

\setmainfont{Times New Roman}
\setCJKmainfont{SimSun}

\newCJKfontfamily{\songtib}[AutoFakeBold={3.17}]{SimSun}
\newCJKfontfamily{\heitib}[AutoFakeBold={3.17}]{SimHei}

\bibliographystyle{shixiong}
\renewcommand{\bibfont}{\zihao{5}}
\setlength{\bibsep}{0pt}

\captionsetup{labelsep=quad,font=small}
\bicaptionsetup[figure]{}{name=Fig.}
\bicaptionsetup[table]{}{name=Table}

\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\renewcommand{\theequation}{\thechapter-\arabic{equation}}

\newcolumntype{C}{>{\small}c}
\newcolumntype{L}{>{\small}l}
\newcolumntype{R}{>{\small}r}

\setlength{\heavyrulewidth}{1.5pt}
\setlength{\lightrulewidth}{1pt}

\renewcommand{\thefootnote}{\textcircled{\arabic{footnote}}}
\renewcommand{\footnotesize}{\zihao{5}}

\newif\if@ismaster
\newif\if@isdoctor
\DeclareOption{master}{\@ismastertrue\@isdoctorfalse}
\DeclareOption{doctor}{\@isdoctortrue\@ismasterfalse}
\@ismastertrue

\newif\if@isacademic
\newif\if@isprofessional
\DeclareOption{academic}{\@isacademictrue\@isprofessionalfalse}
\DeclareOption{professional}{\@isprofessionaltrue\@isacademicfalse}
\@isacademictrue

\ProcessOptions\relax

\def\title#1#2{\def\@ctitle{#1}\def\@etitle{#2}}
\def\author#1#2{\def\@cauthor{#1}\def\@eauthor{#2}}
\def\school#1#2{\def\@cschool{#1}\def\@eschool{#2}}
\def\subject#1#2{\def\@csubject{#1}\def\@esubject{#2}}
\def\applydegree#1#2{\def\@capplydegree{#1}\def\@eapplydegree{#2}}
\def\supervisor#1#2#3#4{\def\@csupervisorname{#1}\def\@csupervisortitle{#2}\def\@esupervisorname{#3}\def\@esupervisortitle{#4}}
\def\date#1#2{\def\@cdate{#1}\def\@edate{#2}}
\def\bookclassificationnumber#1#2{\def\@CLCnumber{#1}\def\@UDCnumber{#2}}
\def\security#1{\def\@security{#1}}
\def\researchtype#1{\def\@researchtype{#1}}
\def\upcite#1{\textsuperscript{\cite{#1}}}

\if@ismaster
\newcommand{\cdegree}{硕}
\newcommand{\edegree}{Master}
\newcommand{\adjectiveedegree}{MASTER'S}
\fi

\if@isdoctor
\newcommand{\cdegree}{博}
\newcommand{\edegree}{Doctor}
\newcommand{\adjectiveedegree}{DOCTORAL}
\fi

\if@isacademic
\newcommand{\degreetype}{学术}
\newcommand{\degreetypewithspace}{学~ 术}
\newcommand{\researchtypebrace}{\phantom{（\@researchtype）}}
\def\assosupervisor#1#2#3#4{\def\@cassosupervisorname{}\def\@cassosupervisortitle{}\def\@eassosupervisorname{}\def\@eassosupervisortitle{}}\def\@cassosupervisorname{}\def\@cassosupervisortitle{}\def\@eassosupervisorname{}\def\@eassosupervisortitle{}
\fi

\if@isprofessional
\newcommand{\degreetype}{专业}
\newcommand{\degreetypewithspace}{专~ 业}
\newcommand{\researchtypebrace}{（\@researchtype）}
\def\assosupervisor#1#2#3#4{\def\@cassosupervisorname{\zihao{4}\heiti 副 \hfill 导 \hfill 师 & \zihao{4}\songti #1}\def\@cassosupervisortitle{\quad #2\\}\def\@eassosupervisorname{#3}\def\@eassosupervisortitle{Assistant Supervisor: #4 }}\def\@cassosupervisorname{}\def\@cassosupervisortitle{}\def\@eassosupervisorname{}\def\@eassosupervisortitle{}
\fi

\fancyhf{}

\renewcommand{\headrule}{%
	{\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
		\hrule\@height 1.5pt
		\vskip 0.7pt
		\hrule\@height 0.75pt
		\vskip-2\headrulewidth\vskip-1pt}
}

\fancyfoot[C]{\zihao{-5}-~\thepage~-}

\pagestyle{fancy}

\ctexset{
	chapter={format=\centering\zihao{-2}\heiti,pagestyle=fancy,number=\arabic{chapter},beforeskip=3pt,afterskip=24.2pt},
	section={format=\raggedright\zihao{-3}\heiti,beforeskip=13.6pt,afterskip=11.7pt},
	subsection={format=\raggedright\zihao{4}\heiti,beforeskip=16pt,afterskip=11.1pt}
}

\dottedcontents{chapter}[4.1em]{\heiti}{4em}{0.3pc}
\dottedcontents{section}[3.35em]{}{2.0em}{0.3pc}
\dottedcontents{subsection}[4.9em]{}{2.8em}{0.3pc}

\newcommand{\cabstract}[1]{
	\newpage
	\thispagestyle{fancy}
	\chapter*{\@ctitle}
	\fancyhead[OC]{\zihao{5}\songti 摘\quad 要}
	\fancyhead[EC]{\zihao{5}\songti 燕山大学\@capplydegree \cdegree 士学位论文}
	\pagenumbering{Roman}
	\noindent\heiti 摘要：\songti #1
	\addcontentsline{toc}{chapter}{\heiti 摘要}
}

\newcommand{\ckeywords}[1]{
	\thispagestyle{fancy}
	\fancyhead[OC]{\zihao{5}\songti 摘\quad 要}
	\fancyhead[EC]{\zihao{5}\songti 燕山大学\@capplydegree\cdegree 士学位论文}
	\hangafter1\hangindent3.99em\noindent\heiti 关键词：\songti #1

	\noindent\heiti 分类号：\songti\@CLCnumber
	\newpage
}

\newcommand{\eabstract}[1]{
	\newpage
	\thispagestyle{fancy}
	\chapter*{\textbf{\@etitle}}
	\fancyhead[OC]{\zihao{5}\songti Abstract}
	\fancyhead[EC]{\zihao{5}\songti 燕山大学\@capplydegree\cdegree 士学位论文}
	\noindent\textbf{Abstract:} #1
	\addcontentsline{toc}{chapter}{Abstract}
}

\newcommand{\ekeywords}[1]{
	\thispagestyle{fancy}
	\fancyhead[OC]{\zihao{5}\songti Abstract}
	\fancyhead[EC]{\zihao{5}\songti 燕山大学\@capplydegree\cdegree 士学位论文}
	\hangafter1\hangindent5em\noindent\textbf{Keywords: }\songti #1

	\noindent\textbf{Classification: }\songti\@UDCnumber
	\newpage
	}

\newcommand{\customizedtableofcontents}{
	\newpage
	\setlength{\parskip}{-3.9pt}%
	\renewcommand{\contentsname}{\raisebox{-0.23em}{目\quad 次}}
	\tableofcontents

	\thispagestyle{fancy}%%%%mzhy55
	\fancyhead[OC]{\zihao{5}\songti 目\quad 次} % 页眉内容居中显示
	\fancyhead[EC]{\zihao{5}\songti 燕山大学\@capplydegree\cdegree 士学位论文}

	\clearpage{\thispagestyle{empty}\cleardoublepage}

	\linespread{1}
	\setlength{\parskip}{0pt}
	\renewcommand{\arraystretch}{1}
	\setcounter{page}{1}
	\pagenumbering{arabic}
	\thispagestyle{fancy}%%%%mzhy55
    \fancyhead[OC]{\zihao{5}\songti\leftmark} % 页眉内容居中显示
	\fancyhead[EC]{\zihao{5}\songti 燕山大学\@capplydegree\cdegree 士学位论文}
}

\newcommand{\reference}[1]{
	\linespread{1.77}
	\renewcommand{\bibname}{\raisebox{0.91em}{参考文献}\vspace{-1.14em}}
	\clearpage\addcontentsline{toc}{chapter}{参考文献}
	\bibliography{#1}
	\thispagestyle{fancy}
	\fancyhead[OC]{\zihao{5}\songti 参考文献}
}

\newcommand{\achievement}[1]{
	\linespread{1}
	\chapter*{攻读\cdegree 士学位期间取得的成果}
	\linespread{1.74}
	\thispagestyle{fancy}
	\fancyhead[OC]{\zihao{5}\songti 攻读\cdegree 士学位期间取得的成果}
	\addcontentsline{toc}{chapter}{攻读\cdegree 士学位期间取得的成果}
	#1
}

\newcommand{\acknowledgement}[1]{
	\linespread{1}
	\chapter*{致\quad 谢}
	\songti
	\setlength{\parindent}{2em}
	\thispagestyle{fancy}
	\fancyhead[OC]{\zihao{5}\songti 致\quad 谢}
	\addcontentsline{toc}{chapter}{致谢}
	#1
}

\newcounter{appendix}
\newcommand{\customizedappendix}[1]{
	\addtocounter{appendix}{1}
	\linespread{1}
	\ctexset{chapter/number=\Alph{appendix}}
	\renewcommand{\thechapter}{\Alph{appendix}}
	\ctexset{chapter={name = {附录,}}}
	\chapter{}
	\songti
	\setlength{\parindent}{2em}
	\thispagestyle{fancy}
	\fancyhead[OC]{\zihao{5}\songti\leftmark}
	#1
}

\newcommand{\makecover}{
	\thispagestyle{empty} % 隐藏页眉和页脚
	\linespread{1.34}
	\setlength{\parskip}{0.79em}%
	\renewcommand{\arraystretch}{1}
	\begin{center}
		\vspace*{0.06cm}
		\includegraphics[width=6.87cm]{ysu_logo}

		\vspace{1.43cm} % 垂直间距
		{\textbf{\zihao{-0}\heitib \cdegree ~ 士~ 学~ 位~ 论~ 文}} % 封面标题

		{\zihao{-2} \adjectiveedegree~DISSERTATION} % 封面副标题

		{\zihao{-2}\heiti （~ \degreetypewithspace~ 学~ 位~ ）} % 作者姓名

		\vspace{0.68cm} % 垂直间距
	\end{center}
	\begin{flushright}
		\begin{tabular}{p{3.08cm}p{10.44cm}}
			\zihao{-2}\heiti 论文题名 & \zihao{-2}\kaishu \@ctitle\\[5.26cm]
			\zihao{-2}\heiti 作者姓名 & \zihao{-2}\kaishu \@cauthor\\[0.74cm]
			\zihao{-2}\heiti 学科专业 & \zihao{-2}\kaishu \@csubject\\[0.77cm]
			\zihao{-2}\heiti 指导教师 & \zihao{-2}\kaishu \@csupervisorname \quad \@csupervisortitle
		\end{tabular}
	\end{flushright}

	\vspace{2.45cm}
	{\centering{\zihao{-2}\songti\@cdate} % 答辩日期

	\newpage\null\thispagestyle{empty}\newpage
	\thispagestyle{empty} % 隐藏页眉和页脚
	\linespread{1.07}
	\setlength{\parskip}{0pt}
	\renewcommand{\arraystretch}{1.1}
	\begin{tabular}{p{11.2cm}p{4.2cm}}
	中图分类号：\@CLCnumber & 学校代码：10216\\
	UDC：\@UDCnumber & 密级：\@security
	\end{tabular}

	\vspace{1.73cm}
	\textbf{\songtib\zihao{-2}\degreetype 学位\cdegree 士学位论文}

	\vspace{0.4cm}
	\zihao{3}\songti\researchtypebrace

	\vspace{1.73em}
	\zihao{2}\heiti\@ctitle

	\vfill
	\renewcommand{\arraystretch}{0.9}
	\begin{tabular}{p{4.08cm}@{\zihao{4}\heiti ：}l}
		\zihao{4}\heiti \cdegree\hfill 士\hfill 研\hfill 究\hfill 生 & \zihao{4}\songti\@cauthor\\
		\zihao{4}\heiti 导\hfill 师 & \zihao{4}\songti\@csupervisorname \quad \@csupervisortitle\\
		\@cassosupervisorname\@cassosupervisortitle
		\zihao{4}\heiti 申\hfill 请\hfill 学\hfill 位 & \zihao{4}\songti \@capplydegree \cdegree 士\\
		\zihao{4}\heiti 学\hfill 科\hfill 专\hfill 业 & \zihao{4}\songti \@csubject\\
		\zihao{4}\heiti 所\hfill 属\hfill 学\hfill 院 & \zihao{4}\songti \@cschool\\
		\zihao{4}\heiti 答\hfill 辩\hfill 日\hfill 期 & \zihao{4}\songti \@cdate\\
		\zihao{4}\heiti 授\hfill 予\hfill 学\hfill 位\hfill 单\hfill 位 & \zihao{4}\songti 燕山大学
	\end{tabular}

	\if@isacademic
		\vspace{2.94cm}
	\fi
	\if@isprofessional
		\vspace{2.04cm}
	\fi

	\newpage\null\thispagestyle{empty}\newpage
	\thispagestyle{empty} % 隐藏页眉和页脚
	\setlength{\parskip}{0pt}
	\renewcommand{\arraystretch}{1}
	\vspace*{0.7cm}
	\linespread{0.95}
	\zihao{-2}\textbf{\@etitle}

	\vfill
	\linespread{1.89}
	\zihao{-3} A dissertation submitted to

	Yanshan University

	in partial fulfillment of the requirement for the degree of

	 \edegree~of \@eapplydegree

	in \@esubject

	By

	\@eauthor

	Supervisor: \@esupervisortitle ~\@esupervisorname

	\@eassosupervisortitle\@eassosupervisorname

	\if@isacademic
		\vspace{5.38cm}
	\fi
	\if@isprofessional
		\vspace{4.18cm}
	\fi

	\textbf{\@eschool, Yanshan University}

	\textbf{\@edate}\par}

	\vspace{0.53cm}

	\newpage\null\thispagestyle{empty}
	\newpage\thispagestyle{empty} % 隐藏页眉和页脚
	\linespread{1.55}
	\setlength{\parskip}{0pt}
	\renewcommand{\arraystretch}{1}

	\vspace*{-2.73em}
	{\centering\zihao{3}\heiti 燕山大学\cdegree 士学位论文原创性声明\par}

	\vspace{1.68em}
	\zihao{-4}\songti 本人郑重声明：此处所提交的 \cdegree 士学位论文《\@ctitle》，是本人在导师指导下，在燕山大学攻读 \cdegree 士学位期间独立进行研究工作所取得的成果。论文中除已注明部分外不包含他人已发表或撰写过的研究成果。对本文的研究工作作出重要贡献的个人和集体，均已在文中以明确方式注明。本声明的法律结果将完全由本人承担。

	\vspace{1.87em}
	\hspace{4.76em} 作者签字：\hspace{6.5em}日期：\hspace{2.5em}年\hspace{1.5em}月\hspace{1.5em}日

	\vspace{5.1em}
	{\centering\zihao{3}\heiti 燕山大学\cdegree 士学位论文使用授权书\par}

	\vspace{1.74em}
	\zihao{-4}\songti 《\@ctitle》系本人在燕山大学攻读 \cdegree 士学位期间在导师指导下完成的 \cdegree 士学位论文。本论文的研究成果归燕山大学所有，本论文的研究内容不得以其他单位的名义发表。本人完全了解燕山大学关于保存、使用学位论文的规定，同意学校保留并向有关部门送交论文的复印件和电子版本，允许论文被查阅和借阅。本人授权燕山大学，可以采用影印、缩印或其他复制手段保存论文，可以公布论文的全部或部分内容。

	\vspace{1.89em}
	\hspace{8em}保密$\square$，在\hspace{1.5em}年解密后适用本授权书。

	本学位论文属于

	\hspace{8em}不保密$\square$。

	\hspace{0em}（请在以上相应方框内打“$\surd$”）

	\vspace{1.86em}
	\hspace{5.5em}作者签名：\hspace{8em}日期：\hspace{3.5em}年\hspace{2em}月\hspace{2em}日

	\vspace{1.86em}
	\hspace{5.5em}导师签名：\hspace{8em}日期：\hspace{3.5em}年\hspace{2em}月\hspace{2em}日

	\newpage\null\thispagestyle{empty}

	\setlength{\parskip}{0pt}
	\renewcommand{\arraystretch}{1}
}
