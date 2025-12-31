# Project Custom Field Format

This plugin adds a new custom field format to Redmine that allows selecting
one or multiple projects from a hierarchical list.

The hierarchy is displayed using numeric paths (e.g. `2.1.3`) instead of
visual indentation characters, making it stable and compatible with
Redmine 6.x and future versions.

---

## Features

- New custom field format: **Project**
- Supports **single and multiple selection**
- Displays projects using **hierarchical numeric paths**

1. Project A
2. Project B
2.1. Project B - Subproject
2.1.1. Project B - Child

- Includes **all projects** (parent and child projects)
- No database migrations required
- No core patches
- Compatible with **Redmine 5.1 – 6.1**

---

## Installation

1. Clone the plugin into your Redmine `plugins` directory:

```bash
git clone https://github.com/Arksoft-Solutions/redmine_project_custom_field


2. Restart Redmine to load the plugin.

- The restart method depends on your environment (Passenger, Puma, Docker, etc.).

--- 

## Usage

1. Go to Administration → Custom fields
2. Create a new Issue custom field
3. Select Format: Project
4. Enable Multiple values if required
5. Save the custom field

The field will now appear as a project selector when creating or editing issues.

---

## Compatibility

- 5.1.x 
- 6.0.x
- 6.1.x

---

## How to works

- The plugin defines a new FieldFormat that extends Redmine’s List format
- Projects are retrieved using Redmine’s visibility rules
- Hierarchy is calculated from the project tree (lft order)
- Numeric paths are generated dynamically for display
- No project filtering is applied (parent and child projects are always visible)

---

## Limitations

- This format is intended for Issue custom fields
- It does not replace Redmine’s built-in project selector
- Numeric hierarchy is calculated at runtime (no caching)

---

## License

This plugin is released under the MIT License.

--- 

## Author

- Company: Arksoft Solutions
- Author: Jorge Rodriguez
- Email: jrodriguez@arksoft.com.ar
- Web: https://arksoft.ar
- GitHub: https://github.com/Arksoft-Solutions

---

## Contributing

- Pull requests, issues, and suggestions are welcome
- Please, include the Redmine version you are using when reporting bugs.
