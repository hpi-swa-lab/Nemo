instance creation
newForAnnouncer: anAnnouncer announcementClass: anAnnouncementClass subscriber: anObject

	^self new
		announcer: anAnnouncer;
		announcementClass: anAnnouncementClass;
		subscriber: anObject;
		yourself