# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=SHLOMIF
DIST_VERSION=3.0800
DIST_EXAMPLES=( "examples/*" )
inherit perl-module

DESCRIPTION="Module of basic descriptive statistical functions"

SLOT="0"
KEYWORDS="~amd64 ~ppc x86"

RDEPEND="
	virtual/perl-Carp
	dev-perl/List-MoreUtils
	virtual/perl-Scalar-List-Utils
"
BDEPEND="${RDEPEND}
	>=dev-perl/Module-Build-0.280.0
	test? ( virtual/perl-Test-Simple )
"

mydoc="UserSurvey.txt"

src_test() {
	perl_rm_files "t/pod-coverage.t" "t/pod.t" "t/cpan-changes.t" "t/style-trailing-space.t"
	perl-module_src_test
}
