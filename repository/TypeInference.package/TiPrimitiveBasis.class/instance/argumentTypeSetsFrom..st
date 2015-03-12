private
argumentTypeSetsFrom: aMessageResult
	| answer |
	answer := Array new: arguments size.
	answer at: 1 put: (Set with: arguments first).
	2 to: arguments size 
		do: [:i | answer at: i put: (aMessageResult arguments at: i-1)].
	^ answer
	