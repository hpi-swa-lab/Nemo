editor accessing
wordBeforeCaret

		| wordPosition |
		wordPosition := self wordPositionBeforeCaret.
		^ self string copyFrom: wordPosition first + 1 to: wordPosition last.