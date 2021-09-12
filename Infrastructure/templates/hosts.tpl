[NGINX]
Nginx ansible_host=${NGINX}

[REDIS]
Redis ansible_host=${REDIS}

[APP]
App ansible_host=${APP}

[ALL:children]
NGINX
REDIS
APP

