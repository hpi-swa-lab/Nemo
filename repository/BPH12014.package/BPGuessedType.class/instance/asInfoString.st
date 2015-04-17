conversion
asInfoString

	^ (self class guessingTypes
		at: self guessingSource
		ifAbsent: [#('unknown guessing type')]) first