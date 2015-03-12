instance creation
newWithAction: aBlock announcer: anAnnouncer announcementClass: anAnnouncementClass subscriber: anObject 

	^self new 
		action: aBlock;
		announcer: anAnnouncer;
		announcementClass: anAnnouncementClass;
		subscriber: anObject;
		yourself