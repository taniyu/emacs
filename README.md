emacsの設定
=====
## clone後に実行すること
1. submoduleのディレクトリに移動
2. submodule init を実行
3. submodule update を実行
4. 読み込み速度向上のためにバイトコンパイル
### byte-compileの方法
#### ディレクトリ内のelispを全てバイトコンパイルする場合
##### elcファイルがある場合
M-x byte-recompile-directory
##### elcファイルが1つもない場合
C-u 0 M-x byte-recompile-directory
