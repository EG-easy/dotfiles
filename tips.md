# Tips

## Vim Command


### Register

```
"ay
"ap
```

```
qa your command q
@a
```

### buffer move
```
:ls 
:b {number} 
:bnext
```

```vim
" move among buffers with CTRL
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
```

### copy to clipboard
select with visual mode
```
"+y
```

### move between terminal and vim
```
Ctrl+Z
fg
```

### ctags
```vim
ctags -R
# function jump
ctrl ]
```

### tab
```
:tabe
gt
```

