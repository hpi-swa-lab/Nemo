accessing
orderedTypes
	| types |
	types := object collect: [:each | each concreteType].
	self mutate.
	^ types
