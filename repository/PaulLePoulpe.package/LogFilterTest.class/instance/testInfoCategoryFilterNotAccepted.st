tests
testInfoCategoryFilterNotAccepted
	| categoryFilter value |
	categoryFilter := CategoryLogFilter for:#info.
	
	value := false.
	categoryFilter ifAccept: error do: [ value := true ].
	
	self assert:[  value = false ] description:'CategoryFilter for #info must NOT accept #error logEntity'.

	value := false.
	categoryFilter ifAccept: debug do: [ value := true ].
	
	self assert:[  value = false ] description:'CategoryFilter for #info must NOT accept #debug logEntity'.
	