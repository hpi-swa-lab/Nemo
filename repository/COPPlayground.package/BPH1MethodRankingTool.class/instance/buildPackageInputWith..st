as yet unclassified
buildPackageInputWith: aBuilder

	^aBuilder pluggableInputFieldSpec new
		model: self;
		getText: #package;
		setText: #package:;
		yourself.