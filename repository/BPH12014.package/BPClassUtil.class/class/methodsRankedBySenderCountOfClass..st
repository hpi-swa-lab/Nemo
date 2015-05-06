ranking
methodsRankedBySenderCountOfClass: aClass
	| rankedMethods |
	rankedMethods := SortedCollection
		sortBlock: [ :assocA :assocB | assocA value > assocB value ].
	"aClass methodDict keysDo: [ :selector |
		rankedMethods add: selector -> (SystemNavigation default allCallsOn: selector 
		fromBehaviors: SystemNavigation allBehaviors
		sorted: false) size]."
	rankedMethods := aClass methodDict keys.
	^ rankedMethods "collect: [ :assoc | assoc key ]"