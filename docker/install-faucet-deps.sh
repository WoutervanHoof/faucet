#!/bin/ash

set -euo pipefail

APK="apk --no-cache"
BUILDDEPS="git gcc python3-dev musl-dev parallel yaml-dev g++"
TESTDEPS="bitstring pytest wheel virtualenv pip"
PIP3="pip3 install --upgrade"
FROOT="/faucet-src"

dir=$(dirname "$0")

${APK} add -U ${BUILDDEPS}
"${dir}/retrycmd.sh" "${PIP3} ${TESTDEPS}"
"${dir}/retrycmd.sh" "${PIP3} -r ${FROOT}/requirements.txt"

apk add libstdc++