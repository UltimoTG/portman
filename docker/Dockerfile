FROM lucee/lucee52:latest

# Install nginx and supervisord
COPY /docker/nginx/nginx_signing.key /tmp/nginx_signing.key
RUN apt-key add /tmp/nginx_signing.key
RUN echo "deb http://nginx.org/packages/debian/ stretch nginx" >> /etc/apt/sources.list
RUN set -x && \
	apt-get update && \
	apt-get install --no-install-recommends --no-install-suggests -y \
		nginx \
		supervisor && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Lucee config
COPY /docker/lucee/lucee-server.xml /opt/lucee/server/lucee-server/context/lucee-server.xml

# Copy default nginx config files
COPY /docker/nginx/nginx.conf /etc/nginx/
COPY /docker/nginx/default.conf /etc/nginx/conf.d/

# Copy supervisord.conf
COPY /docker/nginx/supervisord.conf /etc/supervisor/conf.d/

# Provide test page
RUN mkdir -p /var/www
COPY /docker/index.cfm /var/www/
ONBUILD RUN rm -rf /var/www/*

# Expose HTTP and HTTPS ports
EXPOSE 80 443

# Engage
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]