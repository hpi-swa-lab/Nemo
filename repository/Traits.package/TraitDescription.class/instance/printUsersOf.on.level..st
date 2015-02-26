printing
printUsersOf: aClass on: aStream level: indent
	aStream crtab: indent.
	aStream nextPutAll: aClass name.
	aClass isTrait ifTrue:[
		aClass users do:[:each| self printUsersOf: aClass on: aStream level: indent+1].
	].
