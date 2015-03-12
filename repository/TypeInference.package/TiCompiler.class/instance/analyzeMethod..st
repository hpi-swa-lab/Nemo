replication
analyzeMethod: aMethodNode
	|analyzedMethod|
	analyzedMethod := TiAnalyzedMethod new.
	self privReplicate: aMethodNode with: analyzedMethod.
	^analyzedMethod.