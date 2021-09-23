# tiny-surround.vim

This is a super minimal plugin used to modify the "surroundings" which include (, \[, {, <, ", ', etc.

Inspired by: https://github.com/tpope/vim-surround

Unlike vim-surround, vim-tiny-surround aims to be as analogous as possible to the existing inner command while staying extremely lightweight (less than 2kb of code) .

Examples (the asterisk * denotes the cursor position):

| Old text | Command | New text |
| --- | --- | --- |
|  This is a \[sent\*ence] | dsw | This is a sent\*ence |
|  "Hello \*world!"       | ds" | Hello \*world! |
|  This is a sent\*ence | csw" | This is a "sent\*ence" |
|  (a+\*b/(c-d))          | cs({ | {a+\*b/(c-d)} |
|  This is a \[sent\*ence] | viwS" | This is a \["sent\*ence"] |

## INSTALLATION

Using [vim-plug](https://github.com/junegunn/vim-plug):
```
Plug 'siberowl/vim-tiny-surround'
```

## MAPPINGS

Delete surroundings (normal mode): *ds* followed by *w* or a "surroundings" to delete

Change surroundings (normal mode): *cs* followed by *w* or a "surroundings" to change followed by the new "surroundings".

Add surroundings (visual mode): *S* followed by a "surroundings" to add

## OPTIONS

To turn off mappings:
```
let g:tiny_surround_no_mappings = "true"
```
