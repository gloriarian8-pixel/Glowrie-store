# Glowrie storefront — updated deployment package

Brand: Glowrie — “Little luxuries. Everyday glow.”

## What is included
- Mobile-friendly Glowrie storefront.
- Supabase product listing and admin sign-in.
- Product name, category, description, price, stock, visibility, edit and delete.
- Product photo upload from a phone to the existing Supabase Storage bucket named exactly `Glowrie`, or an image URL.
- Admin order list (for orders created by a future secure checkout integration).
- WhatsApp checkout handoff to +254717424442.

## Before deploying this updated version
1. In Supabase, open SQL Editor for the Glowrie project.
2. Open `setup.sql`, copy all its contents, paste into SQL Editor, and run it. This adds the `category` column and admin-only photo upload policies.
3. Confirm the Storage bucket is named exactly `Glowrie` and is set to Public so customers can view product images. The SQL policies restrict uploads/changes/deletions to the authenticated admin email `gloriarian8@gmail.com`.
4. Keep the existing `config.js` file with the Supabase project URL and publishable key. Never replace the publishable key with a service-role or secret key.
5. Deploy the contents of this folder (the files inside the ZIP, not the ZIP itself) to the existing Netlify site only after the SQL step is complete.

## Important limitations
- WhatsApp checkout opens a prepared message; it does not automatically create a row in the Supabase `orders` table.
- M-Pesa Daraja online payment is not integrated. Payment is arranged/confirmed manually on WhatsApp.
- Do not enable public write access to products, orders, payments, or Storage. Keep the existing database Row Level Security policies.
