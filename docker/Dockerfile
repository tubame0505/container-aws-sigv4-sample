FROM openresty/openresty:buster

# libs
WORKDIR /tmp
RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends jq openresty-opm  \
    && rm -rf /var/lib/apt/lists \
    && chmod g-s /usr/bin/wall /usr/bin/expiry /sbin/unix_chkpwd /usr/bin/chage \
    && chmod u-s /usr/bin/chfn /usr/bin/chsh /bin/su /usr/bin/gpasswd /usr/bin/newgrp /bin/umount /usr/bin/passwd /bin/mount
RUN opm get jkeys089/lua-resty-hmac
COPY ./submodules/lua-resty-aws-sign/lib/resty/aws-sign.lua /usr/local/openresty/lualib/resty/aws-sign.lua

# Server config
COPY ./conf/nginx.conf /usr/local/openresty${RESTY_DEB_FLAVOR}/nginx/conf/nginx.conf
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./html /usr/local/openresty${RESTY_DEB_FLAVOR}/nginx/html

COPY ./scripts/startup.sh /usr/bin/startup.sh
RUN chmod 700 "/usr/bin/startup.sh"
CMD ["/usr/bin/startup.sh"]
