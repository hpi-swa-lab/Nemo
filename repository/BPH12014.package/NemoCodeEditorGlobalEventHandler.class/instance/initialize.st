as yet unclassified
initialize

		super initialize.
		self mouseDownHandler: [:event].
		ActiveHand addMouseListener: self.