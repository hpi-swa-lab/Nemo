private
blockFor: anObject withSelector: aSelector 
	| args |
	args := aSelector numArgs.
	args = 0 ifTrue: [
		^[ (anObject at: 1) ifNotNil: [ :o | o perform: aSelector ] ] ].
	args = 1 ifTrue: [
		^[ :anAnnouncement | 
			(anObject at: 1) ifNotNil: [ :o | 
				o perform: aSelector with: anAnnouncement ] ] ].
	args = 2 ifTrue: [
		^[ :anAnnouncement :anAnnouncer | 
			(anObject at: 1) ifNotNil: [ :o | 
				o 
					perform: aSelector
					with: anAnnouncement
					with: anAnnouncer ] ] ].
	self error: 'Couldn''t create block'