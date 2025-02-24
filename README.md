# valgrind-builds

This repository automatically compiles and uploads Valgrind binaries for x86_64 and aarch64 architectures, on a cron schedule.

## Downloading Artifacts

You can download the artifacts from the [Releases](https://github.com/scufflecloud/valgrind-builds/releases) page.

For use in a CI pipeline, you can use the following action to download the artifacts:

```yaml
- name: Download Valgrind
  env:
    VALGRIND_VERSION: master
    INSTALL_PATH: /usr/local
    RELEASE_URL: 
  run: |
    set -eo pipefail
    curl -L "https://github.com/scufflecloud/valgrind-builds/releases/download/latest/valgrind-${VALGRIND_VERSION}-$(uname -s)-$(uname -m).tar.gz" | sudo tar -xzf - --strip-components=1 -C $INSTALL_PATH
    echo "VALGRIND_LIB=$INSTALL_PATH/libexec/valgrind" >> $GITHUB_ENV
```
