control primitives
primitiveValueWithArgs
	|  result args |
	(self matchOrFail: {{BlockClosure . Array}.{BlockClosure. Array}})
		ifNil: [^ self primitiveFail].

	"Special case. The arguments are inside the Array"

	args := (arguments at: 1) orderedTypes.
	args size = receiver argumentCount
		ifFalse: [^ self primitiveFail].
	result := receiver evaluateWith: args.
	receiver seedNonLocalReturn: result nonLocalReturn.
	self debug:[' block result ', result asString].
	^ self 
		createResultReceiver: (Set with: receiver)
		arguments: {Set with: (Array createInitializedType: result allTypes)}
		return: result return

