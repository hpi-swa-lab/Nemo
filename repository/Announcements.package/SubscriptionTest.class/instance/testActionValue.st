tests
testActionValue
	| anAnn anAnnouncer subscription |
	subscription := StrongSubscription new.
	subscription action: [true].
	self assert: (subscription value: Announcement new) = true.

	subscription := StrongSubscription new.	
	subscription action: [:ann | ann].
	anAnn := Announcement new.
	self assert: (subscription value: anAnn) = anAnn.
	
	subscription := StrongSubscription new.
	subscription action: [ :ann :announcer | {  ann. announcer} ].
	anAnnouncer := Object new.
	subscription announcer: anAnnouncer.
	self assert: (subscription value: anAnn) = { anAnn. anAnnouncer}.

	subscription action: [ :a :b :c | {  a. b. c} ].
	self should: [ subscription value: anAnn ]	raise: Error