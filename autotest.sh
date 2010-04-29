#!/bin/sh

MY_DIR=`dirname ${0}`

#######################
# settings
#######################
LASCUT=/opt/local/bin/rascut
FLEX_UNIT_PATH=/opt/flex/flexunit/libs
TEST_RUNNER_PATH=${MY_DIR}/src/TestRunner.mxml
LOG="/Users/sugamasao/Library/Preferences/Macromedia/Flash Player/Logs/flashlog.txt"

#######################
# exec autotest(rascut)
#######################
${LASCUT} -s --log="${LOG}" -c -compiler.library-path+=${FLEX_UNIT_PATH} ${TEST_RUNNER_PATH}

