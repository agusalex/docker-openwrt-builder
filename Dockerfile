FROM alpine:3.7

RUN apk add asciidoc bash bc binutils bzip2 cdrkit coreutils diffutils \
findutils flex g++ gawk gcc gettext git grep intltool libxslt \
linux-headers make ncurses-dev openssl-dev patch perl \
python2-dev python3-dev rsync tar unzip util-linux wget zlib-dev

# set dummy git config
RUN git config --global user.name "user" && git config --global user.email "user@example.com"
RUN git clone https://github.com/agusalex/openwrt-aircube-isp && cd openwrt-aircube-isp && git checkout openwrt-19.07 && \
./scripts/feeds update -a && ./scripts/feeds install -a && make
