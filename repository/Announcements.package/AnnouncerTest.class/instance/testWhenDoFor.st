tests
testWhenDoFor
	| results subscriptions subscriber1 subscriber2 newSubscriptions |
	announcer := Announcer new.
	results := OrderedCollection new.
	subscriber1 := Object new.
	subscriber2 := Object new.
	newSubscriptions := announcer when: Announcement do: [ results add: 0 ] for: subscriber1.
	self assert: newSubscriptions class == SubscriptionCollection.
	self assert: newSubscriptions size = 1.
	announcer announce: Announcement.
	self assert: results size = 1.
	self assert: results first = 0.
	newSubscriptions := announcer when: Announcement do: [ :anAnnouncement | 
		self assert: anAnnouncement class == Announcement.
		results add: 1] for: subscriber2.
	self assert: newSubscriptions class == SubscriptionCollection.
	self assert: newSubscriptions size = 1.
	announcer announce: Announcement.
	self assert: (results asSet = #(0 1) asSet).
	self assert: results size = 3.
	self assert: (results count: [ :each | each = 0]) = 2.
	self assert: (results count: [ :each | each = 1]) = 1.	
	newSubscriptions := announcer when: Announcement do: [ :anAnnouncement :anAnnouncer |
		self assert: anAnnouncement class == Announcement.
		self assert: anAnnouncer == announcer.
		results add: 2] for: subscriber1.
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
	self assert: (subscriptions select: [ :each | each subscriber == subscriber1 ]) size = 2.
	self assert: (subscriptions select: [ :each | each subscriber == subscriber1 ] thenCollect:
		[ :each | each action numArgs]) asSet = #(0 2) asSet.
	self assert: (subscriptions select: [ :each | each subscriber == subscriber2 ]) size = 1.
	self assert: (subscriptions select: [ :each | each subscriber == subscriber2 ] thenCollect:
		[ :each | each action numArgs]) asSet = #(1) asSet.
	self assert: (subscriptions collect: [ :each | each action numArgs]) asSet = #(0 1 2) asSet