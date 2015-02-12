toolbuilder
buildNavigationPanelWith: builder
	| spec |
	spec := builder pluggableTextSpec new.
	spec
		model: self;
		getText: #methodSelectionString;
		setText: #methodSelectionStringChanged:.
	^ spec