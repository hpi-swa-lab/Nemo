toolbuilder
buildLabelWith: builder
	| spec |
	spec := builder pluggableTextSpec new.
	spec
		model: self;
		getText: #labelString.
	^ spec