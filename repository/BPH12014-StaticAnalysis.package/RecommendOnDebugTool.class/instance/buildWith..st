toolbuilder
buildWith: builder
	| windowSpec |
	windowSpec := self buildWindowWith: builder specs: 
	{
		(0@0 corner: 1@1) -> [self buildList: builder]
	}.
	^ builder build: windowSpec