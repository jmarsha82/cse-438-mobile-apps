#!/usr/bin/env bash
set -euo pipefail

DESTINATION="${DESTINATION:-platform=iOS Simulator,name=iPhone 16}"

run_project() {
  local project_path="$1"
  local scheme="$2"

  echo "::group::Testing ${scheme}"
  xcodebuild test \
    -project "${project_path}" \
    -scheme "${scheme}" \
    -destination "${DESTINATION}" \
    -enableCodeCoverage YES \
    CODE_SIGNING_ALLOWED=NO
  echo "::endgroup::"
}

if [[ "$#" -eq 2 ]]; then
  run_project "$1" "$2"
  exit 0
fi

run_project "Lab1/Lab1.xcodeproj" "Lab1"
run_project "Lab2/Lab2.xcodeproj" "Lab2"
run_project "Lab3/Lab3.xcodeproj" "Lab3"
run_project "Lab4/Lab4.xcodeproj" "Lab4"
run_project "Lab5/Lab2.xcodeproj" "Lab5"
