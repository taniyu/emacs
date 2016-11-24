emacsの設定
=====

## 必要なツール
[the_silver_searcher](https://github.com/ggreer/the_silver_searcher)  
[cask](https://github.com/cask/cask)

## その他
### byte-compileの方法
##### ディレクトリ内のelispを全てバイトコンパイルする場合

>elcファイルがある場合

    M-x byte-recompile-directory

>elcファイルが1つもない場合

    C-u 0 M-x byte-recompile-directory
