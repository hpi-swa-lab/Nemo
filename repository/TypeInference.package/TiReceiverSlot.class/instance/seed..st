type propagation
seed: aType
	| name |
	self debug: [ 'seeding trough basicSeedAll:'].
	name := instanceSlot variableName.
	self basicSeedAll: 
		(instanceSlot typeSet 
			collect: [:type | aType atVariable: name putType: type]).

	"instanceSlot seedFromReceiver: (aType instVarTypeAt: name)"
		