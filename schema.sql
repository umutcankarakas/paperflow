-- ============================================================
-- PaperFlow — Database Schema
-- Run this once in your Supabase SQL Editor to get started.
-- ============================================================

-- Papers
create table if not exists papers (
  id          text primary key,
  title       text not null,
  notes       text default '',
  url         text default '',
  status      text default 'reading',
  created_at  timestamptz default now()
);

-- People
create table if not exists people (
  id          text primary key,
  name        text not null,
  role        text default '',
  email       text default '',
  color       text default '',
  created_at  timestamptz default now()
);

-- Tasks
create table if not exists tasks (
  id          text primary key,
  paper_id    text not null references papers(id) on delete cascade,
  title       text not null,
  description text default '',
  status      text not null default 'todo',
  assignees   text[] default '{}',
  labels      text[] default '{}',
  priority    text default 'medium',
  due_date    date,
  created_at  timestamptz default now()
);

-- Task comments
create table if not exists comments (
  id          text primary key,
  task_id     text not null references tasks(id) on delete cascade,
  author_name text not null,
  content     text not null,
  created_at  timestamptz default now()
);

-- Activity log
create table if not exists activity (
  id          text primary key,
  paper_id    text references papers(id) on delete cascade,
  task_title  text default '',
  action      text not null,
  actor       text default 'Someone',
  created_at  timestamptz default now()
);

-- Labels
create table if not exists labels (
  id          text primary key,
  name        text not null,
  color       text not null default '#6B7280',
  created_at  timestamptz default now()
);

-- Literature review: column definitions (per paper)
create table if not exists lit_columns (
  id          text primary key,
  paper_id    text not null references papers(id) on delete cascade,
  label       text not null,
  type        text not null default 'text',  -- 'text' | 'url'
  sort_order  int default 0,
  created_at  timestamptz default now()
);

-- Literature review: rows (one per referenced paper)
create table if not exists lit_rows (
  id          text primary key,
  paper_id    text not null references papers(id) on delete cascade,
  data        jsonb not null default '{}',  -- { [column_id]: value }
  status      text default 'unread',
  highlight   text default '',              -- hex color or empty
  sort_order  int default 0,
  created_at  timestamptz default now()
);

-- ============================================================
-- Row Level Security (required by Supabase)
-- These policies allow full public access since PaperFlow
-- has no authentication. Only share your instance URL with
-- people you trust.
-- ============================================================

alter table papers      enable row level security;
alter table people      enable row level security;
alter table tasks       enable row level security;
alter table comments    enable row level security;
alter table activity    enable row level security;
alter table labels      enable row level security;
alter table lit_columns enable row level security;
alter table lit_rows    enable row level security;

create policy "public_all" on papers      for all using (true) with check (true);
create policy "public_all" on people      for all using (true) with check (true);
create policy "public_all" on tasks       for all using (true) with check (true);
create policy "public_all" on comments    for all using (true) with check (true);
create policy "public_all" on activity    for all using (true) with check (true);
create policy "public_all" on labels      for all using (true) with check (true);
create policy "public_all" on lit_columns for all using (true) with check (true);
create policy "public_all" on lit_rows    for all using (true) with check (true);
