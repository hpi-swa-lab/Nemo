type propagation
seed: aType
	self debug: [ 'seeding connections: ', (self connections collect:#asString) asString].
	self typeSet add: aType ifPresent: [^ self].
	self connections do: [:anObject | anObject seed: aType]
