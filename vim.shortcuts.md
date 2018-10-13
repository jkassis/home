BUFFERS
http://vim.wikia.com/wiki/Easier_buffer_switching<Paste>
:ls                 list all buffers (aka :buffers)
:b                  change to buffer (aka :bu :buf :buffer)
:

WINDOWS
ctrl-[hjkl]         Navigate Windows

TABS

CHANGING
c[movement]         change something to something else

INSERTING
iI                  insert to the left of point / line
aA                  insert to the right of point / line

INDENTING
<>                  indent visual selection left / right

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
