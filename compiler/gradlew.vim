echom "gradlew.vim"

if exists("current_compiler")
    echom "gradlew.vim - current_compiler does exist"
    finish
endif

echom "gradlew.vim - current_compiler does not exist"

let s:gradlew = escape(findfile('gradlew', '.;') . " -b " . findfile('build.gradle', '.;'), ' \')
let current_compiler = s:gradlew

echom "gradlew.vim - s:gradlew = " . s:gradlew

"
" Found much of this code on stackoverflow, where the following
" code was associated with the following comment:
"
" older Vim always used :setlocal
"
" TODO: Understand what that means.
"

if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo-=C

execute "CompilerSet makeprg=" . s:gradlew
CompilerSet errorformat=
            \%f:%l:\ %m,
            \%-G:%.%#,
            \%-G%\\s%#,
            \%-GIncremental%.%#,
            \%-GBUILD\ SUCCESSFUL,
            \%-GTotal\ time:\ %.%#

let &cpo = s:save_cpo
unlet s:save_cpo
