#!/bin/sh
DOCKER_IMAGE=$1
DOCKER_RUN="docker run --rm -i -v $(pwd):/local -w /local ${DOCKER_IMAGE}"

CMD="gcc -o hello_world hello_world.m \
    -I /usr/include/GNUstep -lgnustep-base -lobjc -fconstant-string-class=NSConstantString && \
    ./hello_world && \
    rm -f hello_world"
RESULT="$(${DOCKER_RUN} sh -c "${CMD}")"
echo "${RESULT}"
if [ "${RESULT}" = "Hello, world!" ]
then
    echo "PASSED"
else
    echo "FAILED"
    exit 1
fi
