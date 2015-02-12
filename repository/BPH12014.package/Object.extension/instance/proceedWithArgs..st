*BPH12014
proceedWithArgs: anOrderedCollection
	| info index |
	info := Processor activeProcess csInfo.
	index := info proceedIndex.
	info methodChain size < index ifTrue: [ ^ self ]. "Method chain has been executed to the end.
														Simulate an empty method"
	^ self withArgs: anOrderedCollection executeMethod: (info methodChain at: index)