def GCD(a,b):
    if a>b:
        return GCD(b,a)
    elif a==0:
        return b
    else:
        return GCD(b%a, a)

def LCM(a,b):
    return (a*b)//GCD(a,b)

def divisors(a, proper=True):
    l=set()
    for i in range(1,int(a**.5)+1):
        if a%i==0:
            l.add(i)
            l.add(a//i)
    if proper:
        l.remove(a)
    return l

def permutations(l):
    if len(l) <= 1:
        yield l
        return
    for i in range(len(l)):
        for p in permutations( l[:i] + l[i+1:] ):
            yield [l[i]] + p

def fibonaccis():
    f1 = 1
    f2 = 1
    yield f1
    yield f2
    while True:
        (f1, f2) = (f2, f1+f2)
        yield f2


# PRIMES
found_up_to=0
primes_list=[2,3]
primes_set={}

def find_primes(top_check, count=-1):
    global primes_list, found_up_to, primes_set
    primes_set=set(primes_list)
    for i in range(primes_list[-1]+2,top_check,2):
        if is_prime(i):
            primes_list.append(i)
            primes_set.add(i)
            if count > 0 and len(primes_list) >= count:
                return primes_list
    found_up_to=primes_list[-1]
    return(primes_list)


def is_prime(n):
    if n<2: return(False)
    if n in primes_set: return(True)
    for f in primes_list:
        if f*f > n:
            return True
        else:
            if n%f==0:
                return False
    return True

