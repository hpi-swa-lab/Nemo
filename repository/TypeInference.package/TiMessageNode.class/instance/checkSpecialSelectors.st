error handling
checkSpecialSelectors
	"Workspaces dont translate the #ifTrue: (or #ifFalse:)
	selectors into #ifTrue:ifFalse: (or #ifFalse:ifTrue). why??"
	(((selector = #ifTrue:) or: [selector = #ifFalse:])
	and: [arguments size ~= 1])
		ifTrue: [self error: 'the parse tree was generated with wrong number of block arguments']