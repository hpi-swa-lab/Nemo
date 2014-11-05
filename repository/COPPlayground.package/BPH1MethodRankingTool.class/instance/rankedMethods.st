as yet unclassified
rankedMethods

	| allMethods |
	allMethods := Dictionary new.
	self counter classes keysAndValuesDo: [ :class :classMethodCounters |
		classMethodCounters keysAndValuesDo: [ :methodName :counter |
			allMethods at: (class name, '>>', methodName) put: counter.
		].
	].
	allMethods := allMethods associations asOrderedCollection sort: [ :entry1 :entry2 |
		entry1 value > entry2 value.
	].
	^(allMethods collect: [ :methodEntry | 
		methodEntry key,' (', (methodEntry value), ')'.
	])