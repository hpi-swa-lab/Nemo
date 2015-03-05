*BPH12014-Util
selectorOfMyReceiver

	self receiver isMessage ifTrue: [ ^ self receiver selector ].
	^ nil