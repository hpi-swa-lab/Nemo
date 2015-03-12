replication
privReplicate: aMethodNode with: anAnalyzedMethod 
	| context |
	context := self makeAContextBuilderFor: anAnalyzedMethod.
	anAnalyzedMethod definition: (aMethodNode mirrorIn: context).

	
	