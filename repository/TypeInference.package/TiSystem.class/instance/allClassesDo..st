accessing
allClassesDo: aBlock
	^ classes do: [:each | aBlock value: each]
