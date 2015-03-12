subscriptions
on: anAnnouncementClassOrCollection send: aSelector to: anObject
	"For compatibiliy with Announcements package."
	
	^self
		when: anAnnouncementClassOrCollection 
		send: aSelector
		to: anObject