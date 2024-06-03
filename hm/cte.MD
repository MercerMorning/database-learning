1) Запрос суммы очков с группировкой и сортировкой по годам
```
SELECT sum(points), year_game FROM statistic group by year_game order by year_game
```
2) Cte суммы очков с группировкой и сортировкой по годам
```
WITH year_points AS (
    SELECT sum(points), year_game FROM statistic group by year_game order by year_game
) select * from year_points
```
3) Функцию LAG, чтобы вывести кол-во очков по всем игрокам за текущий код и за предыдущий
```
select
    LAG(SUM(points)) OVER (order by year_game) as last_year_points,
    sum(points) as current_year_points,
    year_game
from statistic
group by year_game
order by year_game desc;
```