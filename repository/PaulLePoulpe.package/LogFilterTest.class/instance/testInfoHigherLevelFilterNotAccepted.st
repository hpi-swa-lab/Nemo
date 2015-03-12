tests
testInfoHigherLevelFilterNotAccepted
	| levelFilter value announced |
	levelFilter := LevelLogFilter for:#warn.
	levelFilter subscribe: RejectedLog   do: [ announced := true ].
	
	announced := false.
	value := false.
	levelFilter ifAccept: info do: [ value := true. ].
	
	self assert:[  value = false ] description:'LevelLogFilter for #warn must NOT accept #error logEntity'.
	self assert:[  announced ] description:'LevelLogFilter has not announce the rejected log'.

	announced := false.
	value := false.
	levelFilter ifAccept: debug do: [ value := true. ].
	
	self assert:[  value = false ] description:'LevelLogFilter for #warn must NOT accept #warn logEntity'.	
	self assert:[  announced ] description:'LevelLogFilter has not announce the rejected log'.