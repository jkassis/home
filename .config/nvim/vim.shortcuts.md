DISCOVERING BINDINGS
use ":help {key}^D" to find out if
a key is used for some command.  ({key} is the specific key you want to find
out about, ^D is CTRL-D)


HELP WITH MAPPINGS
https://neovim.io/doc/user/map.html

FILES
[a                  previous in arg list
]a                  next in arg list
[A                  first in arg list
]A                  last in arg list
[f                  prev in dir by alpha
]f                  next in dir by alpha
[F                  first in dir by alpha
]F                  last in dir by alpha 


BUFFERS
http://vim.wikia.com/wiki/Easier_buffer_switching<Paste>
:bufdo              do the following command in all buffers
:ls                 list all buffers (aka :buffers)
:b                  change to buffer (aka :bu :buf :buffer)
[b                  previous
]b                  next
[B                  first
]B                  last


WINDOWS
ctrl-[hjkl]         Navigate Windows


TABS
http://vim.wikia.com/wiki/Category:Tabs
http://vim.wikia.com/wiki/Using_tab_pages
http://vim.wikia.com/wiki/Quick_tips_for_using_tab_pages
:tabedit {file}     edit specified file in a new tab
:tabfind {file}     open a new tab with filename given, searching the 'path' to find it
:tabclose           close current tab
:tabclose {i}       close i-th tab
:tabonly            close all other tabs (show only the current tab)
:tab ball           show each buffer in a tab (up to 'tabpagemax' tabs)
:tab help           open a new help window in its own tab page
:tab drop {file}    open {file} in a new tab, or jump to a window/tab containing the file if there is one
:tab split          copy the current window to a new tab of its own
:tabs               list all tabs including their displayed windows
:tabm 0             move current tab to first
:tabm               move current tab to last
:tabm {i}           move current tab to position i+1
:tabn               go to next tab
:tabp               go to previous tab
:tabfirst           go to first tab
:tablast            go to last tab
<C-W>T              make it a tab
gt                  go to next tab
gT                  go to previous tab
{i}gt               go to tab in position i


LOCATION LIST
[l                  previous
]l                  next
[L                  first
]L                  last


QUICKFIX LIST
[q                  quickfix previous
]q                  quickfix next
[Q                  quickfix first
]Q                  quickfix next


TAGS
[t                  prev
]t                  next
[T                  first
]T                  last


SCM CONFLICTS (DIFFS)
[n                  Previous
]n                  Next


COLUMNS MOTIONS
jk                  move left/right
0                   move to column zero (beginning of line)
|                   move to column zero (beginning of line)
$                   move to end of line

BLOCK MOTIONS
()                  move back/forward one sentence
[]                  move to next/prev curly-bracket sections
{}                  move to next/previous blank-line separated section
%                   go to other side of braces

TEXT OBJECT MOTIONS (Operator Mode)
an                  'around text object delimited by n'
in                  inside text object delimited by n

CHAR MOTIONS
tk                  move fwd until character k
Tk                  move bak until character k
fk                  move fwd to character k
Fk                  move bak to character k
;                   repeat last 'f', 'F', 't', or 'T' Command


WORD MOTIONS
w                   move fwd to start of word
W                   move fwd to start of WORD
e                   move fwd to end of word
E                   move fwd to end of WORD
b                   move bak to start of word
B                   move bak to start of WORD


TAG MOTIONS
gd                  will take you to the local declaration.
gD                  will take you to the global declaration.


LINE MOTIONS
jk                  move down, up
<C-f>               forward one screen
<C-b>               backward one screen
<C-D>               down half-screen
gg                  goes to the first line in the buffer (or provide a count before the command for a specific line).
G                   goes to the last line (or provide a count before the command for a specific line).
linenum shift-G     goes to the line number
^                   move to first non-whitespace of line
_                   move to first non-whitespace of line
+                   move to first non-whitespace of next line
-                   move to first non-whitespace of previous line


