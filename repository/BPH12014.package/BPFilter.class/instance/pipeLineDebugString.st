debugging
pipeLineDebugString
	| currentFilter consumes produces |
	currentFilter := self.
	^ String streamContents: [ :stream |
		stream
			nextPutAll: Character cr asString;
			nextPutAll: 'PIPELINE';
			nextPutAll: Character cr asString.
		[currentFilter notNil] whileTrue: [
			consumes := (currentFilter class organization listAtCategoryNamed: 'consumes')
				select: [ :cat | cat endsWith: ':' ].
			produces := (currentFilter class organization listAtCategoryNamed: 'produces')
				select: [ :cat | (cat endsWith: ':') not ].
			stream
				nextPutAll: '	| in:		';
				nextPutAll: consumes asString;
				nextPutAll: Character cr asString;
				nextPutAll: currentFilter class name;
				nextPutAll: Character cr asString;
				nextPutAll: '	| out:	';
				nextPutAll: produces asString;
				nextPutAll: Character cr asString.
			currentFilter := currentFilter nextFilter
		]
	]