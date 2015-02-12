as yet unclassified
testStartStopObservation

	self assert: CompiledMethod identical: (BPObservationTestClass methodDict at: #methodWith:and:) class.
	self observer start.
	self assert: CSLayeredMethod identical: (BPObservationTestClass methodDict at: #methodWith:and:) class.
	self observer stop.
	self assert: CompiledMethod identical: (BPObservationTestClass methodDict at: #methodWith:and:) class.