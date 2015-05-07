*Nemo-Util
selectorOfMyReceiver

	self receiver isMessage ifTrue: [ ^ self receiver selector ].
	self receiver isVariable ifTrue: [ ^ self receiver token value ].
	^ nil