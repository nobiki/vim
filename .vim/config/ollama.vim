" Use Python virtual environment (and install packages via pip)
let g:ollama_use_venv = 1
" Ollama base URL
let g:ollama_host = 'http://127.0.0.1:11434'

" コード補完
let g:ollama_model = 'starcoder2:3b'

" チャット・レビュー
let g:ollama_chat_model = 'llama3.2:3b'
let g:ollama_edit_model = 'llama3.2:3b'

" 補完に際にモデルに渡すカーソル前後のコードの行数
let g:ollama_context_lines = 20

" 入力が止まってから、補完を開始するまでの待ち時間(ミリ秒)
let g:ollama_debounce_time = 300

" このファイルタイプだけ入力補完を行う
let g:ollama_completion_allowlist_filetype = ['sh', 'markdown', 'terraform', 'python']
" このファイルタイプは入力補完を行わない
"let g:ollama_completion_denylist_filetype = []

" チャットに渡すプロンプト
let g:ollama_chat_systemprompt = 'Always respond in Japanese (日本語で回答してください). Keep code, identifiers and technical terms in English. Be concise.'

" ================
" キーバインド
" ================
" AIの提案を「すべて」確定
imap <silent> <C-j> <Tab>
" AIの提案を「1単語」だけ確定
imap <silent> <C-f> <M-C-Right>
" AIの提案を「1行」だけ確定
imap <silent> <C-l> <M-Right>

" デバッグ・ログ設定
" let g:ollama_debug = 4
" general log file location
" let g:ollama_logfile = '/tmp/logs/vim-ollama.log'
" ollama chat conversation log
"let g:ollama_review_logfile = '/tmp/logs/vim-ollama-review.log'

" Setting to display suggestions manually instead of automatically
" let g:ollama_debounce_time = 0
" imap <silent> <C-l> <Plug>(ollama-trigger-completion)
" vim: filetype=vim.ollama

