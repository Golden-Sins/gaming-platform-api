import urllib.request
import json
import time

DD_API_KEY = "your-api-key-here"
DD_SITE = "datadoghq.eu"

now = int(time.time())

series = [
    {"metric": "newman.tests.passed",  "points": [[now, 13]], "type": "gauge", "tags": ["project:gaming-platform-api", "collection:authentication-flow"]},
    {"metric": "newman.tests.failed",  "points": [[now, 0]],  "type": "gauge", "tags": ["project:gaming-platform-api", "collection:authentication-flow"]},
    {"metric": "newman.tests.total",   "points": [[now, 13]], "type": "gauge", "tags": ["project:gaming-platform-api", "collection:authentication-flow"]},
    {"metric": "newman.duration_ms",   "points": [[now, 1053]], "type": "gauge", "tags": ["project:gaming-platform-api", "collection:authentication-flow"]},
]

payload = json.dumps({"series": series}).encode()

req = urllib.request.Request(
    f"https://api.{DD_SITE}/api/v1/series",
    data=payload,
    headers={
        "Content-Type": "application/json",
        "DD-API-KEY": DD_API_KEY
    }
)

response = urllib.request.urlopen(req)
print(f"Sent to Datadog — 13/13 passed, 1053ms")