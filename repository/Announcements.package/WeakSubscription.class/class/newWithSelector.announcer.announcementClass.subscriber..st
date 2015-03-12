instance creation
newWithSelector: aSelector announcer: anAnnouncer announcementClass: anAnnouncementClass subscriber: anObject

	| subscription block |
	block := self blockFor: (WeakArray with: anObject) withSelector: aSelector.
	subscription := self new
		action: block;
		announcer: anAnnouncer;
		announcementClass: anAnnouncementClass;
		subscriber: anObject;
		selector: aSelector;
		yourself.
	anObject
		toFinalizeSend: #removeSubscription:
		to: anAnnouncer subscriptionRegistry
		with: subscription.
	^subscription