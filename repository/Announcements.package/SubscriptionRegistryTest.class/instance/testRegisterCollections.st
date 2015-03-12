tests
testRegisterCollections

	| subscriptions |
	subscriptions := {
		StrongSubscription new
			announcer: Object new;
			announcementClass: TestAnnouncement1;
			subscriber: Object new;
			action: [:a :b| true].
		StrongSubscription new
			announcer: Object new;
			announcementClass: TestAnnouncement2;
			subscriber: Object new;
			action: [:a :b| true].
		}.
	registry register: subscriptions first.
	registry register: subscriptions second.
	self assert: (registry subscriptionsFor: TestAnnouncement1 ) asArray = {subscriptions first.}.
	self assert: (registry subscriptionsFor: TestAnnouncement2 ) asArray = {subscriptions second.}.
	self assert: (registry subscriptionsFor: Announcement ) asSet = Set new