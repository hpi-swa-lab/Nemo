initialization
ifFalse: aBlock doFilter: aFilter
	self ifTrue: [ :x | (aBlock value: x) not] doFilter: aFilter