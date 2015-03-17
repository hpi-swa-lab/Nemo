toolbuilder
buildCodePaneWith: builder
	| textSpec |
	textSpec := BPPluggableSuggestionCodePaneSpec new.
	textSpec 
		model: self;
		getText: #contents; 
		setText: #contents:notifying:; 
		selection: #contentsSelection; 
		menu: #codePaneMenu:shifted:.
	^textSpec