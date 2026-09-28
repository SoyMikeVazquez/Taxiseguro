with open('lib/services/admin_service.dart', 'r') as f:
    lines = f.readlines()

for i, line in enumerate(reversed(lines)):
    if line.strip() == "}":
        last_brace_index = len(lines) - 1 - i
        break

for i in range(last_brace_index - 1, -1, -1):
    if "class AdminService" in lines[i]:
        # This is the class, now find where it ends.
        pass

# The easiest way is to just find the very last '}' which is for the file (which shouldn't be there) and the one before it.
# Actually, since all those methods were appended AFTER the last '}', we just need to remove the first '}' that appears before them, and make sure there is a '}' at the end.

content = "".join(lines)
idx = content.find("Future<void> syncTripsToFacturacion() async {")
if idx != -1:
    before = content[:idx]
    after = content[idx:]
    # remove the last '}' in 'before'
    last_brace = before.rfind("}")
    if last_brace != -1:
        before = before[:last_brace] + before[last_brace+1:]
    
    with open('lib/services/admin_service.dart', 'w') as f:
        f.write(before + after)
