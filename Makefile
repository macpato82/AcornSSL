#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "Licence").
# You may not use this file except in compliance with the Licence.
#
# You can obtain a copy of the licence at
# cddl/RiscOS/Sources/Networking/Fetchers/AcornSSL/LICENCE.
# See the Licence for the specific language governing permissions
# and limitations under the Licence.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the Licence file. If applicable, add the
# following below this CDDL HEADER, with the fields enclosed by
# brackets "[]" replaced with your own identifying information:
# Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
#
# Copyright 2018, RISC OS Open Ltd.  All rights reserved.
# Use is subject to license terms.
#
# Makefile for AcornSSL
#

COMPONENT    = AcornSSL
# Norcroft 5.18 can otherwise run out of compiler resources while parsing
# the modern MbedTLS SSL context declarations.
OPTIMISE     = size
CLIBTYPE     = generic
DDE_CXX_DIR  = ${C/C++$Dir}
ifeq ("${DDE_CXX_DIR}","")
OBJS         = o.AcornSSLHdr o.Resources o.sslmod o.api o.upcalling o.confirmtask o.confirmenter o.timelib
else
OBJS         = AcornSSLHdr Resources sslmod api upcalling confirmtask confirmenter timelib
endif
CMHGFILE     = AcornSSLHdr
CMHGDEPENDS  = sslmod api upcalling
ROMCDEFINES  = -DROM
RESFSDIR     = ${RESDIR}${SEP}URL${SEP}${TARGET}
HDRS         =
ASMCHDRS     = AcornSSL
ASMHDRS      = AcornSSL
CMHGAUTOHDR  = AcornSSL

ifeq ("${MBEDTLSINC}","")
MBEDTLSINC  = -IC:mbedTLS
endif
ifeq ("${TCPIPINC}","")
TCPIPINC    = -ITCPIPLibs:
endif
ifeq ("${MBEDTLSLIB}","")
MBEDTLSLIB  = C:mbedTLS.o.mbedTLSzm
endif

CINCLUDES    = ${MBEDTLSINC} ${TCPIPINC}
LIBS        += ${MBEDTLSLIB} ${ASMUTILS} ${TBOXLIB} ${WIMPLIB} ${NET5LIBS}
CDEFINES     = -DMBEDTLS_CONFIG_FILE="\"ro_config.h\"" -DMBEDTLS_ALLOW_PRIVATE_ACCESS
CDFLAGS      = -DDEBUGLIB
INSTRES_FILES = Res StartDAS

# The DDE AMU environment does not provide these legacy library variables by
# default.  Keep the library names explicit so the module links identically in
# a clean DDE export and in the standalone AMU build.
ASMUTILS     ?= C:AsmUtils.o.AsmUtils
TBOXLIB      ?= C:tboxlibs.o.toolboxlib C:tboxlibs.o.eventlib
WIMPLIB      ?= C:tboxlibs.o.wimplib
NET5LIBS     ?= TCPIPLibs:o.unixlib TCPIPLibs:o.inetlib TCPIPLibs:o.socklib5

include CModule

CFLAGS      += ${C_NOWARN_NON_ANSI_INCLUDES} ${MBEDTLSINC} ${TCPIPINC}
CMHGFLAGS_BASE += ${MBEDTLSINC} ${TCPIPINC}

oz32/Resources: ResGenVia
	${RESGEN} Resources $@ -via ResGenVia

# Dynamic dependencies:
