import os

with open('web/Homepage_sneat.jsp', 'r') as f:
    content = f.read()

# Find the split points
header_split = content.find('<div class=" flex-grow-1 container-p-y">') + len('<div class=" flex-grow-1 container-p-y">\n')
footer_split = content.find('                                    </div>\n                                    <!-- / Content -->')

header_content = content[:header_split]
footer_content = content[footer_split:]

first_newline = header_content.find('\n')
if first_newline != -1 and '<%@page ' in header_content[:first_newline]:
    header_content = header_content[first_newline+1:]

with open('web/ManageUsers.jsp', 'r') as f:
    u_content = f.read()

# We need to prepend header_content and append footer_content, but we have to handle the page directives at the top.
# u_content starts with <%@page ... %> directives.
directives = ""
while u_content.startswith("<%@page") or u_content.startswith("    <%@page"):
    idx = u_content.find("%>")
    if idx != -1:
        directives += u_content[:idx+2] + "\n"
        u_content = u_content[idx+2:].lstrip()
    else:
        break

new_u_content = directives + header_content + "\n" + u_content + "\n" + footer_content

with open('web/ManageUsers.jsp', 'w') as f:
    f.write(new_u_content)

print("ManageUsers.jsp fixed.")
