import re

with open('web/MyRegistrations.jsp', 'r') as f:
    content = f.read()

directives_match = re.search(r'(<%@page.*?%>\s*)*', content)
directives = directives_match.group(0) if directives_match else ''
directives = directives.strip() + "\n"

title_match = re.search(r'<h4[^>]*>.*?</i>\s*(.*?)\s*</h4>', content, re.DOTALL)
title = title_match.group(1).strip() if title_match else 'My Registrations'

start_marker = '<div class="container-fluid p-4" style="max-width: 900px;">'
end_marker = '</div>\n    </div>\n</div>'

start_idx = content.find(start_marker)
start_idx += len(start_marker)
end_idx = content.find(end_marker, start_idx)

inner_content = content[start_idx:end_idx].strip()

new_content = directives + """<%@ include file="header_sneat.jsp" %>

<h4 class="fw-bold py-3 mb-4">
    <span class="text-muted fw-light">SERS /</span> """ + title + """
</h4>

<style>
    .timeline { position: relative; padding-left: 2rem; margin-top: 2rem; }
    .timeline::before { content: ''; position: absolute; left: 0.5rem; top: 0; bottom: 0; width: 4px; background: #e9ecef; border-radius: 4px; }
    .timeline-item { position: relative; margin-bottom: 2rem; padding-left: 1.5rem; }
    .timeline-item::before { content: ''; position: absolute; left: -1.75rem; top: 0.5rem; width: 1.5rem; height: 1.5rem; background: var(--bs-primary); border: 4px solid #fff; border-radius: 50%; box-shadow: 0 0 0 2px rgba(0,0,0,0.1); z-index: 1;}
    .timeline-item.attended::before { background: var(--bs-success); }
    .timeline-item.missed::before { background: var(--bs-danger); }
    .timeline-item.pending::before { background: var(--bs-warning); }
</style>

<div class="row">
    <div class="col-md-10 col-lg-8">
""" + inner_content + """
    </div>
</div>

<%@ include file="footer_sneat.jsp" %>
"""

with open('web/MyRegistrations.jsp', 'w') as f:
    f.write(new_content)

print("MyRegistrations.jsp updated.")
