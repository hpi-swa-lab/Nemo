private
expandTypes
	(object isNil or: expanded )ifTrue: [^ self].
	indexedVarTypes := Set new.
	1 to: object size 
		do: [:i | indexedVarTypes add: (object at: i) concreteType].
	super expandTypes.