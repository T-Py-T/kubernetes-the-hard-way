FROM haproxy:2.8-alpine

USER root
RUN set -x && \
    apk add --no-cache vim

# Expose port 6443 for Kubernetes API
EXPOSE 6443

# Copy over the pre-defined haproxy.cfg
COPY files/haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

# Optionally switch back to the default user (uncomment if needed)
# USER haproxy