# 国土数値情報の洪水浸水想定区域(一次メッシュ)データからSVGMapビットイメージレイヤを生成する

- https://nlftp.mlit.go.jp/ksj/gml/datalist/KsjTmplt-A31b-2023.html
からGeoJSONデータをダウンロード
- 解凍
- 拡張子を`.geojson`から`.json`に
- [SVGMapTools](https://github.com/svgmap/svgMapTools)を使って各メッシュエリアのコンテンツを生成(ビットイメージのみ)
  - `Shape2ImageSVGMap 5-15 -sumUp 16 -colorKey 1#f7f5a9,2#ffd8c0,3#ffb7b7,4#ff9191,5#f285c9,6#dc7adc [srcJsonPath] 1 #000000 0 0`
  - ヒープを大きくとる必要があった(`-Xmx3000m`ぐらい)
  - 色分けは、https://disaportal.gsi.go.jp/hazardmapportal/legend.pdf を参考に
  - 一括変換は`ps.bat`も参考に
- [SVGMapTools](https://github.com/svgmap/svgMapTools)を使って各メッシュエリアのコンテンツを結合したコンテンツ(コンテナSVG)を生成
  - `HyperBuilder [各メッシュのcontainer.svgスペース区切り羅列] -o [各メッシュのコンテンツが入っているディレクトリの上の階層/container.svg]`
  - 各メッシュのcontainer.svgをリストアップするには`ls.bat`も参考に
- 上記メッシュを結合するコンテナsvgのsvg要素の`data-controller`に凡例やUIを表示するwebAppのリンクを設定
