/* Find company names that start with 'C' or 'W' and contain 'ana'/'Ana' in the primary contact, excluding 'eana' */
SELECT name
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%')
  AND (primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%')
  AND primary_poc NOT LIKE '%eana%';
