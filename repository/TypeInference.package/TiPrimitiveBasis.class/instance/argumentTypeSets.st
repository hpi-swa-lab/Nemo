accessing
argumentTypeSets
	^ arguments collect: [:each | (Set new: 1) add: each; yourself]