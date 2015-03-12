mirroring
mirrorAll: aParseNodeCollection
	^ aParseNodeCollection collect: [:each | each mirrorIn: self]