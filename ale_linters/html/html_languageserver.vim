" Author: Mitchell Hanberg <mitch@mitchellhanberg.com>
" Description: vscode-html-languageserver-bin integration (https://github.com/vscode-langservers/vscode-html-languageserver-bin)

function! ale_linters#html#html_languageserver#GetProjectRoot(buffer) abort
    let l:git_path = ale#path#FindNearestDirectory(a:buffer, '.git')

    return !empty(l:git_path) ? fnamemodify(l:git_path, ':h:h') : ''
endfunction

call ale#linter#Define('html', {
\   'name': 'html-languageserver',
\   'lsp': 'stdio',
\   'executable': 'html-languageserver',
\   'project_root_callback':'ale_linters#html#html-languageserver#GetProjectRoot'
\})
