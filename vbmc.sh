#!/bin/bash
/bin/rm -fv /root/.vbmc/master.pid
exec /usr/local/bin/vbmcd --foreground
