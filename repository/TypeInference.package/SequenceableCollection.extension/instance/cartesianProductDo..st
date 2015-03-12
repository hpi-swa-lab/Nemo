*TypeInference
cartesianProductDo: aBlock 
	| n index sizes k array s indexk |
	n := self size.
	n = 0 ifTrue: [^ self].
	index := (Array new: n)
				atAllPut: 1.
	sizes := self
				collect: 
					[:each | 
					(s := each size) = 0 ifTrue: [^ self].
					s].
	
	[array := Array new: n.
	1 to: n do: [:i | array at: i put: ((self at: i)
				at: (index at: i))].
	aBlock value: array.
	(k := (n to: 1 by: -1)
				detect: [:i | (indexk := index at: i) < (sizes at: i)]
				ifNone: []) isNil]
		whileFalse: 
			[k + 1 to: n do: [:i | index at: i put: 1].
			index at: k put: indexk + 1]