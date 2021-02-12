+++
date = "2016-11-11T16:03:02+13:00"
title = "Academic workflow"
slug = "academic-workflow"
categories = ["Productivity", "Writing"]
draft = "False"
+++

I have been drifting away from using the Microsoft Office suite of
products for a number of years. It began around 2010 when I
adopted [org-mode](https://orgmode.org/) to maintain my todo lists.
That meant I had to get to grips
with [Emacs](https://www.gnu.org/s/emacs) . That led me
to [beamer](https://www.ctan.org/pkg/beamer), which saw me moving away
from PowerPoint.
<!--more-->

Whilst completing my PhD, I also played with Emacs and latex to format
it. Getting (APA formatting)[www.apastyle.org/] to work well was
something of a chore, and in the end I completed the thesis in
Microsoft Word.

However, things have moved on.

I stumbled upon [Kieran Healy's website](https://kieranhealy.org/), his
description of
his
[workflow](https://kieranhealy.org/blog/2011/01/18/workflow-and-the-emacs-starter-kit-for-the-social-sciences),
and his site
on
[The Plain Person's Guide to Plain Text Social Science](https://plain-text.co/) (Not
to mention his [GitHub repository](https://github.com/kjhealy)).

All in all, led me on a lot of work on reproducible research--such
as [this](https://kbroman.org/steps2rr/)
and [this](https://kbroman.org/Tools4RR/).

So the last few weeks have seen me reworkign much of my workflow.

The first step has been my adoption
of [markdown](https://daringfireball.net/projects/markdown/)
and [Rmarkdown](https://rmarkdown.rstudio.com/) for my writing
(alongside Emacs). I had already been using markdown for this
blog/site (alongside [Hugo](https://gohugo.io/) so the learning curve
was not too steep. From markdown, I can
use [pandoc](https://pandoc.org/) to render `PDF`, `HTML`, or `DOCX`
files.

To do that I use the following Makefile, which largely came from Kieran Healy.

~~~
## A Makefile in for your markdown-based paper project. 
## Assuming you are using the rest of my templates and toolchain,
## (see https://kieranhealy.org/resources) you can use it
### to create .html, .tex, and .pdf output files (complete with
### bibliography, if present) from your markdown file.
## -    Install the `pandoc-citeproc` and `pandoc-citeproc-preamble`
##      filters for `pandoc`.
## -	Change the paths at the top of the file as needed.
## -	Using `make` without arguments will generate html, tex, and pdf 
## 	output files from all of the files with the designated markdown
##	extension. The default is `.md` but you can change this. 
## -	You can specify an output format with `make tex`, `make pdf` or 
## - 	`make html`. 
## -	Doing `make clean` will remove all the .tex, .html, and .pdf files 
## 	in your working directory. Make sure you do not have files in these
##	formats that you want to keep!

## Markdown extension (e.g. md, markdown, mdown).
MEXT = md

## All markdown files in the working directory
SRC = $(wildcard *.$(MEXT))

## Location of Pandoc support files.
PREFIX = /home/psmith/NAS/Templates

## Location of your working bibliography file
BIB = /home/psmith/NAS/Work/Research/Citations/bibs/psmithLibrary.bib

## CSL stylesheet (located in the csl folder of the PREFIX directory).
CSL = apa


PDFS=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)
TEX=$(SRC:.md=.tex)
DOCX=$(SRC:.md=.docx)

all:	$(PDFS) $(HTML) $(TEX) $(DOCX)

pdf:	clean $(PDFS)
html:	clean $(HTML)
tex:	clean $(TEX)
docx:	clean $(DOCX)

%.html:	%.md
pandoc -r markdown+simple_tables+table_captions+yaml_metadata_block -w html -S \
--filter pandoc-crossref --filter pandoc-citeproc --filter pandoc-citeproc-preamble \
--data-dir=$(PREFIX)/pandoc \
--template=$(PREFIX)/templates/html.template \
--css=$(PREFIX)/marked/kultiad-serif.css \
--csl=$(PREFIX)/csl/$(CSL).csl \
--bibliography=$(BIB) \
-o $@ $<

%.tex:	%.md
pandoc -r markdown+simple_tables+table_captions+yaml_metadata_block -w latex -s -S \
--filter pandoc-crossref --filter pandoc-citeproc --filter pandoc-citeproc-preamble \
--data-dir=$(PREFIX)/pandoc \
--latex-engine=pdflatex \
--template=$(PREFIX)/templates/psmith_apa.tex \
--csl=$(PREFIX)/csl/$(CSL).csl \
--bibliography=$(BIB) \
-o $@ $<


%.pdf:	%.md
pandoc -r markdown+simple_tables+table_captions+yaml_metadata_block -s -S \
--filter pandoc-crossref --filter pandoc-citeproc --filter pandoc-citeproc-preamble \
--data-dir=$(PREFIX)/pandoc \
--latex-engine=pdflatex \
--template=$(PREFIX)/templates/psmith_apa.tex \
--csl=$(PREFIX)/csl/$(CSL).csl \
--bibliography=$(BIB) -o $@ $<

%.docx:	%.md
pandoc -r markdown+simple_tables+table_captions+yaml_metadata_block -s -S \
--filter pandoc-crossref --filter pandoc-citeproc \
--data-dir=$(PREFIX)/pandoc \
--csl=$(PREFIX)/csl/$(CSL).csl \
--bibliography=$(BIB) \
-o $@ $<

clean:
rm -f *.html *.pdf *.tex *.aux *.log *.docx

.PHONY: clean
~~~

For PDFs, I wanter the documents to be fairly apa-ish. I could not
find a template that did exactly what I wanted, and I could not quite
workout how to adjust Kieran's template to do APA. So, I built my own
from a number of sources around the Internet. This is the resulting
template:

```latex
% Here we go with my apa6 template
%
% Address a 'feature' of pandoc.
%
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

\documentclass[11pt,a4paper,doc]{apa6}  

% The declaration of the document class:

% Note that there we have nothing in the nature of a template;
% it's just a standard bit of LaTeX pandoc will copy unaltered into the 
% LaTeX file it is writing.  But suppose you wrote something
% more akin to the corresponding line in Pandoc's default 
% latex.template file, say:

% \documentclass$if(fontsize)$[$fontsize$]$endif${scrartcl}

% then you would have invented a 'variable', fontsize, 
% and could write things like 

% `markdown2pdf my.txt --xetex --variable=fontsize:12pt -o my.pdf` or
% `pandoc -r markdown -w html my.txt -s --xetex --variable=fontsize:24pt -o my.tex`. 

% If we specified --variable-fontsize:12, then template substitution
% would yield a LaTeX document beginning
% \documentclass[12pt]{scrarcl}
% which is just what we said anyway. 
% But we could also specify a different fontsize.

% I don't use this `--variable=....`functionality myself; 
% I have a couple of basic templates I call with 
% `--template=whatever.template` which I can also 
% easily inspect to adjust things like font size as I please. 

% Enough about the document class.

% Symbols: 
% Pandoc imports the extensive `amsmath` collection of symbols 
% for typesetting ordinary math.  
\usepackage{amsmath}


% `babel`: 
% The `babel` package, among other things, lets you determine what 
% language you are using in a given stretch of text, so that typesetting 
% will go well. Here we specify that mostly, we are speaking English:
\usepackage[english]{babel}

%
% Allow for UTF-8
\usepackage[utf8]{inputenc}

% Margins, etc:
% the `geometry` package makes for convenient adjusting of margins, which is what
% you asked about.  Of course it can do much more, even make coffee for you:
\usepackage{geometry}
\geometry{verbose,a4paper,tmargin=3cm,bmargin=3cm,lmargin=3cm,rmargin=3cm}
% so if you just keep a copy of this template in the directory you are working in, you
% can adjust the margins by going into this file and messing with the margins.
% the syntax is very unforgiving, but permits 3cm and 2.5in and some other things.

\makeatletter
\b@level@one@skip=-2.5ex plus -1ex minus -.2ex
\b@level@two@skip=-2.5ex plus -1ex minus -.2ex
\makeatother

\setlength\parindent{1.27cm}


% Font:
% Here I set my main font -- Palatino, the pursausive font.
\usepackage[sc]{mathpazo}
\usepackage{eulervm}
\linespread{1.08}

% Properly one should specify a sanserif font and a monospace font
%\setromanfont[Mapping=tex-text,Numbers=OldStyle]{palatino} 
%\setsansfont[Mapping=tex-text]{Minion Pro} 
%\setmonofont[Mapping=tex-text,Scale=0.8]{Pragmata}

% But I hate sanserif fonts, and anyway there are defaults.
% Heading styles:
% These commands keep the koma system from making stupid sans serif section headings
%\setkomafont{title}{\rmfamily\mdseries\upshape\normalsize}
%\setkomafont{sectioning}{\rmfamily\mdseries\upshape\normalsize}
%\setkomafont{descriptionlabel}{\rmfamily\mdseries\upshape\normalsize}



% I'm puzzled why I have this foonote speciality, 
% I wonder if it's part of my problem I've been having, but wont look
% into it now. 
%\usepackage[flushmargin]{footmisc} 
% \usepackage[hang,flushmargin]{footmisc}


% So much for my personal template.


% Everything that follows is copied from the pandoc default template:
% I will interpolate a few comments, the comments that are in 
% the default template will be marked % -- 

% Paragraph format:
% Pandoc prefers unindented paragraphs in the European style:
%\setlength{\parindent}{0pt}
%  ... with paragraph breaks marked by a slight lengthening of 
% the space between paragraphs:
%\setlength{\parskip}{6pt plus 2pt minus 1pt}

% Page format:
\pagestyle{plain}  
% The default `plain` pagestyle just numbers the pages,
% whereas 
% \pagestyle{empty} 
% would give you no numbering.


% Footnotes
% if you have code in your footnotes, the million macro march 
% kind of bumps into itself.
% Pandoc, having just rendered your text into LaTeX, 
% knows whether the 'variable' `verbatim-in-note` is True, and 
% If it is, it asks for a  LaTeX package that solves the dilemma:
$if(verbatim-in-note)$
\usepackage{fancyvrb}
$endif$

% Lists formatting: 
% note sure what 'fancy enums' are; something to do with lists, 
% as the further comment suggests: 
$if(fancy-enums)$
% -- Redefine labelwidth for lists; otherwise, the enumerate package will cause
% -- markers to extend beyond the left margin.
\makeatletter\AtBeginDocument{%
  \renewcommand{\@listi}
    {\setlength{\labelwidth}{4em}}
}\makeatother
\usepackage{enumerate}
$endif$


% Table formatting: 
% What if you make a table? -- Pandoc knows, of course, and 
% then declares that its  variable `table` is True and 
% imports a table package suitable to its pleasantly simple tables. 
% Needless to say infinitely   complicated tables are possible in 
% LaTeX with suitable packages. We are spared the temptation:

$if(tables)$
\usepackage{array}

% Continuing on the topic of tables ... (we havent reached `endif`). 
% The commented out line below is in the default pandoc  latex.template.
% Some unpleasantness with table formatting must be corrected.

% -- This is needed because raggedright in table elements redefines \\:
\newcommand{\PreserveBackslash}[1]{\let\temp=\\#1\let\\=\temp}
\let\PBS=\PreserveBackslash

$endif$


% Subscripts:
% Pandoc remembers whether you used subscripts, assigning True to 
% its `subscript` variable 
% It then needs to adopt a default with an incantation like this:
$if(subscript)$
\newcommand{\textsubscr}[1]{\ensuremath{_{\scriptsize\textrm{#1}}}}
$endif$


% Web-style links:

% markdown inclines us to use links, since our texts can be made into html. 
% Why not have clickable blue links even in 
% learned, scientific, religious, juridical, poetical and other suchlike texts? 
% Never mind that they have been proven to destroy the nervous system!

% First, what about the fact that links like https://example.com are 
% technically code and thus must not be broken across lines? 
% [breaklinks=true] to the rescue!

% Nowadays LaTeX can handle all of this with another half million macros:

\usepackage[breaklinks=true]{hyperref}
\hypersetup{colorlinks,%
citecolor=blue,%
filecolor=blue,%
linkcolor=blue,%
urlcolor=black}
$if(url)$
\usepackage{url}
$endif$



% Images. 
% In ye olde LaTeX one could only import a limited range of image
% types, e.g. the forgotten .eps files.  Or else one simply drew the image with suitable
% commands and drawing packages.  Today we want to import .jpg files we make with 
% our smart phones or whatever:

$if(graphics)$
\usepackage{graphicx}
% -- We will generate all images so they have a width \maxwidth. This means
% -- that they will get their normal width if they fit onto the page, but
% -- are scaled down if they would overflow the margins.
\makeatletter
\def\maxwidth{\ifdim\Gin@nat@width>\linewidth\linewidth
\else\Gin@nat@width\fi}
\makeatother
\let\Oldincludegraphics\includegraphics
\renewcommand{\includegraphics}[1]{\Oldincludegraphics[width=\maxwidth]{#1}}
$endif$



% Section numbering.  
% Here again is a variable you can specify on the commandline
% `markdown2pdf my.txt --number-sections --xetex --template=/wherever/this/is -o my.pdf`
$if(numbersections)$
$else$
\setcounter{secnumdepth}{0}
$endif$

% Footnotes: 
% Wait, didn't we already discuss the crisis of code in footnotes?  
% Evidently the order of unfolding of macros required that
% we import a package to deal with them earlier
% and issue a command it defines now. (Or maybe that's not the reason;
% very often the order does matter as the insane system of macro expansion
% must take place by stages.)
$if(verbatim-in-note)$
\VerbatimFootnotes % -- allows verbatim text in footnotes
$endif$

% Other stuff you specify on the command line:
% You can include stuff for the header from a file specified on the command line;
% I've never done this, but that stuff will go here:
$for(header-includes)$
$header-includes$
$endfor$

% Title, authors, date.
% If you specified title authors and date at the start of 
% your pandoc-markdown file, pandoc knows the 'values' of the
% variables: title authors date and fills them in.


$if(title)$
% Title page stuff
\title{$title$}
$else$
\title{~}$endif$
$if(shorttitle)$
\shorttitle{$shorttitle$}
$else$
\shorttitle{~}$endif$


$if(author)$
$if(twogroups)$
\twoauthors$for(author)${$author$}$endfor$
$else$$if(threegroups)$
\threeauthors$for(author)${$author$}$endfor$
$else$$if(fourgroups)$
\fourauthors$for(author)${$author$}$endfor$
$else$$if(fivegroups)$
\fiveauthors$for(author)${$author$}$endfor$
$else$$if(sixgroups)$
\sixauthors$for(author)${$author$}$endfor$
$else$
\author{$for(author)$$author$$sep$, $endfor$}
$endif$$endif$$endif$$endif$$endif$
$else$
\author{~}$endif$
$if(affiliation)$
$if(twogroups)$
\twoaffiliations$for(affiliation)${$affiliation$}$endfor$
$else$$if(threegroups)$
\threeaffiliations$for(affiliation)${$affiliation$}$endfor$
$else$$if(fourgroups)$
\fouraffiliations$for(affiliation)${$affiliation$}$endfor$
$else$$if(fivegroups)$
\fiveaffiliations$for(affiliation)${$affiliation$}$endfor$
$else$$if(sixgroups)$
\sixaffiliations$for(affiliation)${$affiliation$}$endfor$
$else$
\affiliation{$for(affiliation)$$affiliation$$sep$\\ $endfor$}
$endif$$endif$$endif$$endif$$endif$
$else$
\affiliation{~}$endif$

%
% A bit of magic so the line ``Affiliation'' is not display
%\affiliation{~}

$if(date)$
\note{$date$}$endif$

$if(authornote)$
\authornote{%
$authornote$
}$endif$


$if(abstract)$
% Abstract page
\abstract{%
$abstract$
}$endif$


$if(keywords)$
\keywords{$for(keywords)$$keywords$$sep$, $endfor$}$endif$

$for(include-before)$
% Other custom includes
$include-before$

$endfor$


% At last: 
% The document itself!:

% After filling in all these blanks above, or erasing them 
% where they are not needed, Pandoc has finished writing the 
% famous LaTeX *preamble* for your document.
% Now comes the all-important command \begin{document}
% which as you can see, will be paired with an \end{document} at the end.
% Pandoc knows whether you have a title, and has already
% specified what it is; if so, it demands that the title be rendered.  
% Pandoc knows whether you want a table of contents, you
% specify this on the command line.
% Then, after fiddling with alignments, there comes the real
% business: pandoc slaps its rendering of your text in the place of
% the variable `body`
% It then concludes the document it has been writing. 

\begin{document}
$if(title)$
\maketitle
$endif$
$if(toc)$
\setcounter{tocdepth}{$toc-depth$}
\tableofcontents
$endif$
$body$
\end{document}
```

It does a pretty good job (for now). I have not tried inserting images
and tables yet, but---for now---it is good enough. Just to compelte
things, here is a sample markdown file.

```md
---
title: "Notes on BUSINESS 705"
shorttitle: "DRAFT notes for 705"
author:
  Peter Smith
affiliation: 
  The University of Auckland 
twogroups: false             # authors span two universities, other fields: threegroups, ..., sixgroups
date: November 2017
keywords:                    # enter as many keywords as needed
    - qualitative research
    - research design
    - data collection
    - data analysus
abstract: |                  # abstracts are multiline text (optional)
	This year, BUSINESS 705, is being redesigned with a view to being delivered in six weeks. It will fit between the Reseaerch Design course (BUSINESS 705), and the Advanced Qualitative Methods course (BUSINESS 7xx). This document records the design decisions  and constraints.
authornote: |                # author notes are multiline text (optional)
    Correspondence: Peter Smith, Department of Management & International Business, The University of Auckland Business School, Private Bag 92019

    Email: p.smith@auckland.ac.nz
...

# Introduction
The structure of research methods education in the department has changed. For those pursuing qualitative methods, the pathway comprises *Research design*, *Qualitative methods*, and---for PhD candidates--*Advanced qualitative methods*. That is to say, BUSINESS 710, BUSINESS 705, and BUSINESS 712.

According to its prescription, BUSINESS 710 seeks to:

> The pursuit of new knowledge requires the ability to recognise and design appropriate and robust research studies. Students explore the principles and practices of research design, including the fundamentals of where knowledge comes from; if and to what degree we can be certain about our findings; the ethics of research activities; and how a topic might be investigated from multiple approaches and philosophical perspectives.

Whereas the focus of BUSINESS 712 is more succinct, in that its prescription says:

>  An advanced seminar on recent developments in the application of qualitative methods in business research.

Sitting between these two courses is the more prescriptive BUSINESS
705, in which:

> Students will become familiar with current theory and practice as
> well as methodological debates in the use of qualitative
> methodologies, including ethnography, case studies, archival
> research, participant observation, interview and focus group
> methods, as well as transcription and analysis. A workshop on coding
> qualitative data will be included.

All three courses, whilst being worth the usual 15-points, are
delivered in a compress format, taking six weeks instead of the normal
12 weeks. One implication of this change is that it may not be
possible, even if it is desirable, to use an examination at the end of
the course(s).

# The existing BUSINESS 705
The prescription for BUSINESS 705 matches closely the existing current
structure and content of the course. The week-by-week programme for
the course---as shown in the syllabus for last year's delivery of the
course--illustrates this.

1. Introduction to qualitative methods
2. Paradigms
3. Grounded theory
4. Case study
5. Ethnography
6. Discourse analysis
7. Interviews
8. Focus groups
9. Observations
10. Visual methods
11. Working on group presentations
12. Group presentations

The course was assessed through (a) a critique of a paper, (b) a
research paper, (c) group presentation, and (d) participation. Each of
these were worth 20, 45, 20, and 15 per cent respectively.

In contrast the doctoral research methods course at HEC Montreal is structured as:

1. Introduction
2. Formulating research questions
3. Paradigms and practices of qualitative research
4. Justifying your research
5. Designing qualitative research
6. Observations
7. Interviews
8. Documents
9. Analysis aids
10. Strategies for analysis
11. Quality criteria and triangulation


# Course structure
An implicit goal of this course is the goal of preparing students to
undertake their first (and perhaps only) research project of any size;
e.g., a masters thesis (60-point) or perhaps an honours level
dissertation (30-point).

## Content
The current prescription may not be appropriate. Perhaps a more
strongly themed approach would be useful, grounded in approaches to:

1. The 'qualitative' mindset
   - Paradigms
1. Designing qualitative research
   - Formulating a research question
   - Justifying a research questions
   - Ethics
   - Gaining access
   - Quality in qualitative research
   - Units and levels of analysis
   - Case studies
1. Collecting qualitative data
   - Using documents
   - Surveys
   - Interviews
   - Focus groups
   - Visual methods
   - Repertory grids
   - Observations
   - Ethnography
1. Analysing qualitative data
   - Content analysis
   - Thematic analysis
   - Grounded theory
   - Discourse analysis
   - Hermeneutics
1. Presenting the analysis of the qualitative data
   - Writing up qualitative research
   - Presenting specific types of analysis
	 * Presenting thematic analysis; e.g., the Gioia method [@gioia_2013_seekingqualitativerigor]
	 * Presenting fieldnotes; e.g., _Jarzabkowski et al._ [-@jarzabkowski_2015_conductingglobalteambased]

## Delivery
The compressed delivery format means that the class is scheduled to
meet for three hours, twice a week, for the first six weeks of the
semester. This also implies that students should be spending about 20
hours per week on course related activities


# Assessment structure

# General items

## Course outline

## Canvas

## Resources

### Readings

### Text book

# References
```

Oh yes, there is one other file that is needed, and that is a YAML file called `pandoc-crossref-settings.yaml`. 

```yaml
cref: True
codeBlockCaptions: True
figPrefix: 
 - "Figure"
 - "Figures"
figureTitle: "Figure "
lstPrefix:
 - "Listing"
 - "Listings"
tblPrefix:
 - "Table"
 - "Tables"
tableTemplate: "*$$tableTitle$$ $$i$$*$$titleDelim$$ $$t$$"
```

To use these, put all three files--the Makefile, the template, and the
YAML file in a directory. Rename the template to something meaningful,
e.g., `business-705-course-design.md` and then run gnu make. That will
build PDF, HTML, and DOCX versions of the file.

So far, so good. Now to rework my beamer template to match the
University of Auckland's new template for slides.
