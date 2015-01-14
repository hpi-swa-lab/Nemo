building
buildRightOutputPanelWith: builder
	| textSpec |
	textSpec := builder pluggableTextSpec new.
	textSpec 
		model: self;
		getText: #rightOutput;
		selection: #contentsSelection; 
		menu: #codePaneMenu:shifted:.
	^textSpec