private-processing
retrieveStaticData
	"Try to look up information about the current token at caret
	from the static info we have stored in the class."

	BPBookshelf markovChainBook markovChain at: self variableToken type 
		ifPresent: [ :x | x at: self variableName
			ifPresent: [ :y | self addEntry: y forToken: self variableToken andCode: self variableName]]