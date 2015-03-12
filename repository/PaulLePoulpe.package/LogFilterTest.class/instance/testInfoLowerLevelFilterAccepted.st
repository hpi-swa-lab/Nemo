tests
testInfoLowerLevelFilterAccepted
	| levelFilter value |
	levelFilter := LevelLogFilter for:#info.
	
	value := false.
	levelFilter ifAccept: error do: [ value := true. ].
	
	self assert:[  value ] description:'LevelLogFilter for #info must accept #error logEntity'.

	value := false.
	levelFilter ifAccept: warn do: [ value := true. ].
	
	self assert:[  value ] description:'LevelLogFilter for #info must accept #warn logEntity'.	