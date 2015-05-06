private-accessing
observers

		observers ifNil: [ self observers: OrderedCollection new. ].
		^ observers