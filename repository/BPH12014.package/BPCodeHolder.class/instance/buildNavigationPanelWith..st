toolbuilder
buildNavigationPanelWith: builder
	| spec |
	spec := builder pluggableTextSpec new.
	spec
		model: self;
		getText: #labelString;
		setText: #methodChanged:.
	^ spec