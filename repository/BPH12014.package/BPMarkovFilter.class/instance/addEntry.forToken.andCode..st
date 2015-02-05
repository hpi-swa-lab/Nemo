private-processing
addEntry: aBag forToken: aToken andCode: aString

	self markovChain at: aToken type ifAbsentPut: [ Dictionary new  ].
	(self markovChain at: aToken type) at: aString put: aBag