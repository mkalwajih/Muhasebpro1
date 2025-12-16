#!/usr/bin/env python3
import http.server
import socketserver
import os

PORT = 5000
DIRECTORY = "build/web"

class CustomHandler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=DIRECTORY, **kwargs)
    
    def end_headers(self):
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Cross-Origin-Embedder-Policy', 'require-corp')
        self.send_header('Cross-Origin-Opener-Policy', 'same-origin')
        super().end_headers()
    
    def guess_type(self, path):
        if path.endswith('drift_worker.js'):
            return 'application/javascript'
        if path.endswith('.wasm'):
            return 'application/wasm'
        if path.endswith('.js'):
            return 'application/javascript'
        return super().guess_type(path)

class ReusableTCPServer(socketserver.TCPServer):
    allow_reuse_address = True

with ReusableTCPServer(("0.0.0.0", PORT), CustomHandler) as httpd:
    print(f"Serving Flutter Web at http://0.0.0.0:{PORT}")
    httpd.serve_forever()
