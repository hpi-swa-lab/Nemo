converting
asText
	| styledText formattedTokenTexts resultText |
	styledText := BPParserUtil styleCode: self methodReference sourceCode inClass: self methodReference actualClass.
	formattedTokenTexts := self tailTokens allButFirst
		collect: [ :token | styledText copyFrom: token start to: token end ].
	resultText := Text streamContents: [ :stream | 
		formattedTokenTexts do: [ :tokenText | stream
			nextPutAll: tokenText;
			nextPutAll: ' ' asText ] ].
	^ resultText append: ' (' , self count asString , ')'