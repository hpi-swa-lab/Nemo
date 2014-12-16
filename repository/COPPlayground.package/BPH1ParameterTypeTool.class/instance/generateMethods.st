as yet unclassified
generateMethods

	| allMethods |
	allMethods := Dictionary new.
	self observer classes keysAndValuesDo: [ :class :classMethodCounters |
		classMethodCounters keysAndValuesDo: [ :methodName :typeInfo |
			allMethods at: (class name, '>>', methodName) put: class name, '>>', (self class createMethodNameFrom: methodName withTypes: typeInfo).
		].
	].
	^allMethods values