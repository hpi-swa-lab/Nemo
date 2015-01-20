search
search: multi
	"if Multi is true, collect all selectors that work."
	"resultsList := OrderedCollection new.	  list of them"
	self simpleSearch.
	multi not & (resultsList isEmpty not) ifTrue:[^ resultsList].
	self insertConstants.

	[self permuteArgs] whileTrue:
		[self simpleSearch.
		multi not & (resultsList isEmpty not) ifTrue: [^ resultsList].
		self insertConstants].

	^ #()