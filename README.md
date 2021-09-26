# tiny-surround.vim

A minimalist plugin for modifying the surroundings that works just like the native inner commands.

## EXAMPLES (the asterisk * denotes the cursor position)

| Old text | Command | New text |
| --- | --- | --- |
|  This is a \[sent\*ence] | dsw | This is a sent\*ence |
|  "This is a sent\*ence"       | ds" | This is a sent\*ence |
|  This is a sent\*ence | csw" | This is a "sent\*ence" |
|  (a+\*b/(c-d))          | cs({ | {a+\*b/(c-d)} |
| block(() => {<br>&nbsp;&nbsp;if (isBlock) {<br>&nbsp;&nbsp;&nbsp;&nbsp;return "this is* a block";<br>&nbsp;&nbsp;}<br>  }); | csb{ | block{() => {<br>&nbsp;&nbsp;if (isBlock) {<br>&nbsp;&nbsp;&nbsp;&nbsp;return "this is* a block";<br>&nbsp;&nbsp;}<br>  }}; |
|  This is a \[sent\*ence] | vawS( | This is a (\[sent\*ence]) |

Refer to `:help text-object` for all the commands supported (replacing the `i`'s and `a`'s with `s`).

## INSTALLATION

Using [vim-plug](https://github.com/junegunn/vim-plug):
```
Plug 'siberowl/vim-tiny-surround'
```

## MAPPINGS

| Command | Mapping | Usage |
| --- | --- | --- |
| `<Plug>DeleteSurround` | `nmap ds <Plug>DeleteSurround` | Delete the surroundings in normal mode |
| `<Plug>ChangeSurround` | `nmap cs <Plug>ChangeSurround` | Change or replace the surroundings in normal mode |
| `<Plug>AddSurround` | `xmap S <Plug>AddSurround` | Add a surroundings in visual mode |

## OPTIONS

To turn off mappings:
```
let g:tiny_surround_no_mappings = "true"
```

## CONTRIBUTION

Contributions are welcome! Just submit an issue for a bug or a PR for a fix/new feature and I'll check it out.
