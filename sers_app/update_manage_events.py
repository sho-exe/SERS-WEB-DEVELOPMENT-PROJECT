import re

with open('web/ManageEvents.jsp', 'r') as f:
    content = f.read()

# Extract page directives
directives_match = re.search(r'(<%@page.*?%>\s*)*', content)
directives = directives_match.group(0) if directives_match else ''

# Clean up any trailing/leading whitespaces from directives
directives = directives.strip() + "\n"

# Extract inner content
start_marker = '<div class="container-fluid p-4">'
end_marker = '</div>\n                        </div>\n                    </div>'

start_idx = content.find(start_marker)
if start_idx != -1:
    start_idx += len(start_marker)
end_idx = content.find(end_marker, start_idx)

inner_content = content[start_idx:end_idx].strip()

# Wrap inner content in Sneat styling
new_content = directives + """<%@ include file="header_sneat.jsp" %>

<h4 class="fw-bold py-3 mb-4">
    <span class="text-muted fw-light">Chairperson /</span> Event Proposal Matrix
</h4>

""" + inner_content + """

<%@ include file="footer_sneat.jsp" %>
"""

# Make it look like Sneat
# Replace btn-outline-primary shadow-sm with standard sneat button
new_content = new_content.replace('btn-outline-primary shadow-sm', 'btn-outline-primary')
new_content = new_content.replace('shadow-sm', '')
new_content = new_content.replace('rounded-3', '')

with open('web/ManageEvents.jsp', 'w') as f:
    f.write(new_content)

print("ManageEvents.jsp updated successfully.")
