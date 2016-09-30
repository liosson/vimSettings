"   :w save
"   :q quit
"   . to repeat last edit command
" TODO: This mappings do not work
"   map <c-q> :wq<CR>
"   map <c-s> :w<CR>

" Getting help
"   :help
"   :help cmd
"   :e ctrl-d to show available command that start with e

" Insert mode
"   i to switch to insert mode under the cursor
"   I or ^i to go to first non blank chaaracter of the line and start inserting
"   o or $a<CR> open a line below and switch to insert mode
"   O open a line above and switch to insert mode
"   a start appending text after the cursor
"   A or $a start appending text at the end of the line
"   R start replacing text under the cursor

" Visual mode
"   V to select the line, j & k to navigate
"   v to enter visual selection, j, k, h, l to navigate
"   ctrl-v to enter block visual selection, j, k, h, l to navigate
"   :help \%V to know how to search within selected block

" movements (can add numbers e.g. 3w):
"   w to move to the beginning of the next word;
"   e to move to the end of the current word;
"   b to move to the beginning of the word;
"   $ to move to the end of line;
"   0 to move to the start of the line
"   ^ to move to the first non blank character of the line
"   gg to move to the beginning of the file
"   G to move to the end of the file
"   numG to move to specific line num
"   ctrl-g shows you which line you are on
"   ctrl-o to go back
"   ctrl-i to go forward
"   :jumps to see all the positions you can jump
"   :changes to see all the positions you made changes
"   g; and g, to navigate changes
"   % to go to the matching bracket
"   c-e move screen down without moving the cursor
"   c-e move screen up without moving the cursor

" search
"   /term to search for term
"   n next occurance
"   N previous occurance
"   ?term to search for term in reverse direction
"   :set ic to ignore case
"   :set noic to remove ignore case
"   [line range]/g/[pattern/[cmd] to execute cmd globally on pattern

" substitute or replace
"   :s/term1/term2 to substitute first appearence of term1 in the line to term2
"   :s/term1/term2/g to substitute all appearences of term1 in the line to term2
"   :#,#s/term1/term2/g to substitute all appearances between lines
"   :%s/term1/term2/g to substitute all appearances in the file
"   :%s/term1/term2/gc use gc to have a prompt for each substitution

" Extract/Insert to/from external files
"   v to highlight the text
"   gv to highlight the last selected text
"   :w filename to copy selected text to the filename
"   :r filename to retrieve filename contents and put them under cursor
"   :r !ls to retrieve ls output and put contents under cursor

" undo-redo
"   u for undo
"   U for undo the whole line
"   ctrl-r to redo

" character manipulation
"   x delete under cursor
"   xi or s delete under cursor and go to insert mode
"   rx replace under cursor to x

" word manipulation
"   ce change to the end of the word
"   c$ or C change to the end of the line
"   S delete current line and go to insert mode
"   ci} change inside {}
"   ci) change inside ()
"   di) delete insied ()
"   ca} change around {} where a stands for around
"   daw delete around word

" dw delete word, cursor on the beginning of the word
" bdw delete word, cursor anywhere on the word
" d$ delete from cursor to the end of line
" help cmd get help
" y yank
" p paste below current line
" P paste above current line

" macros
"   q{macroName}[cmd]q to record a macro
"   [number]@{macroName} to execute a macro
"   qavwr_jq @a 3@a to replace word with underscores

" Show line numbers
set number

" Highlight current line
set cursorline
" ctermbg: background color, ctermfg: text color
hi CursorLine   cterm=NONE ctermbg=darkblue ctermfg=white

" Turn syntax highlight
syntax on

" make sure we are not in compatible mode
set nocp

" [num]>> to indent lines to the right
" [num]<< to indent lines to the left
" = to re-indent lines
" set autoindent and smartindent
set ai
set si

" tabs and spaces
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
" :retab! to change all tabs to spaces
" /g/^$/d to delete all empty lines

" TODO check how it works
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" strip all trialing spaces when saving any file type
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" invisible characters
"  :set list to show invisible chars
"  :set nolist to hide invisible chars

" tab manipulation
"   :tabe filename to open new tab
"   :tabn next tab
"   :tabp previous tab
"   :sp [filename] to split current window
"   :pwd to get current tab working dir
"   :cd to set current tab working dir

" remapping prev/next tab actions
map <F6> :tabp<CR>
map <F7> :tabn<CR>

" window manipulation
"   c-w s split current window horizontally
"   c-w v split current window vertically
"   :on[ly] close all windows except the current one
"   c-w up, c-w down to move focus between windows
"   c-w T move current split window into its own tab

" Exploring/Manipulating the filesystem
"   e . open directory view at current working directory
"   tabe . open directory view in the new tab at current working directory
"   sp . open directory view in the horizontal split at current working directory
"   vs . open directory view in the vertical split at current working directory
"   E[xplore] open directory view in the current file directory
"   Sex[plore] open directory view int the horizontal split in the current file directory
"   Vex[plore] open directory view int the vertical split in the current file directory
"   % create a new file
"   d create a new directory
"   R rename under cursor
"   D delete under cursor
"   :help netrw

" sessions
"   :mksession mysession.vim
"   :source mysession.vim
"   vim -S mysession.vim

