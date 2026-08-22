SELECT 
    u.first_name || ' ' || u.last_name AS nama_customer,
    COUNT(DISTINCT oi.order_id) AS jumlah_transaksi,
    ROUND(SUM(oi.sale_price), 2) AS total_pembelian
FROM bigquery-public-data.thelook_ecommerce.order_items oi
INNER JOIN bigquery-public-data.thelook_ecommerce.users u ON u.id = oi.user_id
WHERE status = 'Complete'
GROUP BY u.id, nama_customer
ORDER BY total_pembelian DESC
LIMIT 10;



# 5 country dengan jumlah order terbesar.
# OPSI 1 : pake tabel users dan orders items
SELECT u.country,
       COUNT(DISTINCT(o.order_id)) AS jumlah_order
FROM bigquery-public-data.thelook_ecommerce.users u
INNER JOIN bigquery-public-data.thelook_ecommerce.order_items o
ON u.id = o.user_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
# OPSI 2 : pake tabel users dan orders
SELECT u.gender,
       u.country,
       COUNT(*) AS jumlah_order
FROM bigquery-public-data.thelook_ecommerce.users u
INNER JOIN bigquery-public-data.thelook_ecommerce.orders o
ON u.id = o.user_id
GROUP BY 1,2
ORDER BY 2 DESC
LIMIT 5;

-- SELECT
-- COUNT(order_id) AS COUNT_ORDER,
-- COUNT(DISTINCT(order_id)) AS COUNT_UNIQUE_ORDER FROM bigquery-public-data.thelook_ecommerce.orders

# Country mana yang berada di ranking 1?
SELECT u.country,
       COUNT(*) AS jumlah_order
FROM bigquery-public-data.thelook_ecommerce.users u
INNER JOIN bigquery-public-data.thelook_ecommerce.orders o
ON u.id = o.user_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
# Berapa total order country tersebut?
# Apakah ranking berubah ketika hanya Complete order yang dihitung?
SELECT u.country,
       COUNT(*) AS jumlah_order
FROM bigquery-public-data.thelook_ecommerce.users u
INNER JOIN bigquery-public-data.thelook_ecommerce.orders o
ON u.id = o.user_id
WHERE o.status = 'Complete'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
# Status order apa yang paling banyak?
SELECT status,
       COUNT(*) AS jumlah_order
FROM bigquery-public-data.thelook_ecommerce.orders o
GROUP BY 1
ORDER BY 2 DESC;
