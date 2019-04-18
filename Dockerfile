# FROM alpine:latest as mybase
# FROM arm32v7/alpine:latest as mybase
ARG FROM_IMAGE_NAME=alpine:latest
FROM $FROM_IMAGE_NAME:latest as mybase

COPY qemu-arm-static /usr/bin/

COPY iterate1day.sh /

RUN chmod 744 iterate1day.sh

CMD ["/iterate1day.sh"]


# docker run --rm --privileged multiarch/qemu-user-static:register --reset --credential yes
# (docker rmi manios/manifest-test:armv7 || true) && docker build -t manios/manifest-test:armv7 .
# docker run -it --rm manios/manifest-test:armv7


# docker manifest create manios/manifest-test:4.4.3 manios/manifest-test:latest manios/manifest-test:armv6 manios/manifest-test:armv7
# docker manifest annotate manios/manifest-test:4.4.3 manios/manifest-test:armv6 --arch armv6 --os linux --variant v6
# docker push manios/manifest-test:latest manios/manifest-test:armv6 manios/manifest-test:armv7

# docker annotate manios/manifest-test:4.4.3 