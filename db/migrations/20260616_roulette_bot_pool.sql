-- 20260616_roulette_bot_pool.sql
-- Пул бот-«игроков» для рулетки. Подставляются одинокому игроку, если за BOT_FALLBACK_SECONDS
-- (см. api/roulette.js) не пришёл второй игрок: бот ставит сумму, равную ставке игрока.
--
-- Зачем реальные строки в users: FK roulette_bets.user_id, roulette_results.winner_user_id и
-- pvp_balance_events.tg_user_id ссылаются на users(tg_user_id), а getRoundBets делает users!inner.
-- Баланс бота НЕ используется и НЕ начисляется (выигрыш бота — это удержанная ставка живого
-- игрока, т.е. доход дома; при выигрыше игрока «взнос» бота финансирует дом). Бот не логинится
-- и не выводит средства. Идентификаторы должны совпадать с ROULETTE_BOT_IDS в api/roulette.js.
-- Идемпотентно: повторный запуск безопасен.

-- Имена взяты из общего пула ников ботов (pvpPickBotName в api/user.js), чтобы бот рулетки
-- выглядел как обычный игрок. Кол-во строк = ROULETTE_BOT_COUNT в api/roulette.js.
insert into public.users (tg_user_id, first_name) values
  ('roulette_bot_1',  'silentorbit'),
  ('roulette_bot_2',  'velvetpulse'),
  ('roulette_bot_3',  'neonwhisper'),
  ('roulette_bot_4',  'lunarhabit'),
  ('roulette_bot_5',  'frostecho'),
  ('roulette_bot_6',  'urbanmirage'),
  ('roulette_bot_7',  'hazydrift'),
  ('roulette_bot_8',  'nightartifact'),
  ('roulette_bot_9',  'solsticeframe'),
  ('roulette_bot_10', 'brokenzen'),
  ('roulette_bot_11', 'staticbloom'),
  ('roulette_bot_12', 'wildparadox'),
  ('roulette_bot_13', 'cobaltveil'),
  ('roulette_bot_14', 'dreampayload'),
  ('roulette_bot_15', 'ghostsyntax'),
  ('roulette_bot_16', 'ambervoid'),
  ('roulette_bot_17', 'pixelwander'),
  ('roulette_bot_18', 'ironhorizon'),
  ('roulette_bot_19', 'fadedcompass'),
  ('roulette_bot_20', 'lucidtempo'),
  ('roulette_bot_21', 'softrebellion'),
  ('roulette_bot_22', 'vaporlogic'),
  ('roulette_bot_23', 'hiddenvector'),
  ('roulette_bot_24', 'astralhabit'),
  ('roulette_bot_25', 'quietoverdrive'),
  ('roulette_bot_26', 'randompilgrim'),
  ('roulette_bot_27', 'crystalglitch'),
  ('roulette_bot_28', 'humanarchive'),
  ('roulette_bot_29', 'neonmonk'),
  ('roulette_bot_30', 'voidjournal')
on conflict (tg_user_id) do nothing;
