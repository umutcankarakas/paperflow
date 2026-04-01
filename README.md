# PaperFlow

A Kanban-style task manager and literature review tracker for academic research groups. No server required — just a free Supabase database.

## Features

- **Kanban Board** — To Do / In Progress / Done columns with drag & drop
- **Literature Review** — Per-paper reference table with custom columns, status tags, row highlights, and drag-to-reorder
- **Task Details** — Descriptions, due dates, priorities, labels, assignees, comments
- **Archive** — Move tasks out of the board without deleting them
- **Activity Log** — See who changed what and when
- **Dashboard** — Overview of all papers with progress bars
- **People Management** — Add team members, assign to tasks
- **Real-time Sync** — All changes are instantly visible to everyone
- **Dark Mode**

---

## Setup

### 1. Create a Supabase project

1. Go to [supabase.com](https://supabase.com) and sign up for free
2. Click **New project**, give it a name, set a database password, pick a region

### 2. Run the schema

1. In your Supabase dashboard, open **SQL Editor**
2. Copy the contents of [`schema.sql`](./schema.sql)
3. Paste it in and click **Run**

### 3. Get your credentials

Go to **Settings → API** in your Supabase project and copy:
- **Project URL** — looks like `https://xxxxxxxxxxxx.supabase.co`
- **anon / public** key — the long JWT string

### 4. Deploy

**GitHub Pages (recommended)**

1. Fork this repository
2. Go to your fork's **Settings → Pages → Source: Deploy from branch → main → / (root)**
3. Your app will be live at `https://<your-username>.github.io/<repo-name>`
4. Open the URL, paste your Supabase credentials when prompted — done

**Run locally**

Just open `index.html` in any browser. No build step needed.

### 5. Share with your team

Send your teammates the URL. Everyone enters the same Supabase credentials on first load (stored locally in their browser — they only need to do this once).

---

## Usage tips

- Click **"You are"** in the sidebar to set your identity — your name will appear on comments and the activity log
- In the **Literature** tab, click any cell to edit it inline, drag rows to reorder, and click the colored circle to highlight a row
- Use **Manage Labels** to create colored tags you can attach to tasks
- The **Archive** view keeps finished work out of the board without losing it

---

## Tech stack

- Vanilla HTML/CSS/JS — single file, no build step
- [Supabase](https://supabase.com) for the database and real-time sync

## License

MIT
