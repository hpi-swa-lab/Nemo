private
blockFor: anObject withSelector: aSelector

	| args |
	args := aSelector numArgs.
	args = 0 ifTrue: [ ^[ anObject perform: aSelector ] ].
	args = 1 ifTrue: [ ^[ :anAnnouncement | anObject perform: aSelector with: anAnnouncement ] ].
	args = 2 ifTrue: [ ^[ :anAnnouncement :anAnnouncer | anObject perform: aSelector with: anAnnouncement with: anAnnouncer ] ].
	self error: 'Couldn''t create block'.