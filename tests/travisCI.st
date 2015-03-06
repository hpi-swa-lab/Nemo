| gitPath gitCache |
Transcript cr; show: 'travis---->travisCI.st'.

MetacelloPlatform current authorName: 'travisCI'.
FileStream stdout nextPutAll: 'Author set'; cr; flush.

MCFileBasedRepository flushAllCaches.
MCMcmUpdater updateFromDefaultRepository.

gitCache := 'git_cache'.
gitPath := (Smalltalk at: #'FileDirectory' ifAbsent: [  ])
  ifNil: [ ((Smalltalk at: #'FileSystem') workingDirectory / gitCache) pathString ]
  ifNotNil: [:fileDirectoryClass | (fileDirectoryClass default directoryNamed: gitCache ) fullName].

Metacello new
  baseline: 'BPH12014';
  repository: 'filetree://', gitPath, '/BP2014H1/repository';
  get.

Metacello new
  baseline: 'BPH12014';
  repository: 'filetree://', gitPath, '/BP2014H1/repository';
  load: 'TravisCI'.

"Run the tests"
TravisCIHarness
  value: #( 'BaselineOfBPH12014' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.
