delivery
value: anAnnouncement

	interceptors ifNil: [ 
		^(subscriber at: 1) ifNotNil: [ :action |
			action cull: anAnnouncement cull: announcer ] ].
	interceptors do: [ :each |
		each cull: anAnnouncement cull: announcer cull: self ]
