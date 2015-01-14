building
buildInputPanelWith: builder
	| spec |
	spec := builder pluggablePanelSpec new.
	spec
		model: self;
		layout: #horizontal;
		children: {
			self buildInputFieldWith: builder.
			"self buildInputButtonWith: builder"
		}.
	^ spec
		