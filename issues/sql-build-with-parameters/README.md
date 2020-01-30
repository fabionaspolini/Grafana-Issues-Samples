Build variables in SQL commands with Parameters (Don't interpolate string)

**What would you like to be added**:

I would like to change query build engine. Currently is interpolated command text string query and submit to DB Server. 

**Why is this needed**:

This is very bad because on refresh data, always is changed the command text query. That invalidate previously processed execute plan at the DB Server cache and cause Memory and CPU overhead.

In low concurrence environment, this detail does not affect much, but on medium/high concorrency enviroment makes it impossible to use the tool.
The database server has memory area do storad processed plans, when exists a application building a lot of command text different, this cache area purge othres plans already pre-processed and increases CPU consuption.