*contexts2-core-override-query
allCallsOn: aLiteral fromBehaviors: behaviors sorted: sorted
	"Answer a collection of all the methods implemented by behaviors that call on aLiteral even deeply embedded in literal array."
	"--- BEGIN SQUEAK CORE CODE ---"	
	| result special thorough byte |
	result := OrderedCollection new.
	special := Smalltalk hasSpecialSelector: aLiteral ifTrueSetByte: [ :b | byte := b ].
	"Possibly search for symbols imbedded in literal arrays"
	thorough := aLiteral isSymbol and: [ Preferences thoroughSenders ].
	behaviors do: [ :behavior |
		| list | 
		list := behavior whichSelectorsReferTo: aLiteral special: special byte: byte thorough: thorough.
		list do: [ :selector |
			result add: (MethodReference class: behavior selector: selector) ] ].
	sorted ifTrue: [ result sort ].
	"--- END SQUEAK CORE CODE ---"
	(behaviors respondsTo: #reset) ifTrue: [behaviors reset].  
	behaviors do: [:behavior || list |
		list := behavior layeredMethods gather: [:method |
			method partialMethods select: [:partial | partial hasLiteral: aLiteral]].
		list do: [:partial | result add: (CSMethodReference onMethod: partial)]].
	sorted ifTrue: [ result sort ].
	^ result