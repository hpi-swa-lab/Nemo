nodes
buildAssignFromExpression: expression toVariable: variable
	^compiler buildAssignFromExpression: expression toVariable: variable with: self.