\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dict}[2024/10/02 Dictionary LaTeX class]

\newcommand{\headlinecolor}{\normalcolor}

\DeclareOption{onecolumn}{\OptionNotUsed}

%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[twocolumn, 10pt,a4paper,twoside]{article} % 10pt font size, A4 paper and two-sided margins

\RequirePackage[top=3.5cm,bottom=3.5cm,left=3.5cm,right=3.5cm,columnsep=30pt]{geometry} % Document margins and spacings
\RequirePackage[utf8]{inputenc} % Required for inputting international characters
\RequirePackage[T1]{fontenc} % Output font encoding for international characters
\RequirePackage{fontspec}
\RequirePackage{microtype} % Improves spacing
\RequirePackage[bf,sf,center]{titlesec} % Required for modifying section titles - bold, sans-serif, centered
\RequirePackage{fancyhdr} % Required for modifying headers and footers
\fancyhead[L]{\textsf{\rightmark}} % Top left header
\fancyhead[R]{\textsf{\leftmark}} % Top right header
\renewcommand{\headrulewidth}{1.2pt} % Rule under the header
\fancyfoot[C]{\textbf{\textsf{\thepage}}} % Bottom center footer
\renewcommand{\footrulewidth}{1.0pt} % Rule under the footer
\pagestyle{fancy} % Use the custom headers and footers throughout the document

\newcommand{\entry}[3]{\textbf{#1}\markboth{#1}{#1} \textit{#2}\ $\bullet$\ {#3} \newline} % Defines the command to print each word on the page, \markboth{}{} prints the first word on the page in the top left header and the last word in the top right

\setlength\parindent{0pt} %it sets \noindent for whole document. So no indentation for new paragraphs.

