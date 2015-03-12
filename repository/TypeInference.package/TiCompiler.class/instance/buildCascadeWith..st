nodes
buildCascadeWith: aContextBuilder 
	self assertContext: aContextBuilder.
	
	^aContextBuilder storeCascadeNode: TiCascadeNode new.

