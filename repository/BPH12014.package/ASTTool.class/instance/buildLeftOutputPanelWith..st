building
buildLeftOutputPanelWith: builder
	| textSpec |
	textSpec := builder pluggableTextSpec new.
	textSpec 
		model: self;
		getText: #leftOutput;
		selection: #contentsSelection; 
		menu: #codePaneMenu:shifted:.
	^textSpec