type propagation
connectTo: anObject
	self debug:[ ' adding anObject to ', (self connections collect: #asString)asString ].
	self connections add: anObject.
	self debug:[ ' seeding anObject over ', (self typeSet collect: #asString)asString ].
	self typeSet do: [:type | anObject seed: type]
