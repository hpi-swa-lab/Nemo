private-processing
process

	| classNamesUnderstanding classNamesContaining |
	classNamesUnderstanding := self filterClassNames: self classNames understanding: self methodSelector.
	classNamesContaining := classNamesUnderstanding
		ifEmpty: [ self filterClassesNames: self classNames containing: self methodSelector ]
		ifNotEmpty: [ OrderedCollection new ].
	self classesUnderstandingSelector: classNamesUnderstanding.
	self classesContainingSelector: classNamesContaining