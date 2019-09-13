FROM nginx:alpine

ENV HOST now.nmplaybook.com
ENV PROTO https
ENV REDIRECT NM-Playbook-562e8caac1c94ec7893b5d97bbc82ec3

# Install gotpl
RUN wget -qO- https://github.com/wodby/gotpl/releases/download/0.1.5/gotpl-alpine-linux-amd64-0.1.5.tar.gz | tar xz -C /usr/local/bin

# Copy nginx templates
COPY nginx.tmpl /etc/nginx/conf.d/default.tmpl

# Use gotpl to generate nginx configuration from template
CMD gotpl /etc/nginx/conf.d/default.tmpl > /etc/nginx/conf.d/default.conf && \
    exec nginx -g 'daemon off;'
