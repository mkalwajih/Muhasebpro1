#!/usr/bin/env python3
import http.server
import socketserver
import os

PORT = 5000
# Try build/web first, fallback to web/
DIRECTORY = os.path.abspath("build/web") if os.path.isdir("build/web") else os.path.abspath("web")

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
    print(f"Serving Flutter Web from {DIRECTORY}")
    httpd.serve_forever()
