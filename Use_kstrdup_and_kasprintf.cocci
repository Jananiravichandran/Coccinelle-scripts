@@
expression A, arg;
constant FLAG;
statement S;
@@

- A = kzalloc(strlen(arg)+1, FLAG)
+ A = kstrdup(arg, FLAG)
  <...when != A
  if(A == NULL || ...) S
  ...>
- strcpy(A, arg);

@@
expression A, E1, E2;
expression arg, exp, size;
expression e;
constant FLAG;
statement S;
@@

- size = strlen(arg)+exp;
  ... when != size = e
- A = kzalloc(size, FLAG);
+ A = kasprintf(FLAG, E1, arg, E2);   
  <...when != A 
  if(A == NULL || ...) S
  ...>
- snprintf(A, size, E1, arg, E2);
