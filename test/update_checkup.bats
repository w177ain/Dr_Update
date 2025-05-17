#!/usr/bin/env bats

setup() {
  TMPDIR=$(mktemp -d)
  mkdir "$TMPDIR/fakebin"
  PATH="$TMPDIR/fakebin:$PATH"
  cat <<'EOS' > "$TMPDIR/fakebin/sudo"
#!/bin/sh
exit 0
EOS
  chmod +x "$TMPDIR/fakebin/sudo"
  cat <<'EOS' > "$TMPDIR/fakebin/apt-get"
#!/bin/sh
exit 0
EOS
  chmod +x "$TMPDIR/fakebin/apt-get"
  cat <<'EOS' > "$TMPDIR/fakebin/apt"
#!/bin/sh
exit 0
EOS
  chmod +x "$TMPDIR/fakebin/apt"
}

teardown() {
  rm -rf "$TMPDIR"
}

@test "script runs with LOG_DIR set" {
  export LOG_DIR="$TMPDIR/logs"
  mkdir "$LOG_DIR"
  touch "$LOG_DIR/example.log"
  run bash update_checkup.sh
  [ "$status" -eq 0 ]
}
