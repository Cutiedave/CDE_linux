/* Find orders with standard_qty = 0 and gloss_qty or poster_qty over 1000 */
SELECT *
FROM orders
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);
