as yet unclassified
baseline: spec
	<baseline>
	
	spec for: #common do: [
		spec project: 'BaselineOfCOPPlayground' with: [
			spec
				className: 'BaselineOfCOPPlayground';
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository'].

		spec package: 'VB-Regex' with: [
			spec
				repository: 'http://www.squeaksource.com/Regex'].

		spec project: 'SqueakOverflow' with: [
			spec
				className: 'BaselineOfSqueakOverflow';
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository'].

		spec package: 'Traits' with: [
			spec
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository'].

		spec package: 'Announcements' with: [
			spec
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository'].

		spec package: 'AST-Core' with: [
			spec
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository'].

		spec package: 'Tools-MethodFinder' with: [
			spec
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository'].

		spec package: 'BPH12014' with: [
			spec
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository';
				requires: #('Traits' 'Announcements' 'AST-Core' 'VB-Regex')].

		spec
			group: 'default' with: #('core');
			group: 'TravisCI' with: #('core');
			group: 'core' with: #('BPH12014' 'BaselineOfCOPPlayground' 'SqueakOverflow' 'Tools-MethodFinder')].