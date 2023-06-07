# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit git-r3 toolchain-funcs

DESCRIPTION="Scaleable text-mode intro demo for the Linux terminal."
HOMEPAGE="https://github.com/schnitz81/textmode-lifestyle/"
EGIT_REPO_URI="https://github.com/schnitz81/textmode-lifestyle.git"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos"
IUSE=""

RDEPEND="
	sys-libs/ncurses
	media-libs/libmikmod
"

DEPEND="${RDEPEND}"


src_compile() {
	local x
	for x in main banner bouncer dotbar loop scroller tune
	do
		$(tc-getCC) \
			-D PACKAGE \
			-v -c -o ${x}.o ${x}.c || die "compile failed"
	done
	$(tc-getCC) \
		${LDFLAGS} \
		-v -o textmode-lifestyle \
		main.o banner.o bouncer.o dotbar.o loop.o scroller.o tune.o \
		-lncurses -lpthread -lmikmod -ltinfo || die "Link of object files failed"
}


src_install() {
	dobin textmode-lifestyle
	insinto /usr/share/textmode-lifestyle
	doins tune.dat
	doman ${PN}.1
	dodoc README* LICENSE
}
