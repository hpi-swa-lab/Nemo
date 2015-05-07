*Nemo-Util
methodDictWithSuper

	| dict currentClass |
	dict := Dictionary new.
	currentClass := self.
	[currentClass = ProtoObject] whileFalse: [
		currentClass methodDict associationsDo: [ :anAssociation |
			dict at: anAssociation key ifAbsentPut: [ anAssociation value. ]
		].
		currentClass := currentClass superclass.
	].
	^ dict