tests
testInfoCategoryFilterAccepted
	| categoryFilter value |
	categoryFilter := CategoryLogFilter for:#info.
	
	value := false.
	categoryFilter ifAccept: info do: [ value := true. ].
	
	self assert:[  value ] description:'CategoryFilter for #info must accept #info logEntity'.

	