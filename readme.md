# docker-clang-format-3.8 [![Usable](https://img.shields.io/badge/is-usable-8e74b2.svg)](https://github.com/ericcrosson/usable)

> Docker environment for running clang-format

## Install

From dockerhub

``` {.sourceCode .bash}
docker pull hamroctopus/clang-format-3.8:1.1.0
./bin/build-docker
```

Manually

``` {.sourceCode .bash}
./bin/build-docker
```

## Use

Use `check-formatting` to identify improperly-formatted files

```yaml
code_format_check:
  image: hamroctopus/clang-format-3.8:1.1.0
  before_script:
    - export FMT_ERROR_MSG="Please run the script /my-repo/fix-formatting to resolve these issues."
  script:
    - find . \( -name packages -o -name .git -o -name .env -o -name 'build*' \) -prune
          -o \( -name '*.h' -o -name '*.hpp' -o -name '*.c' -o -name '*.cpp' \)
          -exec check-formatting {} \+
```

`check-formatting` will print the contents of `$FMT_ERROR_MSG` if
improperly-formatted files are detected.

## License

ISC © Eric Crosson
