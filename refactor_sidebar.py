import os
import re

WEB_DIR = "/Users/sho/s74644/sers/web"

def main():
    # Read Homepage_sneat.jsp to extract the sidebar
    homepage_path = os.path.join(WEB_DIR, "Homepage_sneat.jsp")
    with open(homepage_path, "r") as f:
        content = f.read()

    # Find the menu block
    menu_match = re.search(r'<!-- Menu -->\s*<aside id="layout-menu".*?<!-- / Menu -->', content, re.DOTALL)
    if not menu_match:
        print("Could not find menu block in Homepage_sneat.jsp")
        return

    menu_html = menu_match.group(0)

    # Prepare sidebar_sneat.jsp content
    sidebar_content = f'<%@page contentType="text/html" pageEncoding="UTF-8" %>\n<% String role = (String) session.getAttribute("accountType"); %>\n{menu_html}\n'

    sidebar_path = os.path.join(WEB_DIR, "sidebar_sneat.jsp")
    with open(sidebar_path, "w") as f:
        f.write(sidebar_content)
    
    print(f"Created {sidebar_path}")

    # Replace menu block in all JSP files in WEB_DIR (excluding subdirs and the sidebar files)
    for filename in os.listdir(WEB_DIR):
        if not filename.endswith(".jsp"):
            continue
        if filename in ["sidebar.jsp", "sidebar_backup.jsp", "sidebar_sneat.jsp", "footer_sneat.jsp", "header_sneat.jsp", "Login.jsp", "Logout.jsp"]:
            continue

        filepath = os.path.join(WEB_DIR, filename)
        with open(filepath, "r") as f:
            file_content = f.read()

        # Check if file has the menu block
        if re.search(r'<!-- Menu -->\s*<aside id="layout-menu".*?<!-- / Menu -->', file_content, re.DOTALL):
            new_content = re.sub(
                r'<!-- Menu -->\s*<aside id="layout-menu".*?<!-- / Menu -->',
                '<jsp:include page="sidebar_sneat.jsp" />',
                file_content,
                flags=re.DOTALL
            )
            with open(filepath, "w") as f:
                f.write(new_content)
            print(f"Updated {filename}")

if __name__ == "__main__":
    main()
