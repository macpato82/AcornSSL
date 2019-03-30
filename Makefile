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
OBJS         = sslmod api upcalling confirmtask confirmenter timelib
CMHGDEPENDS  = sslmod api upcalling
CMHGFLAGS    = -IC:mbedTLS
ROMCDEFINES  = -DROM
RESFSDIR     = ${RESDIR}${SEP}URL${SEP}${TARGET}
HDRS         =
ASMCHDRS     = AcornSSL
ASMHDRS      = AcornSSL
CMHGAUTOHDR  = AcornSSL
CINCLUDES    = -IC:mbedTLS,TCPIPLibs:,C:
LIBS        += ${MBEDTLSLIB} ${ASMUTILS} ${TBOXLIB} ${WIMPLIB} ${NET5LIBS}
CDEFINES     = -DMBEDTLS_CONFIG_FILE="\"ro_config.h\""
CDFLAGS      = -DDEBUGLIB
INSTRES_FILES = Res StartDAS

include CModule

CFLAGS      += -Wp

# Dynamic dependencies:
