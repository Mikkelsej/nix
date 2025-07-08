import os

# Input
semester_number = input("Enter the semester no.: ").strip()
semester = f"{semester_number}. Semester"
subjects = [s.strip() for s in input("Enter the subjects (comma-separated): ").split(',')]

# Base path
base_path = os.path.join("My Vault", "School", semester)
os.makedirs(base_path, exist_ok=True)

# --- Helper Functions ---

def write_file(path, content=""):
    with open(path, 'w', encoding='utf-8') as f:
        f.write(content)

def create_markdown_with_frontmatter(name, category):
    return f"""---
cssclasses:
  - dashboard
category: "[[{category}]]"
---
"""

def create_notes_dashboard(subjects, semester_number):
    dashboard = create_markdown_with_frontmatter("Notes", f"{semester_number}. Semester")
    for subject in subjects:
        dashboard += f"""
# {subject.upper()}

```dataview
list
from "School/{semester_number}. Semester/{subject}/Notes"
```
"""
    return dashboard.strip()

# --- Create Markdown files in semester root ---
# Notes.md – dynamic dashboard
notes_path = os.path.join(base_path, "Notes.md")
notes_content = create_notes_dashboard(subjects, semester_number)
write_file(notes_path, notes_content)

# Assignments.md and Litterature.md – basic frontmatter
for name in ["Assignments.md", "Litterature.md"]:
    path = os.path.join(base_path, name)
    write_file(path, create_markdown_with_frontmatter(name, semester))

# --- Todo Folder ---
todo_path = os.path.join(base_path, "Todo")
os.makedirs(todo_path, exist_ok=True)
write_file(os.path.join(todo_path, "Exercises Todo.md"))
write_file(os.path.join(todo_path, "Homework Todo.md"))

# --- Assignments Folder ---
assignments_path = os.path.join(base_path, "Assignments")
os.makedirs(assignments_path, exist_ok=True)
for name in ["Assignments Board.md", "Finished Assignments.md", "Unfinished Assignments.md"]:
    write_file(os.path.join(assignments_path, name))

# --- Subject folders ---
for subject in subjects:
    subject_path = os.path.join(base_path, subject)
    os.makedirs(subject_path, exist_ok=True)

    for folder in ['Assignments', 'Exam', 'Exercises PDF', 'Litterature', 'Notes', 'Slides']:
        os.makedirs(os.path.join(subject_path, folder), exist_ok=True)
