quick-testing
areInstructionsSideEffecting: aCompiledMethod
	| scanner end locator |
	scanner := InstructionStream on: aCompiledMethod.
	locator := NemoInstructionsSideEffectLocator new.
	end := aCompiledMethod endPC.

	[ scanner pc <= end ] whileTrue: [
		locator interpretNextInstructionUsing: scanner.
		locator isSideEffecting ifTrue: [ ^ true ] ].

	^ false
	