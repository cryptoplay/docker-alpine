# vim: set ts=2 sw=2 ai et:

load options

@test "awscli shows help with no options" {
  run docker run --rm --read-only ${CAPS} cryptoplay/alpine apk help
  [[ ${output} =~ SYNOPSIS ]]
}

@test "awscli is the correct version" {
  run docker run --rm --read-only ${CAPS} cryptoplay/alpine apk info
  [[ ${output} =~ ${VERSION} ]]
}
