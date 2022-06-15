SELECT point_nu
      ,rank() over(order by point_nu desc) rnk
      ,dense_rank() over(order by point_nu desc) rnk
  FROM t_greport