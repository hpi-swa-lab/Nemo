private
mutate
	| system |
	system := TiSystem current.
	system removeType: self.
	self expandTypes.
	system addTypeBecomingIntoExisting: self