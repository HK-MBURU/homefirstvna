-- Run this in Supabase SQL Editor (https://supabase.com/dashboard/project/itmjloxdkpotnisajuvb/sql)

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS employees (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  employee_id TEXT UNIQUE NOT NULL,
  full_name TEXT NOT NULL,
  department TEXT,
  position TEXT,
  email TEXT,
  phone TEXT,
  hire_date DATE,
  status TEXT DEFAULT 'Active',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS documents (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  employee_id UUID REFERENCES employees(id) ON DELETE CASCADE,
  type TEXT NOT NULL,
  custom_name TEXT,
  issue_date DATE,
  expiration_date DATE,
  doc_number TEXT,
  issuing_authority TEXT,
  file_name TEXT,
  storage_path TEXT,
  dropbox_id TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS policies (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  name TEXT NOT NULL,
  category TEXT,
  version TEXT,
  effective_date DATE,
  review_date DATE,
  description TEXT,
  tags TEXT,
  file_name TEXT,
  storage_path TEXT,
  upload_date DATE,
  dropbox_id TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Disable RLS (internal tool with its own admin password)
ALTER TABLE employees DISABLE ROW LEVEL SECURITY;
ALTER TABLE documents DISABLE ROW LEVEL SECURITY;
ALTER TABLE policies DISABLE ROW LEVEL SECURITY;
