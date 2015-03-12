tests
testOnDo
	| results subscriptions newSubscriptions |
	announcer := Announcer new.
	results := OrderedCollection new.
	newSubscriptions := announcer on: Announcement do: [ results add: 0 ].
	self assert: newSubscriptions class == SubscriptionCollection.
	self assert: newSubscriptions size = 1.
	announcer announce: Announcement.
	self assert: results size = 1.
	self assert: results first = 0.
	newSubscriptions := announcer on: Announcement do: [ :anAnnouncement | 
		self assert: anAnnouncement class == Announcement.
		results add: 1].
	self assert: newSubscriptions class == SubscriptionCollection.
	self assert: newSubscriptions size = 1.
	announcer announce: Announcement.
	self assert: (results asSet = #(0 1) asSet).
	self assert: results size = 3.
	self assert: (results count: [ :each | each = 0]) = 2.
	self assert: (results count: [ :each | each = 1]) = 1.	
	newSubscriptions := announcer on: Announcement do: [ :anAnnouncement :anAnnouncer |
		self assert: anAnnouncement class == Announcement.
		self assert: anAnnouncer == announcer.
		results add: 2].
	self assert: newSubscriptions class == SubscriptionCollection.
	self assert: newSubscriptions size = 1.
	announcer announce: Announcement.
	self assert: (results asSet = #(0 1 2) asSet).
	self assert: results size = 6.
	self assert: (results count: [ :each | each = 0]) = 3.
	self assert: (results count: [ :each | each = 1]) = 2.	
	self assert: (results count: [ :each | each = 2]) = 1.			
	subscriptions := announcer subscriptionRegistry allSubscriptions.
	self assert: subscriptions size = 3.
	self assert: (subscriptions allSatisfy: [ :each |
		(each action == each subscriber) and: [ each action isBlock ] ]).
	self assert: (subscriptions collect: [ :each | each action numArgs]) asSet = #(0 1 2) asSet
