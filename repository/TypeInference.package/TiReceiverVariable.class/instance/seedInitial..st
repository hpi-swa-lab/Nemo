type propagation
seedInitial: aType 
	super seedInitial: aType.
	instVars isEmptyOrNil ifFalse: [ instVars do: [ :each | each seedInitial: ( aType instVarTypeAt: each variableName ) ] ]