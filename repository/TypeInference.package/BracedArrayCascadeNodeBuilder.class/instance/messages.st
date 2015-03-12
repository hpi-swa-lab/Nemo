as yet unclassified
messages
	| messages |
	messages := elements collect: [:element | self messageFor: element ].
	^ messages copyWith: self endMessage.