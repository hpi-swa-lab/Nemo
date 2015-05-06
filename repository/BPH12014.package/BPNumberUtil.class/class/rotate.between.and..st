as yet unclassified
rotate: aCurrentInteger between: aMinInteger and: aMaxInteger

	aCurrentInteger = aMaxInteger
		ifTrue: [ ^ aMinInteger ]
		ifFalse: [ ^ aCurrentInteger + 1 ].