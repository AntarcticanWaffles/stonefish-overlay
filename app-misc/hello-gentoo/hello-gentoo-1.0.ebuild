# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Short and Sweet"
HOMEPAGE="https://github.com/AntarcticanWaffles"
SRC_URI="https://github.com/AntarcticanWaffles/curlme/raw/main/helloebuild.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	emake helloworld || die "make failed lmao"
}

src_install() {
	emake DESTDIR="${D}" install
}
