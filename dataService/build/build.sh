#!/bin/sh

WORK_DIR=$(cd $(dirname $0);pwd)
mkdir ${WORK_DIR}/tmp 2>/dev/null
cd ${WORK_DIR}/tmp

ZSS=../zss
ZOWECOMMON=${ZSS}/deps/zowe-common-c

mkdir ../../../lib 2>/dev/null

c89 -D_OPEN_THREADS -D_XOPEN_SOURCE=600 -DAPF_AUTHORIZED=0 -DNOIBMHTTP \
"-Wa,goff" "-Wc,langlvl(EXTC99),float(HEX),agg,expo,list(),so(),search(),\
goff,xref,gonum,roconst,gonum,asm,asmlib('SYS1.MACLIB'),asmlib('CEE.SCEEMAC'),dll" -Wl,dll \
-I ${ZSS}/h -I ${ZOWECOMMON}/h \
-o ../../../lib/ipExplorer.so \
../../src/ipExplorerDataService.c \
../pluginAPI.x \

extattr +p ../../../lib/ipExplorer.so
