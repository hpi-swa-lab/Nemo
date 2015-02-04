private-processing
retrieveStaticData
	"Try to look up information about the current token at caret
	from the static info we have stored in the class."

	self tokenToToken at: self variableToken type put: 
		(BPMarkovFilter tokenToToken at: self variableToken type ifAbsent: [ Bag new ]).

	self tokenToSource at: self variableToken type put: 
		(BPMarkovFilter tokenToSource at: self variableToken type ifAbsent: [ Bag new ]).

	self sourceToSource at: self variableName put: 
		(BPMarkovFilter sourceToSource at: self variableName ifAbsent: [ Bag new ])