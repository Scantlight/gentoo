# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=JSTOWE
DIST_VERSION=2.38
DIST_EXAMPLES=("example/*")
inherit perl-module

DESCRIPTION="Change terminal modes, and perform non-blocking reads"

SLOT="0"
KEYWORDS="~alpha ~amd64 arm arm64 ~hppa ~ia64 ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~x64-cygwin ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"

BDEPEND="
	>=virtual/perl-ExtUtils-MakeMaker-6.580.0
"
