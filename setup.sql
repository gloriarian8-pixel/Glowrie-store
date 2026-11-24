-- Run this in Supabase SQL Editor for the Glowrie project.
-- Adds the category field used by the updated admin form.
ALTER TABLE public.products
ADD COLUMN IF NOT EXISTS category text NOT NULL DEFAULT 'Beauty';

-- Admin-only product photo uploads to the existing public bucket named exactly: Glowrie.
-- The bucket should remain public so customers can view product photos.
DROP POLICY IF EXISTS "Glowrie admin can upload product photos" ON storage.objects;
CREATE POLICY "Glowrie admin can upload product photos"
ON storage.objects FOR INSERT TO authenticated
WITH CHECK (
  bucket_id = 'Glowrie'
  AND (auth.jwt() ->> 'email') = 'gloriarian8@gmail.com'
);

DROP POLICY IF EXISTS "Glowrie admin can update product photos" ON storage.objects;
CREATE POLICY "Glowrie admin can update product photos"
ON storage.objects FOR UPDATE TO authenticated
USING (
  bucket_id = 'Glowrie'
  AND (auth.jwt() ->> 'email') = 'gloriarian8@gmail.com'
)
WITH CHECK (
  bucket_id = 'Glowrie'
  AND (auth.jwt() ->> 'email') = 'gloriarian8@gmail.com'
);

DROP POLICY IF EXISTS "Glowrie admin can delete product photos" ON storage.objects;
CREATE POLICY "Glowrie admin can delete product photos"
ON storage.objects FOR DELETE TO authenticated
USING (
  bucket_id = 'Glowrie'
  AND (auth.jwt() ->> 'email') = 'gloriarian8@gmail.com'
);
