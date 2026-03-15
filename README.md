# MedServer

> 日本語のREADMEはこちらです: [README.ja.md](README.ja.md)

A test project for the MedServer, a Deno-based medical data server.

## Features
- Deno-based web server
- FHIR data IP address filtering
- FHIR data JSON file conversion

## Requirements
Deno 1.28 or higher

## Usage
1. Clone the repository
2. Run `deno run -A server.js 8888`
3. Access `http://localhost:8888/Patient/taisukef.json`

## Data / API
- FHIR JSON data: Convert `src/Patient/*.fsh` files using `convert.js`

## License
This project is licensed under the MIT License.