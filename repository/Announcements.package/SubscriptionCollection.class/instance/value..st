private
value: anAnnouncement

	firstIndex to: lastIndex
		do: [ :i | (array at: i) value: anAnnouncement]
		