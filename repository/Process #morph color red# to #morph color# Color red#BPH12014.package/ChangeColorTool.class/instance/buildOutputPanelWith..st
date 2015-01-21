building
buildOutputPanelWith: builder
	| textSpec |
	textSpec := builder pluggableTextSpec new.
	textSpec 
		model: self;
		getText: #output;
		selection: #contentsSelection; 
		menu: #codePaneMenu:shifted:.
	^textSpec