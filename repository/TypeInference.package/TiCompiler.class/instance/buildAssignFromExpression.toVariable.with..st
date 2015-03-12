nodes
buildAssignFromExpression: expression toVariable: variable with: aContextBuilder 
	self assertContext: aContextBuilder.
	
	^TiAssignmentNode new setVariable: (variable mirrorIn: aContextBuilder)
				 		         expression: (expression mirrorIn: aContextBuilder); yourself.
