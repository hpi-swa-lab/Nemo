tests
testAll
	| calls calls2 misses intercepted intercepted2 |
	calls := 0.
	calls2 := 0.
	misses := 0.
	intercepted := false.
	intercepted2 := false.
	announcer when: Announcement do: [calls := calls + 1].
	announcer when: TestAnnouncement1 do: [calls2 := calls2 + 1].	
	announcer announce: Announcement.
	self assert: calls = 1.
	self assert: calls2 = 0.	
	announcer announce: TestAnnouncement1 .
	self assert: calls = 2.
	self assert: calls2 = 1.
	announcer subscriptionRegistry allSubscriptions suspendWhile: [
			(announcer subscriptionRegistry subscriptionsFor: TestAnnouncement1) interceptWith: [
				intercepted := true.
			] while: [
				(announcer subscriptionRegistry subscriptionsFor: Announcement) interceptWith: [
					intercepted2 := true.
				] while: [
					announcer announce: Announcement .
					self assert: intercepted not.
					self assert: intercepted2.
					intercepted2 := false.
					self assert: calls = 2.
					self assert: calls2 = 1.
					announcer announce: TestAnnouncement1.
					self assert: intercepted.
					self assert: intercepted2.
					intercepted := false.					
					intercepted2 := false.
					self assert: calls = 2.
					self assert: calls2 = 1.
					announcer subscriptionRegistry allSubscriptions interceptWith: [ :announcement :anAnnouncer :subscription |
						subscription deliver: announcement  from: anAnnouncer.
					] while: [
						announcer announce: TestAnnouncement1.
						self assert: intercepted.
						self assert: intercepted2.
						self assert: calls = 3.
						self assert: calls2 = 2.
						intercepted := false.					
						intercepted2 := false.
						announcer announce: Announcement.
						self assert: intercepted not.
						self assert: intercepted2.
						self assert: calls = 4.
						self assert: calls2 = 2.
						intercepted2 := false.
						announcer announce: TestAnnouncement2 .
						self assert: intercepted not.
						self assert: intercepted2.
						self assert: calls = 5.
						self assert: calls2 = 2.
						intercepted2 := false.
					].
					announcer announce: TestAnnouncement1.
					self assert: intercepted.
					self assert: intercepted2.
					intercepted := false.					
					intercepted2 := false.
					self assert: calls = 5.
					self assert: calls2 = 2.
					announcer announce: TestAnnouncement2.
					self assert: intercepted not.
					self assert: intercepted2.
					intercepted2 := false.
					self assert: calls = 5.
					self assert: calls2 = 2.				
				].
				(announcer subscriptionRegistry subscriptionsFor: Announcement) suspendWhile: [
					announcer announce: TestAnnouncement1.
					self assert: intercepted.
					self assert: intercepted2 not.
					intercepted := false.
					self assert: calls = 5.
					self assert: calls2 = 2.						
					self assert: misses = 0.
				] ifAnyMissed: [misses := misses + 1].
				self assert: misses = 1.
			].
			self assert: misses = 1.		
	] ifAnyMissed: [misses := misses + 1].
	self assert: misses = 2.

	