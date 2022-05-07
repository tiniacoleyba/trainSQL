-------------------- P1: group by staff_id ------------------------------
SELECT
    staff_id,
    SUM(amount) AS total_amount,
    MIN(DATE(payment_date)) AS min_payment_date,
    MAX(DATE(payment_date)) AS max_payment_date
FROM
    payment
GROUP BY
    staff_id
ORDER BY
    total_amount DESC
LIMIT 10;


-------------------- P2: group by customer_id ------------------------------
SELECT
    customer_id,
    SUM(amount) AS total_amount,
    MIN(DATE(payment_date)) AS min_payment_date,
    MAX(DATE(payment_date)) AS max_payment_date
FROM
    payment
GROUP BY
    customer_id
ORDER BY
    total_amount DESC
LIMIT 10;


-------------------- P3: implicit group by -------------------------------
SELECT
    SUM(amount) AS total_amount,
    MIN(DATE(payment_date)) AS min_payment_date,
    MAX(DATE(payment_date)) AS max_payment_date
FROM
    payment;


-------------------- P4: UNION ALL ---------------------------------------
SELECT
    NULL AS customer_id,
    staff_id,
    SUM(amount) AS total_amount,
    MIN(DATE(payment_date)) AS min_payment_date,
    MAX(DATE(payment_date)) AS max_payment_date
FROM
    payment
GROUP BY
    staff_id
UNION ALL
SELECT
    customer_id,
    NULL,
    SUM(amount) AS total_amount,
    MIN(DATE(payment_date)) AS min_payment_date,
    MAX(DATE(payment_date)) AS max_payment_date
FROM
    payment
GROUP BY
    customer_id
UNION ALL
SELECT
    NULL,
    NULL,
    SUM(amount) AS total_amount,
    MIN(DATE(payment_date)) AS min_payment_date,
    MAX(DATE(payment_date)) AS max_payment_date
FROM
    payment
ORDER BY
    total_amount DESC
LIMIT 10;


-------------------- P5: GROUPING SETS -----------------------------------
SELECT
    customer_id,
    staff_id,
    SUM(amount) AS total_amount,
    MIN(DATE(payment_date)) AS min_payment_date,
    MAX(DATE(payment_date)) AS max_payment_date
FROM
    payment
GROUP BY GROUPING SETS
    ((staff_id),(customer_id),())
ORDER BY
    total_amount DESC
LIMIT 10;


-------------------- P6: ROLLUP -----------------------------------------
SELECT
    customer_id,
    staff_id,
    SUM(amount) AS total_amount,
    MIN(DATE(payment_date)) AS min_payment_date,
    MAX(DATE(payment_date)) AS max_payment_date
FROM
    payment
GROUP BY ROLLUP
    (staff_id, customer_id)
ORDER BY
    total_amount DESC
LIMIT 10;


-------------------- P7: CUBE -----------------------------------------
SELECT
    customer_id,
    staff_id,
    SUM(amount) AS total_amount,
    MIN(DATE(payment_date)) AS min_payment_date,
    MAX(DATE(payment_date)) AS max_payment_date
FROM
    payment
GROUP BY CUBE
    (staff_id, customer_id)
ORDER BY
    total_amount DESC
LIMIT 20;
