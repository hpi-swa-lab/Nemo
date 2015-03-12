building
fromInstanceVariable: aTiInstanceVar previous: aSlot
	self debug:[ 'slot building'].
	instanceSlot := TiInstanceSlot new 
					setName: aTiInstanceVar variableName
					receiverSlot: self
					variableSlot: aTiInstanceVar currentSlot.
	previousSlot := aSlot.
	aSlot connectTo: self
