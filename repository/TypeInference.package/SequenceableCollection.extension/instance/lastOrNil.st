*TypeInference
lastOrNil
	"Answer the last element of the receiver"
	(self size = 0 ) ifTrue: [ ^nil ].
	^ self at: self size 