@@
expression a, b, c, d;
statement S1, S2;
@@

(
- if((a = b))
+ a = b;
+ if(a)
  S1 else S2
|
- if(((a = b)&&c))
+ a = b;
+ if(a&&c)
  S1 else S2
|
- if(((a = b)||c))
+ a = b;
+ if(a||c)
  S1 else S2
)
