accessing
storeCascadeNode: aCascadeNode 
	cascadeNode ifNotNil:[
		self error: 'CascadeNode already setted!'.
	].
	cascadeNode := aCascadeNode .
	^aCascadeNode.
	
	