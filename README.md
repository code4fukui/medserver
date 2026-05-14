# MedServer

> 日本語のREADMEはこちらです: [README.ja.md](README.ja.md)

MedServer is a simple Deno-based web server designed to serve medical data in the FHIR JSON format. It features a straightforward data conversion pipeline and per-directory IP-based access control.

## Features

-   **Static File Serving:** Serves FHIR JSON data and other static assets from the `static` directory.
-   **IP Address Filtering:** Restricts access to specific directories based on IP addresses defined in `.conf` files.
-   **FHIR Shorthand Conversion:** Includes a script to convert human-readable FHIR Shorthand (`.fsh`) files into standard FHIR JSON.

## How It Works

1.  **Source Data:** Patient data is defined in FHIR Shorthand (`.fsh`) format within the `src/Patient/` directory.
2.  **Conversion:** The `convert.js` script reads these `.fsh` files, converts them to FHIR JSON, and saves them in the `static/Patient/` directory.
3.  **Serving:** The `server.js` script starts a web server that serves the generated JSON files from the `static` directory.
4.  **Access Control:** Before serving a file from a directory, the server checks for a `.conf` file (e.g., `static/Patient/.conf`). This file contains rules that allow or deny access based on the client's IP address.

## Requirements

-   Deno 1.28 or higher

## Getting Started

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/code4fukui/medserver.git
    cd medserver
    ```

2.  **Generate FHIR JSON Data:**
    Run the conversion script to generate the JSON files that the server will use.
    ```sh
    deno run -A convert.js
    ```

3.  **Start the Server:**
    Run the server on port 8888.
    ```sh
    deno run -A server.js 8888
    ```

4.  **Access the Data:**
    You can now request the patient data. The default configuration in `static/Patient/.conf` only allows requests from localhost.
    ```sh
    curl http://localhost:8888/Patient/taisukef.json
    ```

## Configuration

IP filtering is configured using `.conf` files placed inside the directories you want to protect.

For example, `static/Patient/.conf` contains:
```
allow '::1';
deny all;
```
This configuration allows requests only from the IPv6 localhost address (`::1`) and denies all others for the `/Patient/` path.

## License

MIT License — see [LICENSE](LICENSE).