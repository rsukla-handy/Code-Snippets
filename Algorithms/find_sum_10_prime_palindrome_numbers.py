
from itertools import islice
from math import sqrt
from itertools import count

print sum([10 + i for i, prime in enumerate([all(n % i for i in islice(count(2), int(sqrt(n)-1))) for n in xrange(10, 1000)]) if prime and str(10 + i) == str(10 + i)[::-1]][0:10])