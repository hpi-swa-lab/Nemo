converting
asText
	| styler styledText formattedTokenTexts resultText |
	styler := SHTextStylerST80 new.
	styler classOrMetaClass: self method actualClass.
	styledText := (styler styledTextFor: self method sourceCode).
	formattedTokenTexts := self tailTokens allButFirst
		collect: [ :token | styledText copyFrom: token start to: token end ].
	resultText := Text streamContents: [ :stream | 
		formattedTokenTexts do: [ :tokenText | stream
			nextPutAll: tokenText;
			nextPutAll: ' ' asText ] ].
	^ resultText append: ' (' , self count asString , ')'