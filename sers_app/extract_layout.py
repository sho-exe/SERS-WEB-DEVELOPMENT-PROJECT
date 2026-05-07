import re

with open('web/Homepage_sneat.jsp', 'r') as f:
    content = f.read()

# Find the split points
header_split = content.find('<div class=" flex-grow-1 container-p-y">') + len('<div class=" flex-grow-1 container-p-y">\n')
footer_split = content.find('                                    </div>\n                                    <!-- / Content -->')

if content.find('<div class=" flex-grow-1 container-p-y">') == -1 or footer_split == -1:
    print("Could not find split points!")
    exit(1)

header_content = content[:header_split]
footer_content = content[footer_split:]

with open('web/header_sneat.jsp', 'w') as f:
    f.write(header_content)

with open('web/footer_sneat.jsp', 'w') as f:
    f.write(footer_content)

print(f"Extracted header ({len(header_content)} bytes) and footer ({len(footer_content)} bytes) successfully.")
