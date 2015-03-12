tests
testInfoSameLevelFilterAccepted
	| levelFilter value announced|
	levelFilter := LevelLogFilter for:#info.
	announced := false.
	value := false.
	levelFilter subscribe: AdmittedLog  do: [ announced := true ].
	levelFilter ifAccept: info do: [ value := true. ].
	
	
	self assert:[  value ] description:'LevelLogFilter for #info must accept #info logEntity'.
	self assert:[  announced ] description:'LevelLogFilter has not announce the admitted log'.

	