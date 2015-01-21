as yet unclassified
buildInputFieldWith: builder
	| spec |
	spec := builder pluggableInputFieldSpec new.
	spec
		model: self;
		getText: #contents;
		setText: #contents:;
		selection: #contentsSelection;
		menu: #codePaneMenu:shifted:.
	^ spec