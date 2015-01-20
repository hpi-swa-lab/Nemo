search
classOf: trialValue match: anAnswer
	"closeTo: did return true for these two objects.  However, we insisit that the class of our computed value really be the same as the answer.  Don't let #= convert types for us.  If asNumber needs to be sent, discover that later, in stage 2."

	| clsNames |
	clsNames := #(SmallInteger Float ByteString ByteSymbol "<- most common" LargeInteger LargeNegativeInteger Fraction Character String Symbol).
	trialValue class == anAnswer class ifTrue: [^ true].
	(clsNames includes: trialValue class name) ifFalse: [^ true].
	(clsNames includes: anAnswer class name) ifFalse: [^ true].
	"Both are different and are in the list.  closeTo: says they are equal.  But a secret conversion happened in #="
	^ false