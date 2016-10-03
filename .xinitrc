## Wallpaper
feh --bg-fill ~/images/1366099668983.jpg
sh ~/.fehbg &

## Uim
export LANG=en_US.UTF-8 #US locale for everything unless overridden by others
#export LANG=ja_JP.UTF-8 #Japanese locale for everything unless overridden by others
#export LC_ALL=ja_JP.UTF-8 #All localization settings in Japanese
#
#export LC_CTYPE=ja_JP.eucJP #Something about character handling. Necassary for Japanese characters but causes some problems (backslash is yen, some webpages don't work in xombrero)

export XMODIFIERS=@im=uim
export GTK_IM_MODULE="uim"
uim-xim &

xset +fp /usr/local/lib/X11/fonts/*
xset fp rehash

setxkbmap dvorak

redshift&

## Cwm
until cwm; do
  true
done
exec cwm

