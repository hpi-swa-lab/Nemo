*contexts2-core
proceedWithArgs: args
	| info index |
	info := Processor activeProcess csInfo.
	index := info proceedIndex.
	info methodChain size < index ifTrue: [ ^ self ]. "Method chain has been executed to the end.
														Simulate an empty method"
	^ self withArgs: args executeMethod: (info methodChain at: index)