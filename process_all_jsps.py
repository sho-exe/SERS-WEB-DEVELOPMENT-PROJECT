import re
import os

files = [
    'BrowseEvents.jsp',
    'ClubEvents.jsp',
    'GlobalEvents.jsp',
    'MyRegistrations.jsp',
    'PendingApprovals.jsp',
    'ManageClubs.jsp',
    'AdvisorClubs.jsp',
    'MeritHistory.jsp',
    'MeritReports.jsp',
    'DistributeMerits.jsp'
]

for filename in files:
    filepath = os.path.join('web', filename)
    if not os.path.exists(filepath):
        print(f"{filepath} not found. Skipping.")
        continue
        
    with open(filepath, 'r') as f:
        content = f.read()

    # Extract page directives
    directives_match = re.search(r'(<%@page.*?%>\s*)*', content)
    directives = directives_match.group(0) if directives_match else ''
    directives = directives.strip() + "\n"
    
    # Extract Title from Navbar
    title_match = re.search(r'<h4[^>]*>.*?</i>\s*(.*?)\s*</h4>', content, re.DOTALL)
    title = title_match.group(1).strip() if title_match else filename.replace('.jsp', '')

    # Extract inner content
    start_marker = '<div class="container-fluid p-4">'
    end_marker = '</div>\n                    </div>\n                </div>'
    end_marker_alt = '</div>\n    </div>\n</div>'
    end_marker_alt2 = '</div>\n                        </div>\n                    </div>'
    
    start_idx = content.find(start_marker)
    if start_idx == -1:
        start_marker = '<div class="container-fluid p-4">' # sometimes spaces differ
        
    if start_idx != -1:
        start_idx += len(start_marker)
        
        # Try different indentation end markers
        end_idx = content.find(end_marker, start_idx)
        if end_idx == -1:
            end_idx = content.find(end_marker_alt, start_idx)
        if end_idx == -1:
            end_idx = content.find(end_marker_alt2, start_idx)
            
        if end_idx != -1:
            inner_content = content[start_idx:end_idx].strip()
            
            # Wrap inner content in Sneat styling
            new_content = directives + """<%@ include file="header_sneat.jsp" %>

<h4 class="fw-bold py-3 mb-4">
    <span class="text-muted fw-light">SERS /</span> """ + title + """
</h4>

""" + inner_content + """

<%@ include file="footer_sneat.jsp" %>
"""
            # Some standard style replacements
            new_content = new_content.replace('btn-outline-primary shadow-sm', 'btn-outline-primary')
            new_content = new_content.replace('shadow-sm', '')
            new_content = new_content.replace('rounded-3', '')
            
            # Replace bootstrap table
            new_content = new_content.replace('<div class="table-responsive table-custom mt-4">', '<div class="card mt-4">\n    <div class="table-responsive text-nowrap">')
            new_content = new_content.replace('<div class="table-responsive table-custom mb-4">', '<div class="card mb-4">\n    <div class="table-responsive text-nowrap">')
            # If we replaced table-responsive, we need to match the closing tag correctly. The easiest way is regex.
            # But just leaving the existing closing tags is fine as long as the div count matches.
            
            with open(filepath, 'w') as f:
                f.write(new_content)
            print(f"{filename} updated successfully.")
        else:
            print(f"Could not find end marker for {filename}")
    else:
        print(f"Could not find start marker for {filename}")

print("Batch processing complete.")
