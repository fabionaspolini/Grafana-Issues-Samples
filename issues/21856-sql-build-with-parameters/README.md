Build variables in SQL commands with Parameters (Don't interpolate string)

**What would you like to be added**:

I would like to change the query build engine. Currently is interpolated command text string query and submit to DB Server. 

**Why is this needed**:

This is very bad because on refresh data, always is changed the command text query. That invalidates previously processed execute plan at the DB Server cache and cause Memory and CPU overhead.

In a low concurrence environment, this detail does not affect much, but on medium/high concurrency environment makes it impossible to use the tool.
The database server has memory area do store processed plans, when exists an application building a lot of command text different, this cache area purge others plans already pre-processed and increases CPU consumption.

These settings greatly improve performance, especially in SQL Server.

**Simulate**
I created git repo with this case, execute instructions from markdown file to up an environment to test.
https://github.com/fabionaspolini/Grafana-Issues-Samples

**Proposed implementation**

This part from current query builder engine is very bad.
![current-builded-sql](https://user-images.githubusercontent.com/8163004/73482896-5092ea80-437d-11ea-9e30-40bb3e3ba341.png)

Here need use database params feature:
```sql
select *
from city
where stateid in @states
  and foundation_date BETWEEN @date_from AND @date_to
order by name;
```