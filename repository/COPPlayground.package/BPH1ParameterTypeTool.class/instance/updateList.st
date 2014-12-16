as yet unclassified
updateList

	self methodList: self generateMethods.
	self class observations: self observer classes.
	self changed: #methodList.
	