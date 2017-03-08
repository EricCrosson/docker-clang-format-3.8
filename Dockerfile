FROM ubuntu:xenial
MAINTAINER Eric Crosson <ecrosson@shoretel.com>

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
apt-get install -y --no-install-recommends clang-format-3.8 && \
apt-get clean && rm -rf /var/lib/apt/lists/* && \
ln -s "$(which clang-format-3.8)" /usr/bin/clang-format

COPY bin/check-formatting /usr/bin/check-formatting

# switch to uid/gid identical to host uid/gid (forks/users), if not
# doing this, files that clang-format written will change user and
# group all to root.
USER 1000:100

WORKDIR /code
ENTRYPOINT []

ARG VERSION
ARG RELEASE_DATE

LABEL vendor="ShoreTel" \
version="${VERSION}" \
release_date="${RELEASE_DATE}"
