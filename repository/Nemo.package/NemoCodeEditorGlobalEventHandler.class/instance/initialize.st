initialization
initialize

		super initialize.
		self mouseDownHandler: [:event].
		ActiveHand addMouseListener: self.