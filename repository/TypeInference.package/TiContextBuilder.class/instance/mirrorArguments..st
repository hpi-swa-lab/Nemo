mirroring
mirrorArguments: aParseNodeCollection
	^ aParseNodeCollection collect: [ :each |  each mirrorIn: self ]