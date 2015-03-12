private
isEqualsTo: anOtherType
	| acc | 
	acc := true.	
	
	self exactClass = anOtherType exactClass and: [
		(self expanded and: anOtherType expanded ) ifFalse:[ ^true ].
		1 to: self exactClass instSize do: [ :i | 
				acc := acc and: [ ( self instVarTypesAtIdx:i ) isEqualsTo:  (anOtherType instVarTypesAtIdx:i )  ]
		].	
		^acc.
	].
	^false.