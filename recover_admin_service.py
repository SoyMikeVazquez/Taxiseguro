import json

log_path = '/Users/black/.gemini/antigravity-ide/brain/1b01483a-a493-4636-840b-66c6e5604756/.system_generated/logs/transcript_full.jsonl'

best_content = None
max_lines = 0

with open(log_path, 'r') as f:
    for line in f:
        try:
            data = json.loads(line)
            if data.get('type') == 'REPLACE_FILE_CONTENT' or data.get('type') == 'MULTI_REPLACE_FILE_CONTENT':
                # No, wait, replace_file_content doesn't have the full file, just diffs.
                pass
            if data.get('type') == 'VIEW_FILE' and 'admin_service.dart' in line:
                pass
        except:
            pass

print('done')
