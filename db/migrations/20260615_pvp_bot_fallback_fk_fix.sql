-- 20260615_pvp_bot_fallback_fk_fix.sql
-- Bot-fallback PvP matches write a synthetic id "bot_fallback_<roomId>" into
-- pvp_rooms.player2_tg_user_id (and into winner_tg_user_id when the bot wins).
-- That id has no row in public.users, so the FKs to public.users rejected the
-- pvp_start_bot_match_with_stake UPDATE — the bot was never substituted, and a
-- bot win could not be finalized. Drop those two FKs (player1_tg_user_id keeps
-- its FK — player1 is always a real user). Idempotent.

alter table public.pvp_rooms drop constraint if exists pvp_rooms_player2_tg_user_id_fkey;
alter table public.pvp_rooms drop constraint if exists pvp_rooms_winner_tg_user_id_fkey;
