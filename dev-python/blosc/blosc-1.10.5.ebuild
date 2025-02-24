# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

MY_P=python-blosc-${PV}
DESCRIPTION="High performance compressor optimized for binary data"
HOMEPAGE="http://python-blosc.blosc.org"
SRC_URI="
	https://github.com/Blosc/python-blosc/archive/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz"
S=${WORKDIR}/${MY_P}

SLOT="0"
LICENSE="MIT"
KEYWORDS="~amd64 ~arm ~arm64 ~hppa ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-libs/c-blosc-1.19.0:="
DEPEND="${RDEPEND}"
BDEPEND="
	dev-python/scikit-build[${PYTHON_USEDEP}]
	test? (
		dev-python/numpy[${PYTHON_USEDEP}]
	)
"

DOCS=( ANNOUNCE.rst README.rst RELEASE_NOTES.rst )

python_prepare_all() {
	export USE_SYSTEM_BLOSC=1
	export BLOSC_DIR="${EPREFIX}/usr"
	distutils-r1_python_prepare_all
}

python_test() {
	"${EPYTHON}" -m blosc.test -v || die
}

python_install() {
	distutils-r1_python_install
	python_optimize
}
