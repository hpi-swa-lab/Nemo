accessing
subscriptionsOf: anObject for: anAnnouncementClassOrCollection

	^(self subscriptionsFor: anAnnouncementClassOrCollection) 
		select: [:each | 
			each subscriber == anObject ]
