"""
hassio_wsgi.py — WSGI wrapper for HA ingress support.

HA's ingress proxy forwards requests to the addon with the original base path
stripped, but passes the base path via the X-Ingress-Path header. Flask needs
to know this as SCRIPT_NAME so that url_for() generates correct URLs for static
files and redirects when accessed through the ingress proxy.
"""

from main import app as flask_app


class HAIngressMiddleware:
    """Set SCRIPT_NAME from the X-Ingress-Path header sent by HA's ingress proxy."""

    def __init__(self, app):
        self.app = app

    def __call__(self, environ, start_response):
        ingress_path = environ.get("HTTP_X_INGRESS_PATH", "").rstrip("/")
        if ingress_path:
            environ["SCRIPT_NAME"] = ingress_path
        return self.app(environ, start_response)


app = HAIngressMiddleware(flask_app)
