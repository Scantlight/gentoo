# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake flag-o-matic

DESCRIPTION="Scalable Video Technology for AV1 (SVT-AV1 Encoder and Decoder)"
HOMEPAGE="https://gitlab.com/AOMediaCodec/SVT-AV1"

if [[ ${PV} = 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/AOMediaCodec/SVT-AV1.git"
else
	SRC_URI="https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v${PV}/SVT-AV1-v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~hppa ~ia64 ~ppc ~ppc64 ~riscv ~sparc -x86" # -x86: https://github.com/AOMediaCodec/SVT-AV1/issues/1231
	S="${WORKDIR}/SVT-AV1-v${PV}"
fi

# Also see "Alliance for Open Media Patent License 1.0"
LICENSE="BSD-2 Apache-2.0 BSD ISC LGPL-2.1+ MIT"
SLOT="0"

BDEPEND="amd64? ( dev-lang/yasm )"

src_prepare() {
	if ! use amd64 ; then
		# This _should_ be possible on amd64 too, but breaks with -O3
		# without AVX.
		# bug #785556
		eapply "${FILESDIR}"/${PN}-0.8.6-no-force-avx.patch
	fi

	cmake_src_prepare
}

src_configure() {
	append-ldflags -Wl,-z,noexecstack

	local mycmakeargs=(
		# Tests require linking against https://github.com/Cidana-Developers/aom/tree/av1-normative ?
		# undefined reference to `ifd_inspect'
		# https://github.com/Cidana-Developers/aom/commit/cfc5c9e95bcb48a5a41ca7908b44df34ea1313c0
		-DBUILD_TESTING=OFF
	)

	cmake_src_configure
}
