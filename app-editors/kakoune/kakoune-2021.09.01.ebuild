# Copyright 2020-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_COMMIT="e0d2602e6a924c9a4067fa9ff23f034b906dd56d"

DESCRIPTION="Modal editor inspired by vim"
HOMEPAGE="http://kakoune.org/ https://github.com/mawww/kakoune"
SRC_URI="https://github.com/mawww/kakoune/archive/${MY_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~ppc64 ~x86"

DEPEND="sys-libs/ncurses:0=[unicode]"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

PATCHES=( "${FILESDIR}"/kakoune-2020.01.16-enable-ebuild-syntax-highlight.patch )

S="${WORKDIR}/kakoune-${MY_COMMIT}"

#src_configure() { :; }

src_compile() {
#	cd src/ || die
	emake all
}

src_test() {
#	cd src/ || die
	emake test
}

src_install() {
	emake PREFIX="${D}"/usr docdir="${D}/usr/share/doc/${PF}" install

	rm "${D}/usr/share/man/man1/kak.1.gz" || die
	doman doc/kak.1
}
