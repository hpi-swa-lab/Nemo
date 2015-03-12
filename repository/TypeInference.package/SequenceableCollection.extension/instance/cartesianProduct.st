*TypeInference
cartesianProduct
	| m answer |
	self isEmpty ifTrue: [^ #()].
	m := self inject: 1 into: [:r :col | r * col size].
	m = 0 ifTrue: [^ #()].
	answer := OrderedCollection new: m.
	self cartesianProductDo: [:each | answer add: each].
	^ answer