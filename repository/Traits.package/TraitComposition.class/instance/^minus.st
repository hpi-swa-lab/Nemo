converting
- anArray
	"the modifier operators #@ and #- bind stronger than +.
	Thus, #@ or #- sent to a sum will only affect the most right summand"
	
	self addLast: (self removeLast - anArray)