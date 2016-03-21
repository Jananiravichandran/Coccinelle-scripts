virtual f_found

@a depends on !f_found exists@
  identifier f;
  expression e, e1;
  position p;
  statement S1, S2;
@@

  e = f(...)
  ...when != e = e1
(
  if(e == NULL || ISERR(e) || ...)@p S1 else S2
|
  if(IS_ERR_OR_NULL(e) || ...)@p S1 else S2
)
  

@script:ocaml@
p << a.p;
f << a.f;
@@

  let it = new iteration() in
  it#add_virtual_rule F_found;
  it#add_virtual_identifier F f;
  it#add_virtual_identifier P p;
  it#register()

@b depends on f_found exists@
  identifier virtual.f;
  position p;
  expression e, x;
@@

  f@p(...) 
  {
  ...when any
(
  return NULL;
|
  x = NULL;
  ... when != x = e 
  return x;
)
  }

@c depends on f_found exists@
  identifier virtual.f;
  position p1;
  expression e, x;
@@
  
  f@p1(...)
  {
  ... when any
(
  return ERR_PTR(...);
|
  x = ERR_PTR(...)
  ... when != x = e
  return x;
)
  }

@script:python@
p << b.p;
p1 << c.p1;
f << virtual.f;
@@
cocci.include_match(False)

@script:python@
p1 << b.p;
p << virtual.p;
@@
print "%s %s: :%s" %("Do not check for ERR pointer here:",p[0].file,p[0].line)

@script:python@
p1 << c.p1;
p << virtual.p;
@@
print "%s %s: :%s" %("Do not check for NULL pointer",p[0].file,p[0].line)
