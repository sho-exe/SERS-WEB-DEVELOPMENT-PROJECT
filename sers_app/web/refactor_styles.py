import os
import re
import glob

style_pattern = re.compile(r'^[ \t]*<style>\s*\.card-action\s*\{.*?</style>\n*', re.DOTALL | re.MULTILINE)

link_tag = '    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/custom-styles.css" />\n'

jsp_files = glob.glob('*.jsp')

for filepath in jsp_files:
    if not filepath.endswith('.jsp') or 'backup_legacy_ui' in filepath:
        continue
        
    with open(filepath, 'r') as f:
        content = f.read()
        
    if '.card-action' in content and '<style>' in content:
        new_content = style_pattern.sub('', content)
        if new_content != content:
            if '</head>' in new_content and 'custom-styles.css' not in new_content:
                new_content = new_content.replace('</head>', link_tag + '</head>')
                
            with open(filepath, 'w') as f:
                f.write(new_content)
            print(f"Updated {filepath}")
