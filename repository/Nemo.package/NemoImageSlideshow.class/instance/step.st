as yet unclassified
step

	self removeAllMorphs.
	self imageMorphs addLast: self imageMorphs removeFirst.
	self addMorph: self imageMorphs first.