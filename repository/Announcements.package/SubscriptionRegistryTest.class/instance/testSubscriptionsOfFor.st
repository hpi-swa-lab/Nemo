tests
testSubscriptionsOfFor
	| subscriptions subscriber |
	subscriber := Object new.
	subscriptions := {
		StrongSubscription new
			announcer: Object new;
			announcementClass: TestAnnouncement1;
			subscriber: subscriber;
			action: [:a :b| true].
		StrongSubscription new
			announcer: Object new;
			announcementClass: TestAnnouncement2;
			subscriber: subscriber;
			action: [:a :b| true].
		StrongSubscription new
			announcer: Object new;
			announcementClass: TestAnnouncement2;
			subscriber: Object new;
			action: [:a :b| true].
		StrongSubscription new
			announcer: Object new;
			announcementClass: Announcement ;
			subscriber: subscriber;
			action: [:a :b| true].
		}.
	registry register: subscriptions first.
	registry register: subscriptions second.
	registry register: subscriptions third.
	self assert: (registry subscriptionsOf: subscriber for: TestAnnouncement1 ) asArray = {subscriptions first.}.
	self assert: (registry subscriptionsOf: subscriber for: TestAnnouncement2 ) asArray = {subscriptions second.}.
	self assert: (registry subscriptionsOf: subscriber for: Announcement  ) asArray = {}.
	self assert: (registry subscriptionsOf: subscriber for: {TestAnnouncement1. TestAnnouncement2.} ) asSet = {subscriptions first. subscriptions second} asSet.
	self assert: (registry subscriptionsOf: Object new for: TestAnnouncement1 ) asArray = {}.
	self assert: (registry subscriptionsOf: Object new for: {TestAnnouncement1. TestAnnouncement2.} ) asArray = {}.
	
	registry register: subscriptions fourth.
	self assert: (registry subscriptionsOf: subscriber for: TestAnnouncement1 ) asArray = {subscriptions first.}.
