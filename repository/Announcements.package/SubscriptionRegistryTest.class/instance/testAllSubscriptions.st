tests
testAllSubscriptions
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
		StrongSubscription new
			announcer: Object new;
			announcementClass: TestAnnouncement2;
			subscriber: Object new;
			action: [:a :b| true].
		}.
	registry register: subscriptions first.
	registry register: subscriptions second.
	registry register: subscriptions third.
	self assert: (registry allSubscriptions  ) asSet = subscriptions asSet.
