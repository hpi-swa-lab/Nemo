#!/bin/bash -x
$BUILDER_CI_HOME/testTravisCI.sh -verbose
exitcode=$?

if [ $exitcode -eq 0 ]; then
    if [ "$ST" == "Squeak-Trunk" ]; then
	set -x
	echo Uploading $ST-Image from $BUILDER_CI_HOME/images/*.image
	cd $PROJECT_HOME
	echo $PWD
	cp $BUILDER_CI_HOME/images/*.image Nemo.image
	cp $BUILDER_CI_HOME/images/*.changes Nemo.changes
	cp $BUILDER_CI_HOME/sources/*.sources .
	echo "$VM_PATH/Linux/squeak -nosound -plugins "$VM_PATH/Linux" -encoding Latin1 -nodisplay Nemo.image tests/build_image.st"
	bash -c "while true; do printf .; sleep 10; done" &
	$VM_PATH/Linux/squeak -nosound -plugins "$VM_PATH/Linux" -encoding Latin1 -nodisplay Nemo.image tests/build_image.st
	echo "uploading..."
	curl -T Nemo.image http://www.lively-kernel.org/babelsberg/BP2014H1/
	curl -T Nemo.changes http://www.lively-kernel.org/babelsberg/BP2014H1/
	curl -T *.sources http://www.lively-kernel.org/babelsberg/BP2014H1/
    fi
fi
if [ $exitcode -eq 1 ]; then
    if [ "$ST" == "Squeak-Trunk" ]; then
	set -x
	echo Uploading errored $ST-Image from $BUILDER_CI_HOME/images/*.image
	cd $PROJECT_HOME
	echo $PWD
	cp $BUILDER_CI_HOME/images/*.image Nemo_failing.image
	cp $BUILDER_CI_HOME/images/*.changes Nemo_failing.changes
	cp $BUILDER_CI_HOME/sources/*.sources .
	echo "$VM_PATH/Linux/squeak -nosound -plugins "$VM_PATH/Linux" -encoding Latin1 -nodisplay Nemo_failing.image"
	bash -c "while true; do printf .; sleep 10; done" &
	$VM_PATH/Linux/squeak -nosound -plugins "$VM_PATH/Linux" -encoding Latin1 -nodisplay Nemo_failing.image tests/build_image.st
	echo "uploading..."
	curl -T Nemo_failing.image http://www.lively-kernel.org/babelsberg/BP2014H1/
	curl -T Nemo_failing.changes http://www.lively-kernel.org/babelsberg/BP2014H1/
	curl -T *.sources http://www.lively-kernel.org/babelsberg/BP2014H1/
    fi
fi
exit $exitcode