NAVIGATING MARKS
'k                   move to mark, first non-whitespace
`k                   move to marked line, memorized column
mk                   set mark k to cursor position


FILTERING
=                   filter through external program


LINE-WISE OPERATIONS
[<Space>            add whitespace one line up
]<Space>            remove whitespace one line up
down-arrow          add whitespace one line down
shit down-arrow     remove whitespace one line down
[e                  swap with prev line
]e                  swap with next line


CHANGING / REPLACING
c[movement]         change characters in movements (delete them and goto insert mode)
nsk                 change n characters (delete them and goto insert mode)
nrk                 delete n characters and fill with k


INSERTING
iI                  insert to the left of point / line
aA                  insert to the right of point / line


INDENTING / SHIFTING / FORMATTING
http://vim.wikia.com/wiki/Fix_indentation
<>                  indent visual selection left / right one shiftwidth
n<>                 indent n line left / right one shiftwidth


UNDO
u                   undo last change
U                   DEFAULT: restore last line to previous state (undoable)
U                   MINE: redo last change
c-r                 redo last change


COPY-PASTE (Visual Mode)
v[movements]        Enter Visual Mode and select some text
y                   Copy Visual Selection
d                   Cut Visual Selection


COPY-PASTE (Normal-Mode)
d[motion]           Cut text defined by motion to default register
dd                  Cut line to default register
y[motion]           Copy text defined by motion to default register
yy                  Copy line to default register
p                   Paste from default register


COPY-PASTE (SPECIAL-REGISTERS)
* is system clipboard for windows
+ is system clipboard for osx
"ky[motion]         Copy text defined by motion to register k
"Ky[motion]         Append text defined by motion to register k
"kp                 Paste text in register k
:reg                List defined registers
>p                  Paste after linewise, increasing indent
>P                  Paste before linewise, increasing indent
<p                  Paste after linewise, decreasing indent
<P                  Paste before linewise, decreasing indent
=p                  Paste after, reindenting
=P                  Paste before, reindenting
]p                  Paste after, linewise, matching indent
]P                  Paste before, linewise, matching indent
[p                  Paste after, linewise, matching indent
[P                  Paste before, linewise, matching indent


DELETING
xX                  delete to the right/left of point
J                   Join Lines
dd                  Delete line
d[motion]           delete through that motion


CASE-CHANGES
gU[motion]          uppercase change
gu[motion]          lower case change


SEARCH
/regexp             Find regexp forward
?regexp             Find regexp backward
nN                  Next / Prev find
g*                  search for the word under the cursor (like *, but g* on 'rain' will find words like 'rainbow').
g#                  same as g* but in backward direction.


SEARCH & REPLACE
http://vim.wikia.com/wiki/Search_and_replace
http://vim.wikia.com/wiki/Search_and_replace_in_multiple_buffers
:%s/foo/bar/g       Find each occurrence of 'foo' (in all lines), and replace it with 'bar'.
:s/foo/bar/g        Find each occurrence of 'foo' (in the current line only), and replace it with 'bar'.
:%s/foo/bar/gc      Change each 'foo' to 'bar', but ask for confirmation first.
:%s/\<foo\>/bar/gc  Change only whole words exactly matching 'foo' to 'bar'; ask for confirmation.
:%s/foo/bar/gci     Change each 'foo' (case insensitive due to the i flag) to 'bar'; ask for confirmation.
:%s/foo/bar/gcI     Change each 'foo' (case sensitive due to the I flag) to 'bar'; ask for confirmation.
:.,+2s/foo/bar/g    Change each 'foo' to 'bar' for the current line (.) and the two next lines (+2).
:g/^baz/s/foo/bar/g Change each 'foo' to 'bar' in each line starting with 'baz'.
:.,$s/foo/bar/g     Change each 'foo' to 'bar' for all lines from the current line (.) to the last line ($) inclusive.
:'a,'bs/foo/bar/g   Change each 'foo' to 'bar' for all lines from mark a to mark b inclusive
:5,12s/foo/bar/g   	Change each 'foo' to 'bar' for all lines from line 5 to line 12 (inclusive).


MACROS
http://vim.wikia.com/wiki/Macros
q<letter><commands>q    Record your macro
@<letter>               Play your macro back


LINE-WISE ACTIONS
:[range]g/pattern/cmd   executing the Ex command cmd for each line matching pattern in a range


XML
[x{motion}          encode
[xx                 encode tag?
{Visual}[x          encode
]x{motion}          decode
]xx                 decode
{Visual}]x          decode


URLs
[u{motion}          encode
[uu                 encode
{Visual}[u          encode
]u{motion}          decode
]uu                 decode
{Visual}]u          decode


C Strings
[y{motion}          encode
[yy                 encode
{Visual}            encode
]y{motion}          decode
}yy                 decode
{Visual}]y          decode


