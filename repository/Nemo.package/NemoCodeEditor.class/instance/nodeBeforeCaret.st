editor accessing
nodeBeforeCaret

	| node index |
	node := self nodeAtCaret ifNil: [ ^ nil ].
	index := NemoStringUtil firstNonWhitespaceIndexIn: self string before: self startIndex - 1.
	(self string at: index) = $.
		ifTrue: [ ^ nil ].
	^ self startIndex > node stop
		ifTrue: [ node ]
		ifFalse: []