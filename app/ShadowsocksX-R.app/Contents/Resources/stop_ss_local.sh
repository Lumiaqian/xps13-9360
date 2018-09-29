#!/bin/sh

#  stop_ss_local.sh
#  ShadowsocksX-NG
#
#  Created by 邱宇舟 on 16/6/6.
#  Copyright © 2016年 qiuyuzhou. All rights reserved.



launchctl unload "$HOME/Library/LaunchAgents/com.yicheng.ShadowsocksX-R.local.plist"

for  i in `ls $HOME/Library/LaunchAgents/ |grep wsocks`;
do
    launchctl unload $HOME/Library/LaunchAgents/$i &
done
