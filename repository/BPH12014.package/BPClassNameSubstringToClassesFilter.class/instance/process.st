private-processing
process

	| classNames |
	classNames := self findClassNamesContaining: self classNameSubstring.
	classNames := classNames
		ifEmpty: [ self findClassNamesContainingSubstringsOf: self classNameSubstring ]
		ifNotEmpty: [ classNames ].
	self classNames: classNames