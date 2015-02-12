testing
testBranching

	| firstCalled secondCalled pipelineResult thirdCalled actualFilter afterFilter beforeFilter |

	firstCalled := false.
	secondCalled := false.
	thirdCalled := false.

	beforeFilter := BPTestFilter new callback: [ :x | x at: #cool put: 'before called' ].
	actualFilter := BPBranchingFilter new
		ifTrue: [ :dict | dict includesKey: #cool ] 
			doFilter: (BPTestFilter new callback: [ :x | x at: #cool ifPresent: [ :y | firstCalled := true ]]);
		ifFalse: [ :dict | dict includesKey: #notcool ] 
			doFilter: (BPTestFilter new callback: [ :x | x at: #cool ifPresent: [ :y | secondCalled := true ]]);
		ifTrue: [ :dict | dict includesKey: #notcool ] 
			doFilter: (BPTestFilter new callback: [ :x | x at: #cool ifPresent: [ :y | thirdCalled := true ]]);
		yourself.
	afterFilter := BPTestFilter new callback: [ :x | x at: #cool put: ((x at: #cool), ' and after called') ].

	pipelineResult := (BPFilter pipeline: {beforeFilter. actualFilter. afterFilter}) run.

	self assert: (pipelineResult dictionary at: #cool) = 'before called and after called'.

	self assert: firstCalled = true.
	self assert: secondCalled = true.
	self assert: thirdCalled = false.