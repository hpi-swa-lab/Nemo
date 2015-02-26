*Traits-NanoKernel
traitComposition: aTraitComposition
	"Install my trait composition"
	self traitComposition do:[:tc|  tc removeTraitUser: self].
	aTraitComposition isEmptyOrNil ifTrue:[
		self organization isTraitOrganizer 
			ifTrue:[self organization: (ClassOrganizer newFrom: self organization)].
	] ifFalse:[
		self organization isTraitOrganizer 
			ifFalse:[self organization: (TraitOrganizer newFrom: self organization)].
		self organization traitComposition: aTraitComposition.
		aTraitComposition do:[:tc| tc addTraitUser: self].
	].
