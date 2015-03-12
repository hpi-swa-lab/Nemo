tests
testOnSendTo
	| result blocks newSubscriptions |
	announcer := Announcer new.
	result := OrderedCollection new.
	blocks := {
		[result add: 0 ].
		[ :first | result add: first ].
		[ :first :second | result add: first; add: second ].
		[ :first :second :third | result add: first; add: second ]}.
	newSubscriptions := announcer on: Announcement send: #value to: blocks first..
	self assert: newSubscriptions class == SubscriptionCollection.
	self assert: newSubscriptions size = 1.
	announcer announce: Announcement.
	self assert: result asArray = #(0).
	newSubscriptions := announcer on: Announcement send: #value: to: blocks second.
	self assert: newSubscriptions class == SubscriptionCollection.
	self assert: newSubscriptions size = 1.
	announcer announce: Announcement.
	self assert: result size = 3.
	self assert: (result select: [ :each | each = 0 ]) size = 2.
	self assert: (result select: [ :each | each class == Announcement ]) size = 1.
	newSubscriptions := announcer on: Announcement send: #value:value: to: blocks third.	
	self assert: newSubscriptions class == SubscriptionCollection.
	self assert: newSubscriptions size = 1.
	announcer announce: Announcement.
	self assert: result size = 7.
	self assert: (result select: [ :each | each = 0 ]) size = 3.
	self assert: (result select: [ :each | each class == Announcement ]) size = 3.
	self assert: (result includes: announcer).
	self should:
		[ announcer on: Announcement send: #value:value:value: to: blocks fourth ]
		raise: Error