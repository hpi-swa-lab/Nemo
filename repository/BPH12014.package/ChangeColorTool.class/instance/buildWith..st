building
buildWith: builder
	| windowSpec |
	windowSpec := self buildWindowWith: builder specs: 
	{
		(0@0 corner: 1@0.14) -> [self buildInputPanelWith: builder].
		(0@0.14 corner: 1@1) -> [self buildOutputPanelWith: builder].
	}.
	^ builder build: windowSpec