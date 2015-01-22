as yet unclassified
testPipelineCreation

	| firstFilter secondFilter pipelineResult |
	firstFilter := BPFilter new.
	secondFilter := BPFilter new.
	pipelineResult := BPFilter pipeline: {firstFilter. secondFilter}.
	self assert: firstFilter identical: pipelineResult.
	self assert: secondFilter identical: firstFilter nextFilter.