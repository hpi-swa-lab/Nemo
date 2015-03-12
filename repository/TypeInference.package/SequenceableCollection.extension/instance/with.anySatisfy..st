*TypeInference
with: otherCollection anySatisfy: twoArgBlock 
	"Evaluate twoArgBlock with corresponding elements from this collection and otherCollection.
	In analogy with anySatisfy."
	otherCollection size = self size ifFalse: [self error: 'otherCollection must be the same size'].
	1 to: self size do:
		[:index |
		(twoArgBlock value: (self at: index)
				value: (otherCollection at: index)) ifTrue:[^true]].
	^false