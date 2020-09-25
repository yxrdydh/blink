#!/bin/bash

set -e

DEPS_VERSION="2.4"

GHROOT="https://github.com/blinksh"
HHROOT="https://github.com/holzschu"

(

cd "${BASH_SOURCE%/*}/Frameworks"
echo "Downloading frameworks"
curl -OL $HHROOT/ios_system/releases/download/v$DEPS_VERSION/release.tar.gz
( tar -xzf release.tar.gz --strip 1 && rm release.tar.gz ) || { echo "Frameworks failed to download"; exit 1; }

)

# We need ios_system for the sources of curl_static too:
(# ios_system
cd "${BASH_SOURCE%/*}/Frameworks/ios_system"
sh ./get_sources.sh
)
