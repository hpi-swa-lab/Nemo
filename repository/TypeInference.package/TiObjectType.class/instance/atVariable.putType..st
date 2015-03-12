building
atVariable: aSymbol putType: aType 

	^ (self instVarTypeAt: aSymbol) = aType
		ifTrue: [
			self.
		]
		ifFalse: [
			TiSystem current addTypeBecomingIntoExisting:
						(self copy
							instVarAt: aSymbol
							putType: aType).
		].
