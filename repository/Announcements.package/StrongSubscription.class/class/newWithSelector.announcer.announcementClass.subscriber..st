instance creation
newWithSelector: aSelector announcer: anAnnouncer announcementClass: anAnnouncementClass subscriber: anObject

	| block |
	block := self blockFor: anObject withSelector: aSelector.
	^self new
		action: block;
		announcer: anAnnouncer;
		announcementClass: anAnnouncementClass;
		subscriber: anObject;
		selector: aSelector;
		yourself