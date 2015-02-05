private-processing
process

	self markovList: ((self markovChain at: self variableName) sortedCounts asPipe
		collect: [ :x | x value join: ' ' ];
		select: [ :x | (x key > 1) and: [ x value startsWithDigit not] ];
		collect: [ :x | x value ];
		do).