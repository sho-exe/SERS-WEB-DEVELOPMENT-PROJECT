import re

with open('web/ManageUsers.jsp', 'r') as f:
    content = f.read()

# Extract page directives
directives_match = re.search(r'(<%@page.*?%>\n)*', content)
directives = directives_match.group(0) if directives_match else ''

# Extract inner content
start_marker = '<div class="container-fluid p-4">'
end_marker = '</div>\n    </div>\n</div>'

start_idx = content.find(start_marker)
if start_idx != -1:
    start_idx += len(start_marker)
end_idx = content.find(end_marker, start_idx)

inner_content = content[start_idx:end_idx].strip()

# Wrap inner content in Sneat styling
new_content = directives + """<%@ include file="header_sneat.jsp" %>

<h4 class="fw-bold py-3 mb-4">
    <span class="text-muted fw-light">Admin /</span> User Directory Matrix
</h4>

""" + inner_content + """

<%@ include file="footer_sneat.jsp" %>
"""

# Now let's fix the table in inner content to match Sneat card style
# Sneat tables are usually inside a <div class="card"> with a <h5 class="card-header">...</h5> and <div class="table-responsive text-nowrap">
new_content = new_content.replace('<div class="table-responsive table-custom mt-4">', '<div class="card mt-4">\n    <div class="table-responsive text-nowrap">')
new_content = new_content.replace('</table>\n            </div>', '</table>\n    </div>\n</div>')

# Sneat table classes
new_content = new_content.replace('<table class="table table-hover align-middle mb-0">', '<table class="table table-hover">')
new_content = new_content.replace('thead-dark', '')
new_content = new_content.replace('<th scope="col" class="py-3 px-4">', '<th>')
new_content = new_content.replace('<th scope="col" class="py-3">', '<th>')
new_content = new_content.replace('<th scope="col" class="py-3 text-center">', '<th class="text-center">')

# Sneat badges
new_content = new_content.replace('bg-primary', 'bg-label-primary')
new_content = new_content.replace('bg-danger', 'bg-label-danger')
new_content = new_content.replace('bg-success', 'bg-label-success')
new_content = new_content.replace('bg-warning text-dark', 'bg-label-warning')

with open('web/ManageUsers.jsp', 'w') as f:
    f.write(new_content)

print("ManageUsers.jsp updated successfully.")
