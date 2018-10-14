DISCOVERING BINDINGS
use ":help {key}^D" to find out if
a key is used for some command.  ({key} is the specific key you want to find
out about, ^D is CTRL-D)


HELP WITH MAPPINGS
https://neovim.io/doc/user/map.html


BUFFERS
http://vim.wikia.com/wiki/Easier_buffer_switching<Paste>
:ls                 list all buffers (aka :buffers)
:b                  change to buffer (aka :bu :buf :buffer)
:

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

MOVING
hjkl                move left, down, up, right
()                  move back/forward one sentence
[]                  move to next/prev curly-bracket sections
{}                  move to next/previous blank-line separated section
tk                  move fwd until character k
Tk                  move bak until character k
fk                  move fwd to character k
Fk                  move bak to character k
w                   move fwd to start of word
W                   move fwd to start of WORD
e                   move fwd to end of word
E                   move fwd to end of WORD
b                   move bak to start of word
B                   move bak to start of WORD
0                   move to column zero (beginning of line)
|                   move to column zero (beginning of line)
$                   move to end of line
;                   repeat last 'f', 'F', 't', or 'T' Command
<C-f>               forward one screen
<C-b>               backward one screen
<C-D>               down half-screen


MARK AND MOVE
'k                   move to mark, first non-whitespace
`k                   move to marked line, memorized column
mk                  set mark k to cursor position

-                   move to first non-whitespace of previous line
^                   move to first non-whitespace of line
_                   move to first non-whitespace of line
+                   move to first non-whitespace of next line

FILTERING
=                   filter through external program

WHITELINES
up-arrow            add whitespace one line up
shift up-arrow      remove whitespace one line up
down-arrow          add whitespace one line down
shit down-arrow     remove whitespace one line down

CHANGING / REPLACING
c[movement]         change characters in movements (delete them and goto insert mode)
nsk                 change n characters (delete them and goto insert mode)
nrk                 delete n characters and fill with k

INSERTING
iI                  insert to the left of point / line
aA                  insert to the right of point / line

INDENTING / SHIFTING
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

SEARCH & REPLACE
http://vim.wikia.com/wiki/Search_and_replace
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



GOING
gd                  will take you to the local declaration.
gD                  will take you to the global declaration.
g*                  search for the word under the cursor (like *, but g* on 'rain' will find words like 'rainbow').
g#                  same as g* but in backward direction.
gg                  goes to the first line in the buffer (or provide a count before the command for a specific line).
G                   goes to the last line (or provide a count before the command for a specific line).
linenum shift-G     goes to the line number
%                   go to other side of braces

MACROS
http://vim.wikia.com/wiki/Macros
q<letter><commands>q    Record your macro
@<letter>               Play your macro back

LINE-WISE ACTIONS
:[range]g/pattern/cmd   executing the Ex command cmd for each line matching pattern in a range