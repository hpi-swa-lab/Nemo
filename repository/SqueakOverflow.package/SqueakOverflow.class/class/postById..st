utilities
postById: anId
	"Get body of a stackoverflow answer by answer ID."

	| json |
	
	json := self jsonFor: (self postUrlFor: anId).
	
	^(((json at: 'items') first) at: 'body').