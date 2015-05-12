word detection
completeWordIn: aString before: anInteger

		| wordPosition |
		wordPosition := self completeWordPositionIn: aString before: anInteger.
		^ aString copyFrom: wordPosition first to: wordPosition last.