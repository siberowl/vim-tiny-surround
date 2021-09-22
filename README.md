# tiny-surround.vim

This plugin is used to modify the surroundings which include (, [, {, <, ", ', and anything supported by the vi command.

Examples (the asterisk * denotes the cursor position):

  Old text                  Command     New text ~
  This is a [sent*ence]     dsw         This is a sent*ence
  "Hello *world!"           ds"         Hello *world!
  This is a [sent*ence]     csw"        This is a "sent*ence"
  {a+*b/(c-d)}              cs{(        (a+*b/(c-d))
  This is a [sent*ence]     viwS"       This is a ["sent*ence"]

## MAPPINGS

Delete surroundings (normal mode): ds followed by w or a surroundings to delete
Change surroundings (normal mode): cs followed by w or a surroundings to change
Add surroundings (visual mode): S followed by a surroundings to add

## OPTIONS

To turn off mappings:
```
let g:tiny_surround_no_mappings = "true"
```
