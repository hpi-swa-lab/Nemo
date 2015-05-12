word detection
wordIn: aString before: anInteger

		| wordPosition |
		wordPosition := self wordIn: aString before: anInteger.
		^ aString copyFrom: wordPosition first to: wordPosition last.