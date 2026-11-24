# Glowrie storefront — Supabase-connected starter

Brand: Glowrie — “Little luxuries. Everyday glow.”

## Before deployment
1. Open `config.js` in a text editor.
2. Replace `PASTE_YOUR_SUPABASE_PUBLISHABLE_KEY_HERE` with the Supabase **publishable** key from Project Settings → API Keys.
3. Do not use a `service_role` or secret key in the website.
4. Upload the contents of the `glowrie-store` folder to Netlify (or deploy the ZIP contents using Netlify Drop).

## Included
- Public product listing from the Supabase `products` table, showing only rows where `active = true`.
- Supabase email/password sign-in restricted in the interface to `gloriarian8@gmail.com`.
- Admin product creation, editing, hiding/showing and deletion, plus stock management.
- Admin-only order list reading from `orders`.
- WhatsApp checkout handoff to +254717424442.

## Important limitations
- Product images currently use an image URL; image upload/storage bucket setup is not included.
- WhatsApp checkout does not create a database order. A secure server-side checkout function is still required before customer orders can be saved in Supabase.
- M-Pesa Daraja is not integrated. Manual M-Pesa confirmation/WhatsApp is the current process.
- The Supabase publishable key is intended for browser use; database security depends on correct RLS policies. Test admin access and public access before taking live orders.
