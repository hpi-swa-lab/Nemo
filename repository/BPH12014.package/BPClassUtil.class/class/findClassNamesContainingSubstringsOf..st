finding
findClassNamesContainingSubstringsOf: aSubString
	| substring classNames |
	substring := aSubString.
	classNames := OrderedCollection new.
	[ substring size >= 4 ] whileTrue: [
		substring := substring allButFirst.
		(self findClassNamesContaining: substring)
			ifEmpty: []
			ifNotEmptyDo: [ :names | classNames addAll: names ] ].
	substring := aSubString.
	[ substring size >= 4 ] whileTrue: [
		substring := substring allButLast.
		(self findClassNamesContaining: substring)
			ifEmpty: []
			ifNotEmptyDo: [ :names | classNames addAll: names ] ].
	^ classNames
	