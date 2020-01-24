{
int a, d = 2, b = 10;
int c = 2;
int t1 = 2 * 3;
int t2 = b + t1;
a = t2;
IF_BEGIN1:
{
IF_CONDITION1:
{
int t3 = a == b;
if (t3==0) goto IF_END1;
goto IF_CODE1;
}
IF_CODE1:
{
int t4 = c + 2;
a = t4;

}
}
IF_END1:
ELSE_BEGIN1:
{
ELSE_CODE1:
{
int t5 = a + 2;
a = t5;

}
}
ELSE_END1:

}
