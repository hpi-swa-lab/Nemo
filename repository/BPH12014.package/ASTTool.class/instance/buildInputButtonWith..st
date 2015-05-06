building
buildInputButtonWith: builder
	| spec |
	spec := builder pluggableButtonSpec new.
	spec
		model: self;
		label: 'Go';
		action: #go.
	^ spec