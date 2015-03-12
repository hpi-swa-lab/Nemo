as yet unclassified
assignementInsideTwoBlocks
" 
	self new assignementInsideTwoBlocks.
	Logger show.
"
 | expression r i | 

expression  := 'TObject assignementInsideTwoBlocks'.

r := self realType: expression .
i := self infere: expression. 