as yet unclassified
receiverAtCaret

	| nodeAtCaret |
	nodeAtCaret := self nodeAtCaret.

	nodeAtCaret isMethod ifTrue: [ ^ nil ].
	nodeAtCaret isSequence ifTrue: [ ^ nil ].

	nodeAtCaret isMessage ifTrue: [
		self startIndex < nodeAtCaret stop ifTrue: [ nodeAtCaret := nodeAtCaret receiver. ].
	].

	^ nodeAtCaret