as yet unclassified
initialize

	self reset.
	SystemNavigation default allClasses do: [ :class |
			class methodDict keys do: [ :selector |
					self for: selector numberOfUnderstandingClasses: (self allClassesThatUnderstand: selector) size.
			].
	].