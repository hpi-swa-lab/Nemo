as yet unclassified
testCompleteWordInStringBeforeIndex

	self assert: 'abc' equals: (BPStringUtil completeWordIn: 'abc' before: 4).
	self assert: 'abc' equals: (BPStringUtil completeWordIn: 'abc ' before: 4).
	self assert: 'abc' equals: (BPStringUtil completeWordIn: 'abc ' before: 5).

	self assert: 'abc' equals: (BPStringUtil completeWordIn: 'abc def' before: 7).
	self assert: '' equals: (BPStringUtil completeWordIn: 'abc' before: 2).