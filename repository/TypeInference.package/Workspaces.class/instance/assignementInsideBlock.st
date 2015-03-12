as yet unclassified
assignementInsideBlock
" 
	self new assignementInsideBlock.
	Logger show.
"
 | expression r i | 

expression  := 'TObject assignementInsideBlock'.

r := self realType: expression .
i := self infere: expression. 
