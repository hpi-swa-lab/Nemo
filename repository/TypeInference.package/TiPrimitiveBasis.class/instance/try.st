type propagation
try
	(self respondsTo: selector)
		ifTrue: [
			| result |
			result := self perform: selector.
			result ifNil: [
				result := self primitiveFail.
				
			].
			self debug:[ ' performing primitive ', selector asString, ' with successful: ', result isSuccess asString].
			
			^result.
		].
	self debug:[ ' Primitive not implemented ', selector asString].
	self error: selector, ' not yet implemeted'.
	^self primitiveFail.

	