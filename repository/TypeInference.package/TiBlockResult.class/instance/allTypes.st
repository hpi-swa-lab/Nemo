accessing
allTypes
	| collection |
	collection := Set new.
	arguments do: [:arg | collection addAll: arg].
	^ collection