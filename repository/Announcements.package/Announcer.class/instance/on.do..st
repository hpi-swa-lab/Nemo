subscriptions
on: anAnnouncementClassOrCollection do: aBlock
	"For compatibiliy with Announcements package."
	
	^self 
		when: anAnnouncementClassOrCollection
		do: aBlock