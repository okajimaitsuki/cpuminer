This is a multi-threaded CPU miner for Litecoin and Bitcoin and BitZeny,
fork of Jeff Garzik's reference cpuminer.

License: GPLv2.  See COPYING for details.

Downloads:  https://sourceforge.net/projects/cpuminer/files/  
Git tree:   https://github.com/pooler/cpuminer


Build Instruction
------------------

### Dependencies

libcurl			http://curl.haxx.se/libcurl/  
jansson			http://www.digip.org/jansson/
(jansson is included in-tree)

Install Build Dependencies on Debian, Ubuntu and other APT-based distros:

    sudo apt-get install build-essential libcurl4-openssl-dev

Install Build Dependencies on Fedora, RHEL, CentOS and other yum-based distros:

    sudo yum install gcc make curl-devel

Install Build Dependencies on OpenSUSE and other ZYpp-based distros:

    sudo zypper in gcc make libcurl-devel
    
### Basic *nix build instructions

```
./autogen.sh	# only needed if building from git repo
./nomacro.pl	# in case the assembler doesn't support macros
./configure CFLAGS="-O3" # Make sure -O3 is an O and not a zero!
make
```

#### macOS build instructions

```bash
brew install curl
mkdir m4
cp /usr/local/Cellar/curl/7.58.0/share/aclocal/libcurl.m4 m4/
```

Add one line to Makefile.am

```
ACLOCAL_AMFLAGS = -I m4
```

Edit autogen.sh 

```
# aclocal
aclocal -I m4
```

Finaly same as *nix build

```bash
./autogen.sh
./nomacro.pl
./configure CFLAGS="-O3"
make
```

#### Notes for AIX users

* To build a 64-bit binary, export OBJECT_MODE=64
* GNU-style long options are not supported, but are accessible via configuration file


#### Architecture-specific notes

	ARM:	No runtime CPU detection. The miner can take advantage
		of some instructions specific to ARMv5E and later processors,
		but the decision whether to use them is made at compile time,
		based on compiler-defined macros.
		To use NEON instructions, add "-mfpu=neon" to CFLAGS.
	PowerPC: No runtime CPU detection.
		To use AltiVec instructions, add "-maltivec" to CFLAGS.
	x86:	The miner checks for SSE2 instructions support at runtime,
		and uses them if they are available.
	x86-64:	The miner can take advantage of AVX, AVX2 and XOP instructions,
		but only if both the CPU and the operating system support them.
		    * Linux supports AVX starting from kernel version 2.6.30.
		    * FreeBSD supports AVX starting with 9.1-RELEASE.
		    * Mac OS X added AVX support in the 10.6.8 update.
		The configure script outputs a warning if the assembler
		doesn't support some instruction sets. In that case, the miner
		can still be built, but unavailable optimizations are left off.
		The miner uses the VIA Padlock Hash Engine where available.

### Usage instructions:  Run "minerd --help" to see options.

Connecting through a proxy:  Use the --proxy option.
To use a SOCKS proxy, add a socks4:// or socks5:// prefix to the proxy host.
Protocols socks4a and socks5h, allowing remote name resolving, are also
available since libcurl 7.18.0.
If no protocol is specified, the proxy is assumed to be a HTTP proxy.
When the --proxy option is not used, the program honors the http_proxy
and all_proxy environment variables.

Also many issues and FAQs are covered in the forum thread
dedicated to this program,
	https://bitcointalk.org/index.php?topic=55038.0

Donations
---------

BitZeny : Zn586MBLa8dLdh9ueC9CAZ54noV83ZeXBj
BitCoin : 14aXANE9WfxRAu3LtcSo4z2VmENBWqyqs2
LiteCoin : LcTtEV3aPCiPqEABK9ujHK2wcATADqjur6
BitCoin Cash : 1JJQ54vQxUBChzNV1CC9QjEWpRNf8q29Su
ZCash : t1bWyu16VKzjYG7ZCcBydzLBT8bDSKg16PM

Happy mining!
