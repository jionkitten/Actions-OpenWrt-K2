include $(TOPDIR)/rules.mk

PKG_NAME:=xray-geodata
PKG_RELEASE:=$(AUTORELEASE)

PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=none

include $(INCLUDE_DIR)/package.mk

GEOSITE_VER:=202206182210
GEOSITE_FILE:=geosite.dat.$(GEOIP_VER)
define Download/geosite
	URL:=https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$(GEOSITE_VER)/
	URL_FILE:=geosite.dat
	FILE:=$(GEOSITE_FILE)
	HASH:=e88084108e452edb35ec47ace8773afb3e084660abe87d89f2bcadfb458d7c7c
endef

GEOIP_VER:=202206160121
GEOIP_FILE:=geoip.dat.$(GEOIP_VER)
define Download/geoip
	URL:=https://github.com/Loyalsoldier/geoip/releases/download/$(GEOIP_VER)/
	URL_FILE:=geoip-only-cn-private.dat
	FILE:=$(GEOIP_FILE)
	HASH:=c7fe622d4e010e3d7283eed327aa5d41295b0968262ba4fbfa09ead848f0f2be
endef

define Package/xray-geodata/template
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=IP Addresses and Names
	URL:=https://www.v2fly.org
	PKGARCH:=all
endef

define Package/xray-geoip
	$(call Package/xray-geodata/template)
	TITLE:=GeoIP List for XRay
	VERSION:=$(GEOIP_VER)-$(PKG_RELEASE)
	LICENSE:=CC-BY-SA-4.0
endef

define Package/xray-geosite
	$(call Package/xray-geodata/template)
	TITLE:=Geosite List for XRay
	VERSION:=$(GEOSITE_VER)-$(PKG_RELEASE)
	LICENSE:=MIT
endef

define Build/Prepare
	$(call Build/Prepare/Default)
ifneq ($(CONFIG_PACKAGE_xray-geoip),)
	$(call Download,geoip)
endif
ifneq ($(CONFIG_PACKAGE_xray-geosite),)
	$(call Download,geosite)
endif
endef

define Build/Compile
endef

define Package/xray-geoip/install
	$(INSTALL_DIR) $(1)/usr/share/xray
	$(INSTALL_DATA) $(DL_DIR)/$(GEOIP_FILE) $(1)/usr/share/xray/geoip.dat
endef

define Package/xray-geosite/install
	$(INSTALL_DIR) $(1)/usr/share/xray
	$(INSTALL_DATA) $(DL_DIR)/$(GEOSITE_FILE) $(1)/usr/share/xray/geosite.dat
endef

$(eval $(call BuildPackage,xray-geoip))
$(eval $(call BuildPackage,xray-geosite))
