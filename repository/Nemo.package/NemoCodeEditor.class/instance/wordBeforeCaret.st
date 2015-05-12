editor accessing
wordBeforeCaret

		| wordPosition |
		wordPosition := self wordPositionBeforeCaret.
		^ self string copyFrom: wordPosition first to: wordPosition last.