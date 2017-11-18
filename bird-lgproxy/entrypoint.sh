#!/bin/sh

exec gunicorn -u "${LGUID}" -g "${LGGID}" -b 0.0.0.0:8000 $@

