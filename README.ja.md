# MedServer テスト

Deno製の簡単なWebサーバーサンプルです。

## デモ
`http://localhost:8888/Patient/taisukef.json` にアクセスしてみてください。

## 機能
- Deno上で動作するWebサーバー
- FHIRデータのIPアドレスフィルタリング
- FHIRデータのJSONファイル変換

## 必要環境
Deno 1.28以上

## 使い方
1. リポジトリをクローンする
2. `deno run -A server.js 8888` を実行
3. `http://localhost:8888/Patient/taisukef.json` にアクセス

## データ・API
- FHIR JSONデータ: `src/Patient/*.fsh`を`convert.js`で変換

## ライセンス
MIT License