as yet unclassified
buildLabelWith: builder
	| spec |
	spec := builder pluggableTextSpec new.
	spec
		model: self;
		getText: #label.
	^ spec