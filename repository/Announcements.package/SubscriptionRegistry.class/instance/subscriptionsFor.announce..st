private
subscriptionsFor: anAnnouncementClass announce: anAnnouncement

	subscriptionsByAnnouncementClasses
		at: anAnnouncementClass
		ifPresent: [ :subscriptionCollection |
			subscriptionCollection value: anAnnouncement ]
