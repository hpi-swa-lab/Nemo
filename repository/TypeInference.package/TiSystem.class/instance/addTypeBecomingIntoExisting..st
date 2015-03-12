type memory
addTypeBecomingIntoExisting: aType
	| existingType |
	self debug:[ 'registering new type at variable and becoming it'].
	(existingType := self addType: aType) ~= aType
		ifTrue: [aType becomeForward: existingType].
	^ existingType
