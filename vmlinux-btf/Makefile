#
# Copyright (C) 2015-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=vmlinux-btf
PKG_VERSION:=$(LINUX_VERSION)

PKG_BUILD_PARALLEL:=1

PKG_SOURCE:=$(LINUX_SOURCE)
PKG_SOURCE_URL:=$(LINUX_SITE)
PKG_HASH:=$(LINUX_KERNEL_HASH)
PKG_BUILD_DIR:=$(KERNEL_BUILD_DIR)/vmlinux-btf/linux-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/vmlinux-btf
  SECTION:=kernel
  CATEGORY:=Kernel
  TITLE:=Kernel vmlinux.btf for CO-RE compatibility
endef

define Package/vmlinux-btf/description
  BPF CO-RE stand for Compile Once - Run Everywhere It's a concept to
  build cross-version kernel eBPF application by building in a single
  binary by bringing together the BTF type information, libbpf and the
  compiler.
endef

define Package/vmlinux-btf/postinst
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
	ln -sf /usr/lib/debug/boot/vmlinux /usr/lib/debug/boot/vmlinux-$$(uname -r)
fi
endef

define Package/vmlinux-btf/prerm
#!/bin/sh
[ -d "/usr/lib/debug" ] && rm -rf /usr/lib/debug
endef

define Build/Compile
	$(CP) $(LINUX_DIR)/.config $(PKG_BUILD_DIR)

	$(PKG_BUILD_DIR)/scripts/config --file $(PKG_BUILD_DIR)/.config \
		--disable DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
		--disable DEBUG_INFO_NONE \
		--disable DEBUG_INFO_REDUCED \
		--disable DEBUG_INFO_SPLIT \
		--disable WERROR \
		--enable BPF \
		--enable BPF_EVENTS \
		--enable BPF_JIT \
		--enable BPF_JIT_ALWAYS_ON \
		--enable BPF_PRELOAD \
		--enable BPF_STREAM_PARSER \
		--enable BPF_SYSCALL \
		--enable CONFIG_CGROUP_BPF \
		--enable CONFIG_CGROUP_NET_CLASSID \
		--enable CONFIG_CGROUP_NET_PRIO \
		--enable CONFIG_NET_NS \
		--enable DEBUG_INFO_BTF \
		--enable DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
		--enable FTRACE \
		--enable KPROBE_EVENTS \
		--enable KPROBES \
		--enable KRETPROBES \
		--enable MODULE_ALLOW_BTF_MISMATCH \
		--enable NET_ACT_BPF \
		--enable NET_ACT_GACT \
		--enable NET_ACT_MIRRED \
		--enable NET_ACT_POLICE \
		--enable NET_CLS \
		--enable NET_CLS_BPF \
		--enable NET_CLS_FLOWER \
		--enable NET_CLS_U32 \
		--enable NET_SCH_CAKE \
		--enable NET_SCH_FIFO \
		--enable NET_SCH_FQ \
		--enable NET_SCH_FQ_CODEL \
		--enable NET_SCH_HTB \
		--enable NET_SCH_TBF \
		--enable NET_SCHED \
		--enable PAHOLE_HAS_LANG_EXCLUDE \
		--enable PAHOLE_HAS_SPLIT_BTF \
		--enable PERF_EVENTS \
		--enable UPROBE_EVENTS \
		--enable UPROBES \
		--enable XDP_SOCKETS \
		--enable XDP_SOCKETS_DIAG \
		--set-str EXTRA_FIRMWARE "" \
		--set-str INITRAMFS_SOURCE ""

	+$(MAKE) -C $(PKG_BUILD_DIR) $(PKG_JOBS) $(KERNEL_MAKE_FLAGS) olddefconfig
	+$(MAKE) -C $(PKG_BUILD_DIR) \
	  $(PKG_JOBS) \
	  $(KERNEL_MAKE_FLAGS) \
	  KBUILD_HOSTLDFLAGS="-L$(STAGING_DIR_HOST)/lib -lz" \
	  vmlinux
	pahole --btf_encode_detached $(PKG_BUILD_DIR)/vmlinux.btf $(PKG_BUILD_DIR)/vmlinux
endef

define Package/vmlinux-btf/install
	$(INSTALL_DIR) $(1)/usr/lib/debug/boot
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/vmlinux.btf $(1)/usr/lib/debug/boot/vmlinux
	$(LN) vmlinux $(1)/usr/lib/debug/boot/vmlinux-$(LINUX_VERSION)
endef

$(eval $(call BuildPackage,vmlinux-btf))
