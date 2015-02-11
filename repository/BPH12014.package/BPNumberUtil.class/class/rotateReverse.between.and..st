as yet unclassified
rotateReverse: aCurrentInteger between: aMinInteger and: aMaxInteger

	aCurrentInteger = aMinInteger
		ifTrue: [ ^ aMaxInteger ]
		ifFalse: [ ^ aCurrentInteger - 1 ].