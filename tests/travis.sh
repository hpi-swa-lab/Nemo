$BUILDER_CI_HOME/testTravisCI.sh -verbose
exitcode=$?

if [ $exitcode -eq 0 ]; then
    if [ "$ST" == "Squeak-4.5" ]; then
	set -x
	echo Uploading $BUILDER_CI_HOME/images/*.image
	# cp $BUILDER_CI_HOME/images/*.image BP2014H1.image
	cd $PROJECT_HOME
	echo $PWD
	cp $BUILDER_CI_HOME/images/*.image BP2014H1.image
	cp $BUILDER_CI_HOME/images/*.changes BP2014H1.changes
	cp $BUILDER_CI_HOME/sources/*.sources .
	echo "$VM_PATH/Linux/squeak -nosound -plugins "$VM_PATH/Linux" -encoding Latin1 -nodisplay BP2014H1.image"
	bash -c "while true; do printf .; sleep 10; done" &
	$VM_PATH/Linux/squeak -nosound -plugins "$VM_PATH/Linux" -encoding Latin1 -nodisplay BP2014H1.image tests/build_image.st
	echo "uploading..."
	curl -T BP2014H1.image http://www.lively-kernel.org/babelsberg/BP2014H1/
	curl -T BP2014H1.changes http://www.lively-kernel.org/babelsberg/BP2014H1/
	curl -T *.sources http://www.lively-kernel.org/babelsberg/BP2014H1/
    fi
fi
exit $exitcode
