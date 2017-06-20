def GCD(a,b):
    if a>b:
        return GCD(b,a)
    elif a==0:
        return b
    else:
        return GCD(b%a, a)

def LCM(a,b):
    return (a*b)//GCD(a,b)
