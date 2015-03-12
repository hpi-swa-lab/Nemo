replication
makeAContextBuilderFor: anAnalyzedMethod 
	currentContextBuilder := TiContextBuilder for: anAnalyzedMethod  with: self usingForParent: currentContextBuilder. 
	^currentContextBuilder.
	

	
	