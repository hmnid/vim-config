nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>rn :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <leader>gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <leader>rr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <leader>sf :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <leader>ss :call LanguageClient#workspace_symbol()<CR>
"nnoremap <silent> <leader>ss :call LanguageClient#workspace_symbol()<CR>

let g:LanguageClient_loggingFile = expand('~/.vim/LanguageClient.log')
let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_selectionUI = 'fzf'
let g:LanguageClient_settingsPath = expand('~/.vim/lsp-settings.json')

silent !mkdir expand('~/.vim/cquery')

let g:LanguageClient_rootMarkers = ['.arcadia.root', '.root']  " cheers m8!

let g:LanguageClient_serverCommands = {
      \ 'python': ['env', 'PYTHONPATH=/home/hmnid/.config/nvim/python-vim-env/lib/python3.10/site-packages', g:python3_host_prog, '-m', 'pylsp', '--verbose', '--check-parent-process', '--log-file', expand('~/.vim/pylsp.log')],
      \ 'c': ['clangd'],
      \ 'cpp': ['clangd'],
      \ 'go': ['env', 'GOPATH=/home/hmnid/arcgo', 'go-langserver'],
      \ 'java': ['env', 'JAVA_HOME=/usr/lib/jvm/jdk-15.0.1/', 'bash', '-c', '/home/hmnid/.vim/java-language-server/dist/lang_server_linux.sh 2> /tmp/log.txt'],
      \ 'rust': ['rls']
      \ }

set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
