tests
testRegisterBasic

	| subscription announcer announcementClass subscriber action |
	subscription := StrongSubscription new.
	announcer := Object new.
	announcementClass := Announcement .
	subscriber := Object new.
	action := [true].
	subscription := StrongSubscription 
		newWithAction: action
		announcer: announcer
		announcementClass: announcementClass 
		subscriber: subscriber.
	registry register: subscription.
	self assert: (registry subscriptionsFor: announcementClass) asArray = { subscription }.
	self assert: (registry subscriptionsOf: subscriber) asArray = { subscription }