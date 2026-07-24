# AcornSSL for RISC OS

AcornSSL is the RISC OS TLS module used by browser and network clients. This
port is version 2.00 and is built against Mbed TLS 4.1.0.

The module identifies itself as:

```text
AcornSSL 2.00 (24 Jul 2026) (Mbed TLS 4.1.0)
```

## Enhancements and changes

- Updated the compatibility layer for the Mbed TLS 4.1.0 API and PSA crypto
  interface.
- Updated socket, timeout, certificate-confirmation and upcall handling for
  the current TCPIPLibs interfaces.
- Added a RISC OS boolean compatibility header and explicit resource
  generation input for reproducible DDE builds.
- Added DDE/AMU defaults for the Mbed TLS, AsmUtils, Toolbox, Wimp and TCP/IP
  libraries.
- Uses CMunge to generate the 32-bit module header and exports the linked
  Mbed TLS version in the module help text.

## Building

Build from a RISC OS DDE or AMU environment with the Mbed TLS 4.1.0 export and
TCPIPLibs available:

```text
riscos-amu
```

The default build produces the 32-bit RAM module at:

```text
rm32/AcornSSL,ffa
```

The Mbed TLS include and library locations can be overridden when invoking
AMU:

```text
riscos-amu MBEDTLSINC=-IC:mbedTLS MBEDTLSLIB=C:mbedTLS.o.mbedTLSzm-32
```

The module build uses the project licence in `LICENCE`.
