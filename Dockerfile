FROM alpine:edge

RUN apk add git build-base bash ncurses-dev perl tar findutils patch coreutils gawk grep unzip bzip2 wget python2 python3 curl diffutils bsd-compat-headers less diffutils zlib-dev file sudo && \
    addgroup -S user && \
    adduser -D -G user user && \
    echo 'user ALL=NOPASSWD: ALL' > /etc/sudoers.d/user

USER user
WORKDIR /home/user

# set dummy git config
RUN git config --global user.name "user" && git config --global user.email "user@example.com"
RUN git clone https://github.com/agusalex/openwrt-aircube-isp && cd openwrt-aircube-isp && git checkout openwrt-19.07 && \
./scripts/feeds update -a && ./scripts/feeds install -a
