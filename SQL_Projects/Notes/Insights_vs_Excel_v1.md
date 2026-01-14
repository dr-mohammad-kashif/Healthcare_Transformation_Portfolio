# Insights vs Excel — v1

## Why method differences create truth differences

Even when the same metric is calculated in SQL and Excel, the results can differ in ways that materially affect interpretation. Each method embeds assumptions about grouping, missing values, and aggregation behavior, often implicitly. When those assumptions are not surfaced, analysts may treat numerical agreement or disagreement as evidence of correctness rather than as a signal to re-examine context.

Using average age by provider as an example, the metric collapses diverse patient distributions into a single summary value. Both SQL and Excel can return identical averages while obscuring clustering, skew, and differences in clinical complexity. Methodological differences do not merely alter outputs; they shape which aspects of reality are emphasized and which are hidden.

For this reason, disagreement between methods is not inherently an error. It is an interpretive signal that analytical truth depends as much on context and assumptions as it does on computation.
