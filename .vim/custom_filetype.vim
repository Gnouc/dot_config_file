" Salt state files
augroup sls
    au!
    " Function to setting sls file
    fun! Slsconfig()
        if getline(1) =~# '\v^#!py(dsl|)$'
            set filetype=python
            call Set_tab_spaces(4)
        else
            set filetype=yaml
            call Set_tab_spaces(2)
        endif
    endfunction

    au BufRead,BufNewFile *.sls call Slsconfig()
augroup END

" Python
augroup python
    au!
    fun! Python_config()
        NeoBundleSource vim-python-pep8-indent
        NeoBundleSource pep8
        let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
        let g:jedi#popup_on_dot = 0
    endf
    au Filetype python :call Python_config()
augroup END

" Javascript
augroup javascript
    au!
    au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
augroup ENd


" HTML
augroup html
    au!
    au FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
augroup END

" PHP
augroup php
    au!
    au FileType php set omnifunc=phpcomplete#CompletePHP
augroup END

" Haskell
augroup haskell
    au!
    au FileType haskell set omnifunc=necoghc#omnifunc
    let g:necoghc_enable_detailed_browse = 1
augroup END

" Lua
augroup lua
    au!
    fun! Lua_config()
        let g:lua_safe_omni_modules = 0
        let g:lua_define_omnifunc = 0
        let g:lua_complete_omni = 0
        call Set_tab_spaces(2)
    endf
    au Filetype lua :call Lua_config()
augroup END

" Shell
augroup shell
    au!
    au Filetype sh,zsh,tcsh,csh :call Set_tab_spaces(2)
augroup END
