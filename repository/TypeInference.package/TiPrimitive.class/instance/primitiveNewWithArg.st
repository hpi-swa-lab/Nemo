object access primitives
primitiveNewWithArg
	arguments size = 1 ifFalse: [
		self debug:[ 'arguments size ', arguments size asString,'. Primitive newWithArgs Fail'].
		^ nil
	].
	(receiver exactClass inheritsFrom: Integer) ifTrue: [
		self debug:[ 'Trying to instanciate a Smallinteger . Primitive newWithArgs Fail'].
		^ nil
	].
	^ self primitiveNew
