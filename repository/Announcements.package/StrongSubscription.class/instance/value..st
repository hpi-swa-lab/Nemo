delivery
value: anAnnouncement

	interceptors ifNil: [ ^action cull: anAnnouncement cull: announcer ].
	interceptors do: [ :each |
		each cull: anAnnouncement cull: announcer cull: self ]
