delivery
deliver: anAnnouncement from: anAnnouncer

	^(subscriber at: 1) ifNotNil: [ :action |
		action cull: anAnnouncement cull: anAnnouncer ]