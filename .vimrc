"设置utf-8编码
set encoding=utf-8

" 开启语法高亮
syntax enable

" 设置背景颜色
" dark：暗色主题，light：亮色主题
set background=dark

" 设置缩进为四个空格
set tabstop=4
set shiftwidth=4
set expandtab

" 显示行号
set number

" 设置自动缩进
set autoindent

" 启用搜索时忽略大小写
set ignorecase

" 启用增量搜索
set incsearch

set backspace=indent,eol,start

" 开启鼠标支持
set mouse=a
filetype off                  " 必须在插件之前设置
" 设置 Vundle 运行路径和插件目录
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 插件列表
"Plugin '插件名称'
" 可以添加更多插件...
Plugin 'git@github.com:vim-airline/vim-airline.git'
Plugin 'git@github.com:preservim/nerdtree.git'
Plugin 'git@github.com:ycm-core/YouCompleteMe.git'
Plugin 'git@github.com:google/vim-maktaba'
Plugin 'git@github.com:google/vim-codefmt'
Plugin 'git@github.com:google/vim-glaive'
"Plugin 'git@github.com:octol/vim-cpp-enhanced-highlight'
"Plugin 'git@github.com:bfrg/vim-cpp-modern'
"Plugin 'godlygeek/tabular'
"Plugin 'preservim/vim-markdown'
call vundle#end()            " 必须在这行之前
call glaive#Install()

Glaive codefmt plugin[mappings]

filetype plugin indent on    " 必须在这行之后
autocmd VimEnter * NERDTree



" 启用 YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

" 启用语义补全
"let g:ycm_semantic_triggers =  {
 "    \ 'c,cpp,objc,objcpp' : ['re!\w{2}'],
  "   \ 'java' : ['re!@|\\.'],
   "  \ }
" YouCompleteMe配置
" 启用基于语言服务器协议的补全（可选）
let g:ycm_language_server_enable = 1
let g:ycm_clangd_binary_path='/usr/bin/clangd'
let g:ycm_server_language=['clangd','python']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_enable_inlay_hints=1
"函数签名
let g:ycm_auto_trigger=1
" 使用ycm来高亮代码
let g:ycm_enable_semantic_highlighting=1
call prop_type_add('YCM_HL_typeParameter', {'highlight':'Type'})
call prop_type_add('YCM_HL_parameter', {'highlight':'Identifier'})
call prop_type_add('YCM_HL_variable', {'highlight':'Normal'})
call prop_type_add('YCM_HL_property', {'highlight':'PreProc'})
call prop_type_add('YCM_HL_enumMember', {'highlight':'Constant'})
call prop_type_add('YCM_HL_event', {'highlight':'Special'})
call prop_type_add('YCM_HL_struct', {'highlight':'Structure'})
call prop_type_add('YCM_HL_method', {'highlight':'Function'})
call prop_type_add('YCM_HL_class', {'highlight':'Special'})
call prop_type_add('YCM_HL_namespace', {'highlight':'Comment'})
call prop_type_add( 'YCM_HL_keyword', { 'highlight': 'Keyword' } )
call prop_type_add( 'YCM_HL_number', { 'highlight': 'Number' } )
call prop_type_add('YCM_HL_string', {'highlight':'String'})
call prop_type_add('YCM_HL_comment', {'highlight':'Comment'})
call prop_type_add('YCM_HL_function', {'highlight':'Function'})
call prop_type_add('YCM_HL_boolean', {'highlight':'Boolean'})
call prop_type_add('YCM_HL_float', {'highlight':'Float'})
call prop_type_add('YCM_HL_label', {'highlight':'Label'})
call prop_type_add('YCM_HL_operator', {'highlight':'Operator'})
call prop_type_add('YCM_HL_exception', {'highlight':'Exception'})

nnoremap <leader>gd:YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf:YcmCompleter GoToDefinition<CR>
nnoremap <leader>gr:YcmCompleter GoToReferences<CR>
nnoremap <leader>go:YcmCompleter GoTo<CR>

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
  autocmd FileType swift AutoFormatBuffer swift-format
augroup END

" Disable function highlighting (affects both C and C++ files)
"let g:cpp_function_highlight = 1

" Enable highlighting of C++11 attributes
"let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
"let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
"let g:cpp_simple_highlight = 1
"let g:cpp_class_scope_highlight=1
"let g:cpp_member_variable_highlight=1
"let g:cpp_class_decl_highlight=1
"let g:cpp_posix_standard=1
"let g:cpp_experimental_template_highlight=1
"let g:cpp_concepts_highlight=1


" 打开/关闭 Nerdtree
map <Leader>n :NERDTreeToggle<CR>


