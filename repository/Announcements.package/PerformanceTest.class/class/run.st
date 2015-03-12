running
run
	| triggerEventResults axAnnouncementsResults result |
	triggerEventResults := self testTriggerEvent.
	axAnnouncementsResults := self testAXAnnouncements.
	result := WriteStream on: ''.
	result 
		nextPutAll: ('<N>' padded: #right to: 4 with: $ );
		nextPutAll: ('TriggerEvent' padded: #right to: 13 with: $ );
		nextPutAll: ('AXAnnouncements' padded: #right to: 16 with: $ );
		nextPutAll: ('Ratio' padded: #right to: 8 with: $ );
		cr.
	self testValues do: [ :each |
		result
			nextPutAll: (each asString padded: #right to: 4 with: $ );  
			nextPutAll: ((triggerEventResults at: each) asString padded: #right to: 13 with: $ );
			nextPutAll: ((axAnnouncementsResults at: each) asString padded: #right to: 16 with: $ );
			nextPutAll: (((((1000 * (triggerEventResults at: each)) / (axAnnouncementsResults at: each)) asFloat rounded) / 1000) asFloat asString padded: #right to: 8 with: $ );
			cr
	].
	Transcript show: result contents.
	^result contents.
	