private-processing
process

	self parameterTranslations associationsDo: [ :assoc |
		(self dictionary includesKey: assoc key) ifTrue: [
			self dictionary at: assoc value put: (self dictionary at: assoc key)]]