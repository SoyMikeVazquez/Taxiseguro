import json
import re

log_path = '/Users/black/.gemini/antigravity-ide/brain/1b01483a-a493-4636-840b-66c6e5604756/.system_generated/logs/transcript_full.jsonl'

lines = []
with open(log_path, 'r') as f:
    for line in f:
        lines.append(line)

found = []
for line in reversed(lines):
    try:
        data = json.loads(line)
        if data.get('type') == 'VIEW_FILE' or data.get('type') == 'TOOL_RESPONSE':
            content = data.get('content', '')
            if 'class AdminService' in content and 'admin_service.dart' in content:
                found.append(content)
    except:
        pass

if found:
    print("Found! Length:", len(found[0]))
    with open('admin_service_recovered.dart', 'w') as out:
        out.write(found[0])
else:
    print("Not found")
