as yet unclassified
blockWithArgumentValue
" 
	TObject blockWithArgumentValue.
	self new blockWithArgumentValue.
"
 | expression  i r | 

expression  := 'TObject blockWithArgumentValue'.
r := self realType: expression .
i := self infere: expression. 
