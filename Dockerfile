FROM busybox as source
RUN mkdir /state
RUN mkdir -p /var/log/journal

FROM newrelic/newrelic-fluentbit-output:1.19.2
COPY --from=source /state /
COPY --from=source /var/log/journal /var/log/journal
COPY fluent-bit.conf /fluent-bit/etc/fluent-bit.conf
