as yet unclassified
testCompleteWordInStringBeforeIndex

	self assert: 'abc' equals: (NemoStringUtil completeWordIn: 'abc' before: 4).
	self assert: 'abc' equals: (NemoStringUtil completeWordIn: 'abc ' before: 4).
	self assert: 'abc' equals: (NemoStringUtil completeWordIn: 'abc ' before: 5).

	self assert: 'abc' equals: (NemoStringUtil completeWordIn: 'abc def' before: 7).
	self assert: '' equals: (NemoStringUtil completeWordIn: 'abc' before: 2).