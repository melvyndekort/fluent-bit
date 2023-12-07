FROM busybox as source
RUN mkdir /state
RUN mkdir -p /var/log/journal

FROM fluent/fluent-bit
ADD https://github.com/newrelic/newrelic-fluent-bit-output/releases/download/v1.18.0/out_newrelic-linux-amd64-1.18.0.so /fluent-bit/lib/out_newrelic.so
COPY --from=source /state /
COPY --from=source /state /var/log/journal
COPY plugins.conf /fluent-bit/etc/plugins.conf
COPY fluent-bit.conf /fluent-bit/etc/fluent-bit.conf
