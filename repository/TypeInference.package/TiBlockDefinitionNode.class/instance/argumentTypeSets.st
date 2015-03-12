accessing
argumentTypeSets
	^ arguments collect: [:each | each currentSlot typeSet]
