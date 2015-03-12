accessing
instVars
	instVars isNil ifTrue: [instVars := OrderedCollection new].
	^ instVars