# Advanced query build

Advanced query builder with conditionals expressions.

**What would you like to be added**:

I would like to increase query builder engine syntax.

**Why is this needed**:

When use multi selection variables don't is possible build a performatic query, because query builder include all items into string interpolated.
Even with the "Custom all value" feature don't resolve my problem.

In fictitious example bellow, i need retrive all cities from states:

Grafana metric sql:

```sql
select *
from city
where stateid in ($states)
order by name;
```

Generated SQL when select all:

```sql
select *
from city
where stateid in ('AL','KS','RJ','SC','SP','TX')
order by name;
```

I would like to have the ability to manipulate generation command text query removing the "where"clause, generating this output query:


```sql
select *
from city
order by name;
```

But continue includ options when select 1 or N-1 values.

```sql
select *
from city
where stateid in ('AL','KS')
order by name;
```

**Proposed implementation**

Interop query parser with JS syntax, example:

```sql
select *
from city
${ states.length === 0 ? "" : "where stateid in ($states)" }
order by name;
```

This example I use a simple ternary expression wich makers query generation much more powerfull and flexible.

Execution pipeline must execute JS expression to transform
...${ states.length === 0 ? "" : "where stateid in ($states)" }...
in
...where stateid in ($states)"...

and send new outpur to actual string interpolation processor, to transform in:
...where stateId in ('AL','KS')...

Idea is use another functions for JS language, like switch or more complex block.

```js
select *
from city
where stateId = ${ switch(states) {
                     case "AL": return 1;
                     case "KS": return 2;
                     default: return ""; } }
${
  if (states.length === 0) return;
  var firstState = states[0];
  if (a === "AL") return "and stateName = 'Alabama'";
  return "and stateName <> 'Alabama'";
}
order by name;
```

In my real use cases this will greatly increase performance and result in a great experience for my users with dashboards.

Notes: At another Issue #21856 I requested a change that will need to move the builder from querying to the backend.
