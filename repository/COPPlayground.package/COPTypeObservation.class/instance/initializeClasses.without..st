as yet unclassified
initializeClasses: classesList without: blacklistedClassMethods

	| rankedClassMethods |

	rankedClassMethods := Dictionary new.

	classesList do: [ :aClass |
		rankedClassMethods at: aClass put: (
			aClass methodDict keys select: [ :eachClassMethod |
				(blacklistedClassMethods at: aClass ifAbsent: [{}]) allSatisfy: [ :eachForbiddenMethod |
					(eachClassMethod = eachForbiddenMethod) not.
				].
			]
		).
	].

	self classes: Dictionary new.
	rankedClassMethods keysAndValuesDo: [ :aClass :methods |
		self classes at: aClass put: Dictionary new.
		methods do: [ :methodName |
			(self classes at: aClass) at: methodName put: OrderedCollection new.
		].
	].