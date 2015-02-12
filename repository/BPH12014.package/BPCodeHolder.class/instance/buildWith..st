toolbuilder
buildWith: builder
	| windowSpec |
	windowSpec := self buildWindowWith: builder specs: 
	{
		(0@0 corner: 1@0.1) -> [self buildNavigationPanelWith: builder].
		(0@0.1 corner: 1@1) -> [self buildCodePaneWith: builder].
	}.

	^ builder build: windowSpec