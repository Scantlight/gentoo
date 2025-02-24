# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} pypy3 )
inherit distutils-r1

DESCRIPTION="Yet another URL library"
HOMEPAGE="https://github.com/aio-libs/yarl/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~x64-macos"

RDEPEND="
	>=dev-python/multidict-4.0[${PYTHON_USEDEP}]
	>=dev-python/idna-2.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/typing-extensions-3.7.4[${PYTHON_USEDEP}]
	' pypy3)
"

distutils_enable_tests pytest
distutils_enable_sphinx docs \
	dev-python/alabaster

python_test() {
	cd tests || die
	epytest --override-ini=addopts=
}
