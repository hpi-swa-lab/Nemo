initialization
ifTrue: aBlock doFilter: aFilter
	self branches: (self branches asOrderedCollection add: {aBlock. aFilter}; yourself)