/* Find company names that start with 'C' or 'W' and contain 'ana'/'Ana' in the primary contact, excluding 'eana' */
SELECT company_name
FROM companies
WHERE (company_name LIKE 'C%' OR company_name LIKE 'W%')
  AND (primary_contact LIKE '%ana%' OR primary_contact LIKE '%Ana%')
  AND primary_contact NOT LIKE '%eana%';
