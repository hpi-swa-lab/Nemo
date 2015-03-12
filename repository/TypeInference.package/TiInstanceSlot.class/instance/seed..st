type propagation
seed: aType
	self debug: [ 'seeding over receiverSlot: ',  receiverSlot  asString].
	self typeSet add: aType ifPresent: [^ self].
	receiverSlot seed: aType fromVariable: variableName.