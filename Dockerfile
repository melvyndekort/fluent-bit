FROM fluent/fluent-bit

ADD https://github.com/newrelic/newrelic-fluent-bit-output/releases/download/v1.14.1/out_newrelic-linux-amd64-1.14.1.so /fluent-bit/lib/out_newrelic.so

COPY plugins.conf /fluent-bit/etc/plugins.conf
COPY parsers.conf /fluent-bit/etc/parsers.conf
COPY fluent-bit.conf /fluent-bit/etc/fluent-bit.conf
