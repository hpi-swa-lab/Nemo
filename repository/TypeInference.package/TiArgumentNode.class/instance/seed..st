type propagation
seed: aType
	self debug: [ 'seeding over message: ',  message asString].
"	(aType = SmallInteger ) ifTrue:[ self halt]."
	typeSet add: aType ifPresent: [^ self].
	message seed: aType fromArgument: position.
