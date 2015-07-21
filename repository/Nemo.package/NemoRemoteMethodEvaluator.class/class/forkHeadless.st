preferences
forkHeadless
	<preference: 'Fork headless'
	category: 'Nemo Browser'
	description: 'This is a debug option to start the forked Squeak environment with a graphical interface. If false, forking timeout is ignored and the parent VM will block until the forked child VM has finished execution.'
	type: #Boolean>
	^ RemoteTask headlessChild