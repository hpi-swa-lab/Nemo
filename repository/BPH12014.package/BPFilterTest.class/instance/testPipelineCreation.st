as yet unclassified
testPipelineCreation

	| firstFilter secondFilter firstCalled secondCalled pipelineResult |

	firstCalled := false.
	secondCalled := false.

	firstFilter := BPTestFilter new callback: [ :x | firstCalled := true ].
	secondFilter := BPTestFilter new callback: [ :x | secondCalled := true ].
	pipelineResult := BPFilter pipeline: {firstFilter. secondFilter}.
	
	self assert: firstFilter identical: pipelineResult.
	self assert: secondFilter identical: firstFilter nextFilter.
	
	pipelineResult run.

	self assert: firstCalled = true.
	self assert: secondCalled = true.