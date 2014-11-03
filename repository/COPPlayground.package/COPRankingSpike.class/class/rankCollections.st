as yet unclassified
rankCollections

	^self new initializeClasses: { OrderedCollection } without: (Dictionary new
		at: OrderedCollection put: { #add: . #at: . #size . #resetTo: . #reset . #setCollection: . #addLast: }
	).