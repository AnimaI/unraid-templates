{
  "/api": {
    "target": "http://public-pool:3334",
    "secure": false,
    "changeOrigin": true,
    "logLevel": "debug",
    "pathRewrite": {
      "^/api": "/api"
    }
  }
}
