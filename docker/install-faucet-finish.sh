#!/bin/ash

set -euo pipefail

APK="apk --no-cache"
BUILDDEPS="git gcc python3-dev musl-dev parallel yaml-dev g++"
TESTDEPS="bitstring pytest wheel virtualenv pip"
PIP3="pip3 install --upgrade"
FROOT="/faucet-src"

# pip3 uninstall -y ${TESTDEPS} || exit 1
# for i in ${BUILDDEPS} ; do
#   ${APK} del "$i" || exit 1
# done
# # Needed by greenlet.
# apk add libstdc++

# Clean up
# rm -r "${HOME}/.cache"
# rm -r "${FROOT}"
# rm -r /usr/local/lib/python3*/site-packages/os_ken/tests/
# rm -r /usr/local/lib/python3*/site-packages/os_ken/lib/of_config/
# rm /usr/local/lib/python3*/site-packages/os_ken/cmd/of_config_cli.py

# Smoke test
faucet -V || exit 1

find / -name \*pyc -delete || exit 1
