-- Run this in Supabase SQL Editor
-- Adds permissive RLS policies so the app can upload/download from storage

-- hr-documents bucket
CREATE POLICY "allow_select_hr_documents" ON storage.objects
  FOR SELECT USING (bucket_id = 'hr-documents');

CREATE POLICY "allow_insert_hr_documents" ON storage.objects
  FOR INSERT WITH CHECK (bucket_id = 'hr-documents');

CREATE POLICY "allow_update_hr_documents" ON storage.objects
  FOR UPDATE USING (bucket_id = 'hr-documents');

CREATE POLICY "allow_delete_hr_documents" ON storage.objects
  FOR DELETE USING (bucket_id = 'hr-documents');

-- hr-policies bucket
CREATE POLICY "allow_select_hr_policies" ON storage.objects
  FOR SELECT USING (bucket_id = 'hr-policies');

CREATE POLICY "allow_insert_hr_policies" ON storage.objects
  FOR INSERT WITH CHECK (bucket_id = 'hr-policies');

CREATE POLICY "allow_update_hr_policies" ON storage.objects
  FOR UPDATE USING (bucket_id = 'hr-policies');

CREATE POLICY "allow_delete_hr_policies" ON storage.objects
  FOR DELETE USING (bucket_id = 'hr-policies');
