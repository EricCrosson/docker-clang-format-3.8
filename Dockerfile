FROM debian:sid
MAINTAINER Eric Crosson <ecrosson@shoretel.com>

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
apt-get install -y --no-install-recommends clang-format-3.8=1:3.8.1-17 && \
apt-get clean && rm -rf /var/lib/apt/lists/* && \
ln -s "$(which clang-format-3.8)" /usr/bin/clang-format

# switch to uid/gid identical to host uid/gid (forks/users), if not doing this, files that
# clang-format written will change user and group all to root.
USER 1000:100

ENTRYPOINT []
