@a@
type T;
identifier x;
statement s;
@@
(
  if (...) 
  { 
    ... when strict
    return ...;
  }
  else
  {
   ...
   T x; 
   ...
  }
|
  if (...)
  {
   ... when strict
   return ...;
  }
- else
- {
    ...
- }
|

  if(...)
  {
   ... when strict
   return ...;
  }
- else
   s
)


