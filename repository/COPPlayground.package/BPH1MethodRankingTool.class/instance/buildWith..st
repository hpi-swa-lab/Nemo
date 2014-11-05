as yet unclassified
buildWith: aBuilder

	| windowSpec |
	windowSpec := self buildWindowWith: aBuilder specs: {
		(0@0 corner: 0.6@0.1) -> [self buildPackageInputWith: aBuilder].
		(0.6@0 corner: 1@0.1) -> [self buildObserveButtonWith: aBuilder].
		(0@0.1 corner: 1@1) -> [self buildMethodListWith: aBuilder]
	}.
	^ aBuilder build: windowSpec