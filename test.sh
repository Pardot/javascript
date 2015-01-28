#!/bin/bash

# Runs style check tests against the samples directory.
# `./test.sh`
# By default, it'll use the default reporter (console).
#
# To run with the CI (output in JUnit format), run with
# `./test.sh ci`

readonly NPM_BIN_PATH="./node_modules/.bin"
readonly JSCS="${NPM_BIN_PATH}/jscs"
readonly JSHINT="${NPM_BIN_PATH}/jshint"

runTest () {
	local env="$1"

	for filename in $(find ./samples -name '*.js'); do
		local jscsConfig=""
		local jscsReporter=""
		local jscsOutput=""

		local jshintConfig=""
		local jshintReporter=""
		local jshintOutput=""

		if [[ -f "$(dirname ${filename})/.jscsrc" ]]; then
			jscsConfig=" --config $(dirname ${filename})/.jscsrc"
		fi

		if [[ -f "$(dirname ${filename})/.jshintrc" ]]; then
			jshintConfig=" --config $(dirname ${filename})/.jshintrc"
		fi

		if [[ "${env}" = "ci" ]]; then
			baseFilename=$(basename ${filename})

			jscsReporter=" --reporter junit"
			jscsOutput=" > test_results/jscs_${baseFilename}_results.xml"

			jshintReporter=" --reporter node_modules/jshint-junit-reporter/reporter.js"
			jshintOutput=" > test_results/jshint_${baseFilename}_results.xml"
		fi

		echo -e "\njscs ${filename}"
		eval "${JSCS} ${filename} ${jscsConfig} ${jscsReporter} ${jscsOutput}"

		echo -e "\njshint ${filename}"
		eval "${JSHINT} ${filename} ${jshintConfig} ${jshintReporter} ${jshintOutput}"
	done
}

# Passes either the first argument or if not exists, defaults to `console`.
runTest ${1:-console}
