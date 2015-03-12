private
messageArguments
	| answer |
	answer := arguments shallowCopy.
	answer at: 1 put: receiver.
	^ answer