import { serveWeb } from "https://code4fukui.github.io/wsutil/serveWeb.js";

serveWeb((param, req, path, conn) => {
  return "req param: " + JSON.stringify(param) + ", IP: " + conn.remoteAddr.hostname;
});
