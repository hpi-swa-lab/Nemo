instance creation
default

		self DefaultInstance ifNil: [ self DefaultInstance: self new. ].
		^ self DefaultInstance