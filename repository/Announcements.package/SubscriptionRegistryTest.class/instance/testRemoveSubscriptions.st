tests
testRemoveSubscriptions
	| subscriptions subscriber |
	subscriber := TestSubscriber new.
	subscriptions := {
		StrongSubscription new
			announcer: Object new;
			announcementClass: TestAnnouncement1;
			subscriber: subscriber;
			action: [:a :b| true].
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
			announcementClass: TestAnnouncement2 ;
			subscriber: subscriber;
			action: [:a :b| true].
		}.
	subscriptions do: [:each |
		registry register: each.
	].
	self assert: (registry subscriptionsOf: subscriber) size = 4.
	self assert: (registry subscriptionsOf: subscriber for: TestAnnouncement1) size = 2.
	self assert: (registry subscriptionsOf: subscriber for: TestAnnouncement2) size = 2.
	self assert: (registry subscriptionsOf: subscriber for: Announcement) size = 0.
	self assert: ((registry subscriptionsOf: subscriber) includes: subscriptions first).			
	self assert: ((registry subscriptionsOf: subscriber) includes: subscriptions second).			
	self assert: ((registry subscriptionsOf: subscriber) includes: subscriptions third).			
	self assert: ((registry subscriptionsOf: subscriber) includes: subscriptions fourth).			
	registry removeSubscriptions: {subscriptions first}.
	self assert: (registry subscriptionsOf: subscriber) size = 3.
	self assert: (registry subscriptionsOf: subscriber for: TestAnnouncement1) size = 1.
	self assert: (registry subscriptionsOf: subscriber for: TestAnnouncement2) size = 2.
	self assert: ((registry subscriptionsOf: subscriber) includes: subscriptions second).			
	self assert: ((registry subscriptionsOf: subscriber) includes: subscriptions third).			
	self assert: ((registry subscriptionsOf: subscriber) includes: subscriptions fourth).			
	registry removeSubscriptions: {subscriptions third}.
	self assert: (registry subscriptionsOf: subscriber) size = 2.
	self assert: (registry subscriptionsOf: subscriber for: TestAnnouncement1) size = 1.
	self assert: (registry subscriptionsOf: subscriber for: TestAnnouncement2) size = 1.
	self assert: ((registry subscriptionsOf: subscriber) includes: subscriptions second).			
	self assert: ((registry subscriptionsOf: subscriber) includes: subscriptions fourth).			
	registry removeSubscriptions: {subscriptions fourth}.
	self assert: (registry subscriptionsOf: subscriber) size = 1.
	self assert: (registry subscriptionsOf: subscriber for: TestAnnouncement1) size = 1.
	self assert: ((registry subscriptionsOf: subscriber) includes: subscriptions second).			
	registry removeSubscriptions: {subscriptions second}.
	"Implementation specific parts!!!!"
	self assert: (registry instVarNamed: #subscriptionsByAnnouncementClasses) size = 0.

	"Doesn't work :(
	subscriber := subscriber hash.
	Smalltalk garbageCollect.
	self assert: (TestSubscriber allInstances noneSatisfy: [:each | each hash = subscriber])."

