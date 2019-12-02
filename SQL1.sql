SELECT DISTINCT
      tmp.department,
      tmp.parent_department,
      tmp.cnt_users 
  FROM (SELECT dp.name AS department,
       pdp.name AS parent_department,
       (SELECT count(*)  FROM users AS u
                        WHERE u.department_id = dp.id
       ) AS cnt_users,
       usr.birthday
  FROM  parent_departments AS pdp
      LEFT OUTER JOIN departments AS dp ON dp.parent_id = pdp.id
      LEFT OUTER JOIN users AS usr ON usr.department_id = dp.id
  ) AS tmp

  WHERE tmp.cnt_users > 1 
        AND tmp.birthday > '01.01.1990'

  ORDER BY  tmp.cnt_users,
            tmp.parent_department ASC,
            tmp.department ASC