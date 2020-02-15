FROM        archlinux:latest

RUN			["pacman", "--sync", "--refresh", "--sysupgrade", "--noconfirm", \
				"clang", \
				"gcc", \
				"gcc-objc", \
				"gdb", \
				"binutils", \
				"cgdb", \
				"cmake", \
				"git", \
				"git-lfs", \
				"inetutils", \
				"less", \
				"libusb", \
				"libusb-compat", \
				"linux-headers", \
				"make", \
				"man-db", \
				"man-pages", \
				"neovim", \
				"nodejs", \
				"npm", \
				"openssh", \
				"pkgconf", \
				"protobuf", \
				"protobuf-c", \
				"rsync", \
				"zsh" \
			]

RUN			["useradd", "--no-create-home", "--shell", "/bin/zsh", "--home-dir", "/home/devuser", "devuser"]
RUN			["bash", "-c", "echo -n 'devuser:*' | chpasswd -e"]

COPY		["docker-entry.sh", "/root/docker-entry.sh"]
RUN			["chmod", "755", "/root/docker-entry.sh"]
ENTRYPOINT	["/root/docker-entry.sh"]

VOLUME		["/home/devuser"]
