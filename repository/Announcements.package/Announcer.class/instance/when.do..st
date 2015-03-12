subscriptions
when: anAnnouncementClassOrCollection do: aBlock 

	^self 
		when: anAnnouncementClassOrCollection
		do: aBlock
		for: aBlock.