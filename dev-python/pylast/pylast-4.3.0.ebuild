# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} pypy3 )
inherit distutils-r1

DESCRIPTION="Python interface to last.fm and other api-compatible websites"
HOMEPAGE="https://github.com/pylast/pylast"
SRC_URI="https://github.com/${PN}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~riscv ~sparc ~x86"

RDEPEND="dev-python/six[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools_scm[${PYTHON_USEDEP}]
	test? ( dev-python/flaky[${PYTHON_USEDEP}] )
"

distutils_enable_tests --install pytest

export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
