#!/usr/bin/env bash

# download base code
CODE_DIR=_firmware_code
CODE_URL=https://git.openwrt.org/openwrt/openwrt.git
CODE_BRANCH=openwrt-23.05
SWITCH_LATEST_TAG=false
git clone --single-branch -b $CODE_BRANCH $CODE_URL $CODE_DIR
if $SWITCH_LATEST_TAG; then
    cd $CODE_DIR
    LATEST_TAG_HASH=$(git rev-list --tags --max-count=1)
    if [ -z "$LATEST_TAG_HASH" ]; then
        echo "No tag to switch, keep the latest commit"
    else
        git checkout $LATEST_TAG_HASH
        LATEST_TAG=$(git describe --tags $LATEST_TAG_HASH)
        echo "The code has been switched to the latest stable version $LATEST_TAG"
    fi
    cd ..
fi
mv ./$CODE_DIR/* ./

# download app codes
SUPPLY_DIR=_supply_packages
echo "src-link supply $PWD/$SUPPLY_DIR" >> feeds.conf.default
mkdir $SUPPLY_DIR && cd $SUPPLY_DIR
git clone --depth 1 https://github.com/yichya/openwrt-xray.git
git clone --depth 1 https://github.com/XTLS/Xray-core.git
git clone --depth 1 https://github.com/MilesPoupart/luci-app-vssr.git
git clone --depth 1 https://github.com/haiibo/openwrt-packages.git && mv openwrt-packages/luci-app-poweroff./&& rm -rf openwrt-packages
git clone --depth 1 https://github.com/haiibo/openwrt-packages.git && mv openwrt-packages/luci-app-passwall./&& rm -rf openwrt-packages
git clone --depth 1 https://github.com/haiibo/openwrt-packages.git && mv openwrt-packages/luci-app-passwall2./&& rm -rf openwrt-packages
git clone --depth 1 https://github.com/haiibo/openwrt-packages.git && mv openwrt-packages/luci-app-netdata./&& rm -rf openwrt-packages
git clone --depth 1 https://github.com/kongfl888/luci-app-timedreboot.git
git clone --depth 1 https://github.com/chenmozhijin/turboacc.git
git clone --depth 1 https://github.com/kenzok8/small-package.git && mv small-package/luci-app-adguardhome./&& rm -rf small-package
git clone --depth 1 https://github.com/kenzok8/small-package.git && mv small-package/luci-app-ddns./&& rm -rf small-package
git clone --depth 1 https://github.com/kenzok8/small-package.git && mv small-package/luci-app-firewall./&& rm -rf small-package
git clone --depth 1 https://github.com/kenzok8/small-package.git && mv small-package/luci-app-nlbwmon./&& rm -rf small-package
git clone --depth 1 https://github.com/kenzok8/small-package.git && mv small-package/luci-app-opkg./&& rm -rf small-package
git clone --depth 1 https://github.com/kenzok8/small-package.git && mv small-package/luci-app-ramfree./&& rm -rf small-package
git clone --depth 1 https://github.com/kenzok8/small-package.git && mv small-package/luci-app-smartdns./&& rm -rf small-package
git clone --depth 1 https://github.com/kenzok8/small-package.git && mv small-package/luci-app-upnp./&& rm -rf small-package
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config.git
git clone --depth 1 https://github.com/vernesong/OpenClash.git
