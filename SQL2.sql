SELECT  tmp.id,
        tmp.name,
        (SELECT pr.price FROM price AS pr
            WHERE pr.type_id = 1 AND pr.product_id = tmp.id
        ) AS price_type1,
        (SELECT pr.price FROM price AS pr
            WHERE pr.type_id = 2 AND pr.product_id = tmp.id
        ) AS price_type2,
        (SELECT pr.price FROM price AS pr
            WHERE pr.type_id = 5 AND pr.product_id = tmp.id
        ) AS price_type5
FROM (SELECT prod.id,
      prod.name
FROM products AS prod,
      price AS pr
WHERE prod.id = pr.product_id
GROUP BY prod.id,
      prod.name
) AS tmp