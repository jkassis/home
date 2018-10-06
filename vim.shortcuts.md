BUFFERS
http://vim.wikia.com/wiki/Easier_buffer_switching<Paste>
:ls                 list all buffers (aka :buffers)
:b                  change to buffer (aka :bu :buf :buffer)
:

WINDOWS
ctrl-[hjkl]         Navigate Windows

TABS


INSERTING
iI                  insert to the left of point / line
aA                  insert to the right of point / line

INDENTING
<>                  with visual selection

UNDO
u                   undo last change
U                   DEFAULT: restore last line to previous state (undoable)
U                   MINE: redo last change
c-r                 redo last change

DELETING
xX                  delete to the right/left of point
J                   Join Lines
dd                  Delete line
d[motion]           delete through that motion

SEARCHING
/regexp             Find regexp forward
?regexp             Find regexp backward
nN                  Next / Prev find

GOING
gd                  will take you to the local declaration.
gD                  will take you to the global declaration.
g*                  search for the word under the cursor (like *, but g* on 'rain' will find words like 'rainbow').
g#                  same as g* but in backward direction.
gg                  goes to the first line in the buffer (or provide a count before the command for a specific line).
G                   goes to the last line (or provide a count before the command for a specific line).
linenum shift-G     goes to the line number
%                   go to other side of braces
