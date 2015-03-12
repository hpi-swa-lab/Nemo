variables
nodeSuperWith: aContextBuilder
	self assertContext: aContextBuilder.
	
	^ aContextBuilder storeVariable: #super definedBy: [
			TiSuperPseudoVariable new 
				methodClass: aContextBuilder analyzedMethod ownerClass;
				receiver: (self nodeSelfWith: aContextBuilder).
		]
