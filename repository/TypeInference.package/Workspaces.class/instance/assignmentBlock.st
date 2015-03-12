as yet unclassified
assignmentBlock
" 
	self new assignmentBlock.
	Logger show.
"
 | expression | 

expression  := 'TObject assignedBlock'.
self realType: expression .
^self infere: expression. 