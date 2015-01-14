as yet unclassified
closeInput

	self onCloseAction ifNotNilDo: [ :aBlock | aBlock value.].
	self fancyUI delete.