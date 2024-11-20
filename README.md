# schnitz Gentoo ebuild repo

## Requirements
- git
- standard Portage tools

## How-to
- Unmask and accept unstable keywords:
```
mkdir -p /etc/portage/package.unmask
cat <<EOF >/etc/portage/package.unmask/schnitz 
app-misc/beings
app-misc/textmode-lifestyle
games-misc/ttybattle
EOF

mkdir -p /etc/portage/package.accept_keywords
cat <<EOF >/etc/portage/package.accept_keywords/schnitz
=app-misc/beings-9999 **
=app-misc/textmode-lifestyle-9999 **
=games-misc/ttybattle-9999 **
EOF
```
- Add repo with eselect: ```eselect repository add schnitz git https://github.com/schnitz81/gentoo-repo```
- Sync the repo: ```emaint sync -r schnitz```
