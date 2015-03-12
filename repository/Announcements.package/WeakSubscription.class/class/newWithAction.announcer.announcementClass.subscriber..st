instance creation
newWithAction: aBlock announcer: anAnnouncer announcementClass: anAnnouncementClass subscriber: anObject

	| subscription |
	subscription := aBlock == anObject
		ifTrue: [
			WeakBlockSubscription
				newForAnnouncer: anAnnouncer
				announcementClass: anAnnouncementClass
				subscriber: anObject ]
		ifFalse: [
			super
				newWithAction: aBlock
				announcer: anAnnouncer
				announcementClass: anAnnouncementClass
				subscriber: anObject  ].
	anObject
		toFinalizeSend: #removeSubscription:
		to: anAnnouncer subscriptionRegistry
		with: subscription.
	^subscription