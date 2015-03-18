as yet unclassified
createFilterRegExFrom: aFilterString

	aFilterString ifEmpty: [^nil].
	^ [ RxMatcher
		forString: (self regexStringFrom: aFilterString)
		ignoreCase: true ] on: RegexSyntaxError do: []