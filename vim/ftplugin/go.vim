function! GoplsImports(buffer) abort
    let l:executable = ale#Var(a:buffer, 'go_gopls_fix_executable')
    let l:env = ale#go#EnvString(a:buffer)

    if !executable(l:executable)
        return 0
    endif

    return {
    \   'command': l:env . ale#Escape(l:executable)
    \       . ' imports'
    \       . ' -l -w %t',
    \   'read_temporary_file': 1,
    \}
endfunction

execute ale#fix#registry#Add('goplsimports', 'GoplsImports', ['go'], 'gopls imports')

let g:ale_fix_on_save = 1
" let b:ale_fixers = ['gofmt', 'goimports']
" let b:ale_fixers = ['gofumpt']
let b:ale_fixers = ['gopls', 'goplsimports']

" let b:ale_linters = ['gopls', 'govet']
let b:ale_linters = ['gopls']
