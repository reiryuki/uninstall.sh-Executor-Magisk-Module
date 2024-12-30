mount -o rw,remount /data
MODPATH=${0%/*}

# log
exec 2>$MODPATH/debug-pfsd.log
set -x

# uninstall.sh
REMS=`find /data/adb/modules -path '/data/adb/modules/*/remove'`
for REM in $REMS; do
  UNI=`echo $REM | sed 's|remove|uninstall.sh|g'`
  [ -f $UNI ] && sh $UNI
done


