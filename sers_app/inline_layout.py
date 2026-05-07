import os

with open('web/header_sneat.jsp', 'r') as f:
    header_content = f.read()

with open('web/footer_sneat.jsp', 'r') as f:
    footer_content = f.read()

# Make sure to remove the first line of header_content if it's `<%@page contentType="text/html" pageEncoding="UTF-8"%>`
# so we don't have duplicate page directives in the JSPs.
first_newline = header_content.find('\n')
if first_newline != -1 and '<%@page ' in header_content[:first_newline]:
    header_content = header_content[first_newline+1:]

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
    'DistributeMerits.jsp',
    'ManageUsers.jsp',
    'ManageEvents.jsp'
]

count = 0
for filename in files:
    filepath = os.path.join('web', filename)
    if not os.path.exists(filepath):
        continue
        
    with open(filepath, 'r') as f:
        content = f.read()

    if '<%@ include file="header_sneat.jsp" %>' in content:
        content = content.replace('<%@ include file="header_sneat.jsp" %>', header_content)
        content = content.replace('<%@ include file="footer_sneat.jsp" %>', footer_content)
        
        with open(filepath, 'w') as f:
            f.write(content)
        print(f"Inlined layout for {filename}")
        count += 1

print(f"Processed {count} files.")

if count > 0:
    os.remove('web/header_sneat.jsp')
    os.remove('web/footer_sneat.jsp')
    print("Deleted header_sneat.jsp and footer_sneat.jsp")

