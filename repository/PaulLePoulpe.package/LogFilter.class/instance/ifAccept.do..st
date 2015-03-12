filter
ifAccept: aLogEntity do: aBlock
	^(self accept: aLogEntity) ifTrue:[
		self announce: (AdmittedLog with: aLogEntity).
		aBlock value.
	] ifFalse:[
		self announce: (RejectedLog with: aLogEntity).
	].