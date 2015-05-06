private-observation
methodRemoved: aMethodReference

		self observers do: [ :anObserver | anObserver methodRemoved: aMethodReference. ].