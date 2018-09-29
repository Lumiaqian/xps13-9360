#!/bin/sh

#  install_ss_local.sh
#  ShadowsocksX-NG
#
#  Created by 邱宇舟 on 16/6/6.
#  Copyright © 2016年 qiuyuzhou. All rights reserved.

cd `dirname "${BASH_SOURCE[0]}"`
mkdir -p "$HOME/Library/Application Support/ShadowsocksX-R/ss-local-2.6.3.3"
cp -f ss-local "$HOME/Library/Application Support/ShadowsocksX-R/ss-local-2.6.3.3/"
rm -f "$HOME/Library/Application Support/ShadowsocksX-R/ss-local"
ln -s "$HOME/Library/Application Support/ShadowsocksX-R/ss-local-2.6.3.3/ss-local" "$HOME/Library/Application Support/ShadowsocksX-R/ss-local"

cp -f libcrypto.1.0.0.dylib "$HOME/Library/Application Support/ShadowsocksX-R/"

echo done
