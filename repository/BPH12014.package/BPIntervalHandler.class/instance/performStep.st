private-interval
performStep

	self stopping ifTrue: [self running: false]
		ifFalse: [
			(self executor value: self) = #stop ifFalse: [
				(Delay forMilliseconds: self nextInterval) wait.
				self performStep.
			].
		]