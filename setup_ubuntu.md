- suspendが復帰しない
	- dellのpcの場合
https://www.eisbahn.jp/yoichiro/2019/10/xps13_ubuntu.html
	- thinkpadの場合
https://askubuntu.com/questions/1327658/how-do-i-fix-a-thinkpad-p14s-to-wake-from-sleep

- 指紋認証
https://sicklylife.jp/ubuntu/1804/help/session-fingerprint.html

- ブラウザの進む戻るジェスチャ
libinputで対応。2本指のジェスチャは存在していないようなので4本指で代用
https://jun-networks.hatenablog.com/entry/2018/05/06/071813

- waylandからxorgに切り替えたことで3本指ジェスチャが機能しなくなる
同じくlibinputで対応

- launchpadのubuntu版
https://ulauncher.io/
terminalやosのwindowがの場合、hotkeyが効かないので下の方法で解決
https://github.com/Ulauncher/Ulauncher/wiki/Hotkey-In-Wayland
https://github.com/albertlauncher/albert/issues/1006#issuecomment-803675887
原因はwaylandだったが、ログイン画面でxorg(x11)に切り替えることによりhotkeyが効く
ようになった為キーボードショートカットは削除

- キーボードのデフォルトショートカットはsettingsから変更可能

- AutoKeyによるキーマップの変更
Set Hotkey>Press to Setでキーを押しても反応せず設定ができない
→ 原因はwayland。xorgに切り替えることで解決
https://github.com/autokey/autokey/issues/700

- capslock・ctrl・alt・win・underbarのマッピング
最終的に全ての設定を~/.xkb/keymap/myxkbにまとめ、.bashrcでシェル起動により反映できるように対応
	- capslockをctrlに変更
xhbに設定をまとめたほうが管理しやすいため考え以下のsetxkbmapコマンドを実行
http://www.noah.org/wiki/CapsLock_Remap_Howto
→ なぜか半角全角キーが他のキーマッピングされ使えなくなる(あとでこれは右上の設定を直接いじれば直ることが判明)
→ gnome-tweak-toolで対応。これでもsetxkbmap -printを実行してxkbの設定を確認したらsetxkbmapコマンドと同様の効果が得られているので問題なさそう。
→ 上記の半角全角問題は解決した(右上の設定をいじるだけ)ので、コマンド「setxkbmap -option ctrl:nocaps」で対応
→ Startup Applicationsに上記コマンドを登録し再起動時に自動設定
	- winをctrlに変更(下の変更で包括されたので、非対応)
gnome-tweak-toolに専用の設定あり(capslock設定と同じ箇所)
	- ctrlをwin・winをalt・altをctrlに変更
コマンド「setxkbmap -option ctrl:swap_lalt_lctl_lwin」を実行
→ Startup Applicationsに上記コマンドを登録し再起動時に自動設定
	- tips
「ctrl:swap_lalt_lctl_lwin」に当たる箇所はruleと呼ばれ、/usr/share/X11/xkb/rules/base.lstに一覧がある
https://lambdalisue.hatenablog.com/entry/2013/09/27/212118(「xkbを使用して変更する方法」)
以下のxkbファイルを用意する方法はaltの変更がうまく行かないのとブラウザの進む戻るジェスチャが無効になる為断念
https://honmushi.com/2019/01/18/ubuntu-xkb/
https://blog.canele.dev/2014/05/12/use-xkb/
https://shino-tec.com/2019/02/01/xkb-intro/

- emacsキーマップ
gnome-tweak-toolに専用の設定あり(Keyboard & Mouse>Emacs Input)

- winキーをctrlキーに置き換え
gnome-tweak-toolに専用の設定あり(capslock設定と同じ箇所)

- 日本語設定
下記URLのコマンド実行後、再ログイン
https://novicengineering.com/ubuntu_mozc_install

- 英数切り替えキーマップ
https://magidropack.hatenablog.com/entry/2018/11/30/120602
mozc設定が見つからない&開けない場合は以下参照
https://inno-tech-life.com/dev/linux/mozc_gui/

- application切り替えコマンドをalt+tab→ ctrl+tabに変更
ubuntuデフォルトのsettings>Keyboard>View and Customize Shortcuts>Switch applicationsから変更
→ chromeなどでタブ移動が使えなくなるのでalt+tabにした

- terminalのショートカット
	- タブ移動
標準の設定ではtabキーが反応せず変更できなかったので以下のサイト参考に変更
https://askubuntu.com/questions/1214694/how-do-i-switch-tabs-in-my-terminal-like-i-do-in-chrome
	- タブ作成・タブ削除・コピペのショートカット
標準の設定(タブのハンバーガーメニューからPreferencesに進む)から設定

- gnome tweakのインストールURL
https://www.linuxcapable.com/ja/install-gnome-tweaks-on-ubuntu-20-04-lts/

- ランチャー設定
https://ulauncher.io/
ショートカット変更(alt+spaceへ)
https://github.com/Ulauncher/Ulauncher/issues/265
OS起動時の同時起動はPreferencesから設定可能

- F4が常に点灯している
以下のTechnical27の回答(/etc/systemd/system/fix-led.serviceを作ってコマンド実行)
https://www.reddit.com/r/linuxquestions/comments/l6ptx8/lenovo_t14_f4_led_always_on/

- terminalのビープ音をOFF
https://it-blue-collar-dairy.com/mute_beep_on_ubuntu/

- ワークスペースの水平追加(20.04は垂直しかない)
下のWorkspace Matrixを採用
https://askubuntu.com/questions/33972/can-i-set-a-horizontal-layout-for-workspaces

- バックスラッシュ
https://qiita.com/laineus/items/3f77b5e09cf8c7cde17b

- tar.gz拡張子のパッケージをインストール
インストールするまで
https://magidropack.hatenablog.com/entry/2018/11/07/122728
ランチャーに登録
https://magidropack.hatenablog.com/entry/2018/11/09/124723

- ダブルタップで自動でドラッグになってしまう
以下のdconf-editorの方法で対応
https://yildiz.dev/posts/gnome-disable-tap-and-drag/

- タブを画面最上部までドラッグすると自動で全画面表示になってしまう
https://forums.ubuntulinux.jp/viewtopic.php?id=20152