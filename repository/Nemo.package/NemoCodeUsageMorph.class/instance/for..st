as yet unclassified
for: aMethodReference
	| ast interval |
	ast := NemoParserUtil parseASTFromString: aMethodReference sourceString.
	interval := ast methodComments
		ifEmpty: []
		ifNotEmpty: [:comments | comments first].
	self codeMorph setText: 
		(interval 
			ifNil: [ aMethodReference sourceString ]
			ifNotNil: [ aMethodReference sourceString copyFrom: interval first to: interval last ]).
	self codeMorph styler classOrMetaClass: aMethodReference actualClass.