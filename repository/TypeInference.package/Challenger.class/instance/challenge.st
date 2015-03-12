challenging
challenge
	| a b answer |
	a := 10 atRandom.
	b := 10 atRandom.
	answer := FillInTheBlank
		request: 'How much is ', a printString, ' x ' , b printString, '?'.
	answer asNumber = (a * b)
		ifTrue: [self inform: self congratulation]
		ifFalse: [self inform: self punish, '. It is  ', (a * b) printString]
	