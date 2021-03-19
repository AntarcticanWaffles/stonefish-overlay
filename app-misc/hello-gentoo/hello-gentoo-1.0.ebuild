# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Short and Sweet"
HOMEPAGE="https://github.com/AntarcticanWaffles"
SRC_URI="https://raw.githubusercontent.com/AntarcticanWaffles/curlme/main/helloworld.c
	https://raw.githubusercontent.com/AntarcticanWaffles/curlme/main/Makefile"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}-${P}"

src_compile() {
	emake helloworld || die "make failed lmao"
}

src_install() {
	emake DESTDIR="${D}" install
}
