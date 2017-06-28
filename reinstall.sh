#!/usr/bin/env bash

# yarn global add ios-deploy
# pip install six

APPNAME=blankapp.app
BUNDLE_ID="info.ckazu.blankapp"

uninstall_app() {
    while :
    do
        ios-deploy --list_bundle_id | grep $BUNDLE_ID
        if [ $? = 0 ]; then
            ios-deploy --uninstall_only --bundle_id $BUNDLE_ID
            break
        fi
    done
}

install_and_launch_app() {
    while :
    do
        ios-deploy --list_bundle_id | grep $BUNDLE_ID
        if [ $? = 1 ]; then
            ios-deploy --justlaunch -b $APPNAME
            sleep 1s
            break
        fi
    done
}

# 初回のみチェック
ios-deploy --uninstall_only --bundle_id $BUNDLE_ID

for i in `seq 1 1000`
do
    echo $i
    install_and_launch_app
    uninstall_app
done
