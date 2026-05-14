# MedServer

MedServerは、FHIR JSON形式の医療データを提供するために設計された、シンプルなDenoベースのWebサーバーです。簡潔なデータ変換パイプラインと、ディレクトリ単位でのIPベースのアクセス制御機能を備えています。

## 機能

- **静的ファイルの配信:** `static`ディレクトリからFHIR JSONデータやその他の静的アセットを配信します。
- **IPアドレスフィルタリング:** `.conf`ファイルで定義されたIPアドレスに基づき、特定のディレクトリへのアクセスを制限します。
- **FHIR Shorthand変換:** 人間が読みやすいFHIR Shorthand（`.fsh`）ファイルを標準的なFHIR JSONに変換するスクリプトが含まれています。

## 動作の仕組み

1. **ソースデータ:** 患者データは、`src/Patient/`ディレクトリ内にFHIR Shorthand（`.fsh`）形式で定義されます。
2. **変換:** `convert.js`スクリプトがこれらの`.fsh`ファイルを読み込み、FHIR JSONに変換して`static/Patient/`ディレクトリに保存します。
3. **配信:** `server.js`スクリプトがWebサーバーを起動し、生成されたJSONファイルを`static`ディレクトリから配信します。
4. **アクセス制御:** ディレクトリからファイルを配信する前に、サーバーは`.conf`ファイル（例: `static/Patient/.conf`）を確認します。このファイルには、クライアントのIPアドレスに基づいてアクセスを許可または拒否するルールが記述されています。

## 要件

- Deno 1.28以上

## はじめに

1. **リポジトリのクローン:**
    ```sh
    git clone https://github.com/code4fukui/medserver.git
    cd medserver
    ```

2. **FHIR JSONデータの生成:**
    変換スクリプトを実行し、サーバーが使用するJSONファイルを生成します。
    ```sh
    deno run -A convert.js
    ```

3. **サーバーの起動:**
    ポート8888でサーバーを起動します。
    ```sh
    deno run -A server.js 8888
    ```

4. **データへのアクセス:**
    これで患者データをリクエストできるようになります。`static/Patient/.conf`のデフォルト設定では、ローカルホストからのリクエストのみを許可しています。
    ```sh
    curl http://localhost:8888/Patient/taisukef.json
    ```

## 設定

IPフィルタリングは、保護したいディレクトリ内に配置された`.conf`ファイルを使用して設定します。

例えば、`static/Patient/.conf`には以下のように記述されています。
```
allow '::1';
deny all;
```
この設定により、`/Patient/`パスに対してIPv6のローカルホストアドレス（`::1`）からのリクエストのみが許可され、それ以外はすべて拒否されます。

## ライセンス

MIT License — 詳細は[LICENSE](LICENSE)を参照してください。
