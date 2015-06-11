editor accessing
wordBeforeCaret

		| wordPosition |
		wordPosition := self wordPositionBeforeCaret.
		wordPosition last < 1 ifTrue: [ ^ '' ].
		^ self string copyFrom: wordPosition first + 1 to: wordPosition last.