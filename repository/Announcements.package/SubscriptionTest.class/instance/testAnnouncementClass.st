tests
testAnnouncementClass

	| subscription |
	subscription := Subscription new.
	subscription announcementClass: Announcement.
	self assert: subscription announcementClass = Announcement.
