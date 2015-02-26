*Traits-NanoKernel
includesLocalSelector: selector
	^(self compiledMethodAt: selector ifAbsent:[^false]) methodHome == self