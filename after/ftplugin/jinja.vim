" Set syntax=on for working with treesitter
" https://github.com/HiPhish/jinja.vim?tab=readme-ov-file#note-regarding-neovim-and-tree-sitter
"
if !get(b:, 'jinja_syntax_autocmd_loaded', v:false)
        if luaeval("vim.treesitter.language.get_lang('jinja')") == v:null
                autocmd FileType <buffer> if !empty(&ft) | setlocal syntax=on | endif
        endif
        let b:jinja_syntax_autocmd_loaded = v:true
endif
