as yet unclassified
testFirstNonWhitespacePositionInStringBeforeIndex

	self assert: 1 equals: (NemoStringUtil firstNonWhitespaceIndexIn: 'a' before: 1).
	self assert: 3 equals: (NemoStringUtil firstNonWhitespaceIndexIn: 'abc' before: 3).
	self assert: 3 equals: (NemoStringUtil firstNonWhitespaceIndexIn: 'abc ' before: 4).
	self assert: 3 equals: (NemoStringUtil firstNonWhitespaceIndexIn: 'abc   ' before: 6).
	self assert: 3 equals: (NemoStringUtil firstNonWhitespaceIndexIn: 'abc   ' before: 7).
	self assert: 1 equals: (NemoStringUtil firstNonWhitespaceIndexIn: 'ab' before: 1).
	self assert: 2 equals: (NemoStringUtil firstNonWhitespaceIndexIn: 'ab' , Character cr before: 3).
	self assert: 1 equals: (NemoStringUtil firstNonWhitespaceIndexIn: 'a' before: 0).