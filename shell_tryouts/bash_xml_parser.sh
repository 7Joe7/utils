#!/bin/sh

#- versioning/snapshot/buildNumber - extension of second item from snapshotVersions
# the given XML is in maven-metadata.xml

{
buildNumber="$(echo "cat /metadata/versioning/snapshot/buildNumber/text()" | xmllint --nocdata --shell maven-metadata.xml | sed '1d;$d')"
extension="$(echo "cat /metadata/versioning/snapshotVersions/*[2]/extension/text()" | xmllint --nocdata --shell maven-metadata.xml | sed '1d;$d')"
printf '%s\n' "Build number: $buildNumber" "Extension: $extension"
}