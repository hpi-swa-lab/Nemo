finding
hasInstVar: anInstVarName inClassOrSuperClasses: aClass
	| theClass |
	theClass := aClass.	
	[ theClass notNil ] whileTrue: [ 
		(theClass instVarNames includes: anInstVarName)
			ifTrue: [ ^ true ]
			ifFalse: [ theClass := aClass ifNotNil: [ theClass superclass ] ] ].
	^ false