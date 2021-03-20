# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Stegsnow is a tool for hiding secrets in trailing whitespace"
HOMEPAGE="http://darkside.com.au/snow/"
SRC_URI="http://darkside.com.au/snow/snow-${PV}.tar.gz"

IUSE=" -upstream-name "

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="sys-apps/sed
	sys-apps/util-linux
"

S="${WORKDIR}/snow-${PV}"

PATCHES=(
	"${FILESDIR}/000-stegsnow-fix-implicit-declaration.patch"
	"${FILESDIR}/001-stegsnow-makefile-install.patch"
)

src_prepare() {
	eapply "${FILESDIR}/000-stegsnow-fix-implicit-declaration.patch"
	eapply "${FILESDIR}/001-stegsnow-makefile-install.patch"

	eapply_user

	if ! use upstream-name ; then
		#use sed to change the name from snow to stegsnow, and rename the source
		rename "snow" "stegsnow" "${S}"/*
		sed -i "s/snow/stegsnow/g" "${S}"/*
		sed -i "s/SNOW/STEGSNOW/g" "${S}"/*
	fi

}

src_install() {
	emake DESTDIR="${D}" install

	doman "${S}"/*snow.1
}