as yet unclassified
suggestMethodsFor: aClass
	^ self methodList
		select: [ :classToMethod | classToMethod key = aClass ]
		thenCollect: [ :classToMethod | classToMethod value ]