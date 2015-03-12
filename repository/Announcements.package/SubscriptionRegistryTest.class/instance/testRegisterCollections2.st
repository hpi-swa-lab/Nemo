tests
testRegisterCollections2
	| subscription |
	subscription :=
		StrongSubscription new
			announcer: Object new;
			announcementClass: Announcement;
			subscriber: Object new;
			action: [:a :b| true].
	registry register: subscription.
	self assert: (registry subscriptionsFor: TestAnnouncement1) asSet = #() asSet
			
