| gitPath gitCache |
Transcript cr; show: 'travis---->travisCI.st'.

MCFileBasedRepository flushAllCaches.
MCMcmUpdater updateFromDefaultRepository.

gitCache := 'git_cache'.
gitPath := (Smalltalk at: #'FileDirectory' ifAbsent: [  ])
  ifNil: [ ((Smalltalk at: #'FileSystem') workingDirectory / gitCache) pathString ]
  ifNotNil: [:fileDirectoryClass | (fileDirectoryClass default directoryNamed: gitCache ) fullName].

Metacello new
  baseline: 'Nemo';
  repository: 'filetree://', gitPath, '/BP2014H1/repository';
  get.

Metacello new
  baseline: 'Nemo';
  repository: 'filetree://', gitPath, '/BP2014H1/repository';
  load: 'TravisCI'.
  
(Smalltalk at: #MetacelloPlatform) current authorName: 'travisCI'.
FileStream stdout nextPutAll: 'Author set'; cr; flush.

"Run the tests"
TravisCIHarness
  value: #( 'BaselineOfNemo' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.
